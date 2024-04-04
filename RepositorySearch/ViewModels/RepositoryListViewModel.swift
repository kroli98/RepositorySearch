//
//  ListElementViewModel.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

class RepositoryListViewModel: ObservableObject {
    
    var query: String
    var isFirstLoad = true
    @Published var repos: [RepositoryModel] = []
    @Published var error: NetworkError?
    @Published var isLoading = false
    @Published var showErrorAlert: Bool
    
    
    init(query: String) {
        
        self.query = query
        self.showErrorAlert = false
        loadRepos()
        
    }
    
    func loadRepos() {
        
        guard isFirstLoad else { return }
        isFirstLoad = false
        
        isLoading = true
        
        
        WebService().fetchRepositories(query: query) { [weak self] result in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                
                self?.isLoading = false
                switch result {
                case .success(let repos):
                    self?.repos = repos
                case .failure(let error):
                    self?.error = error
                    self?.showErrorAlert = true
                }
                
            }
            
            
        }
    }
}
