//
//  RepositoryModel.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

struct RepositoryModel: Codable {
   
    let name: String
    let description: String?
    let gitUrl: String
    let stargazersCount: Int
    let forksCount: Int
    let createdAt: String
    let updatedAt: String
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
           case name
           case description
           case gitUrl = "git_url"
           case stargazersCount = "stargazers_count"
           case forksCount = "forks_count"
           case createdAt = "created_at"
           case updatedAt = "updated_at"
           case owner
       }
    
    static func formatDateString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "hu_HU")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "hu_HU")
        outputFormatter.dateStyle = .medium
        outputFormatter.timeStyle = .short
        
        return outputFormatter.string(from: date)
    }
}
extension RepositoryModel {
    static func getSampleRepo() -> RepositoryModel {
        let owner = Owner(login: "apple", avatarUrl: "https://avatars.githubusercontent.com/u/10639145?v=4", htmlUrl: "https://github.com/apple")
               
               return RepositoryModel(name: "swift",
                                      description: "The Swift Programming Language",
                                      gitUrl: "https://github.com/apple",
                                      stargazersCount: 65734,
                                      forksCount: 10184,
                                      createdAt: "2015-10-23T21:15:07Z",
                                      updatedAt: "2024-04-04T08:50:05Z",
                                      owner: owner)
    }
}

struct Owner: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}
