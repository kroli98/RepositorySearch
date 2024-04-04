//
//  ListElementViewModel.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

class ListElementViewModel: ObservableObject {
    
    var query: String
    @Published var repos: [RepositoryModel] = []
    @Published var isLoading = false
    
    init(query: String) {
        self.query = query
    }
    
    func getRepos() {
        isLoading = true
        
        WebService().fetchRepositories(query: query) { (fetchedRepos: [RepositoryModel]?) in
               if let fetchedRepos = fetchedRepos {
                   self.repos = fetchedRepos
                   self.isLoading = false
               }
           }
       }
}
