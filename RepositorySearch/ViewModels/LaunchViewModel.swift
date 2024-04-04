//
//  LaunchViewModel.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import Foundation

class LaunchViewModel: ObservableObject{
    
    @Published var inputText = ""
    @Published var showAlert = false
    
    
    var isButtonDisabled: Bool {
        if inputText.isEmpty{
            showAlert = true
            return true
        }
        return false
    }
}
