//
//  RepositorySearchResponseModel.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 04/04/2024.
//

import Foundation
struct RepositorySearchResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [RepositoryModel]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
