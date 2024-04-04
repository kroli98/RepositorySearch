//
//  WebService.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

class WebService {
    
    func fetchRepositories(query: String, completion: @escaping ([RepositoryModel]?) -> ()) {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Hiba az repositoryk lekérésekor: \(error?.localizedDescription ?? "Ismeretlen hiba")")
                completion(nil)
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8))
                let result = try JSONDecoder().decode(RepositorySearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result.items)
                }
            } catch {
                print("Hiba a repositoryk dekódolásakor: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
