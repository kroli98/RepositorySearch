//
//  RepositoryModel.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

struct RepositoryModel: Codable{
    
    var name: String
    var description: String
    var starCount: Int
    var lastUpdateDate: Date
    var owner: String
    var avatarUrl: URL
    var githubUrl: URL
    var forkCount: Int
    var createDate: Date
}
