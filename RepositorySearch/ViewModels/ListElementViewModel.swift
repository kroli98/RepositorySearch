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
    
    init(query: String) {
        self.query = query
    }
    
    func getRepos() {
           WebService().fetchRepositories(query: query) { (fetchedRepos: [RepositoryModel]?) in
               if let fetchedRepos = fetchedRepos {
                   self.repos = fetchedRepos
               }
           }
       }
}
