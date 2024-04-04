//
//  WebService.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

class WebService {
    
  
    func getErrorMessage(error: NetworkError) -> String {
        switch error {
        case .serviceUnavailable:
            return "A szolgáltatás átmenetileg nem elérhető. Kérjük, próbálkozzon újra később."
        case .validationError:
            return "A validáció sikertelen volt, vagy az elérési pontot túlterhelték."
        case .noData:
            return "Nincs megjelenítendő adat."
        case .decodingError:
            return "Hiba a dekódoláskor."
        case .transportError:
            return "Kommunikációs hiba lépett fel a szerverrel történő kapcsolat során. Kérjük, ellenőrizze az internetkapcsolatát, majd próbálkozzon újra."
        case .invalidServerResponse:
            return "Érvénytelen szerverválasz."
        }
    }
    
    func fetchRepositories(query: String, completion: @escaping (Result<[RepositoryModel], NetworkError>) -> ()) {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.transportError))
                return
            }
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                switch response.statusCode {
                case 422:
                    completion(.failure(.validationError))
                case 503:
                    completion(.failure(.serviceUnavailable))
                default:
                    completion(.failure(.invalidServerResponse))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                
                let result = try JSONDecoder().decode(RepositorySearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result.items))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}

enum NetworkError: Error {
    case transportError
    case invalidServerResponse
    case validationError
    case serviceUnavailable
    case noData
    case decodingError
}

