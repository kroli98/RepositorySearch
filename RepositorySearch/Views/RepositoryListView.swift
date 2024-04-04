//
//  RepositoryListView.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var listElementViewModel: ListElementViewModel
    @Environment(\.presentationMode) var presentationMode

    init(query: String) {
        self.listElementViewModel = ListElementViewModel(query: query)
    }
    
    var body: some View {
        
        VStack{
            Button("Bezár"){
                presentationMode.wrappedValue.dismiss()
            }
            
            .padding()
            
            List {
                
                ForEach(listElementViewModel.repos.indices, id: \.self) { index in
                    ListElementCardView(repo: listElementViewModel.repos[index])
                }
            }
            .scrollContentBackground(.hidden)
        
          
            
            .task{
                listElementViewModel.getRepos()
            }
            
        }
        .background(Color(UIColor.systemGray6))
        
    }
}

#Preview {
    RepositoryListView(query: "swift")
}
