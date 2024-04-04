//
//  RepositoryListView.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var listElementViewModel: RepositoryListViewModel
    @Environment(\.presentationMode) var presentationMode
  
    
    init(query: String) {
        self.listElementViewModel = RepositoryListViewModel(query: query)
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Button("Bezár"){
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 150)
                .frame(height: 50)
                .background(.blue)
                .font(.title)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .padding()
                
                Divider()
                
                
                List {
                    
                    ForEach(listElementViewModel.repos.indices, id: \.self) { index in
                        NavigationLink{
                            ListElementDetailView(repo: listElementViewModel.repos[index])
                        } label: {
                            ListElementCardView(repo: listElementViewModel.repos[index])
                        }
                    }
                }
                
                .scrollContentBackground(.hidden)
                
                .overlay{
                    if listElementViewModel.isLoading {
                        ProgressView("Keresés...")
                            .controlSize(.large)
                        
                    }
                    
                    
                }
                
                
                
                
            }
            .background(Color(UIColor.systemGray6))
            .alert("Hiba", isPresented: $listElementViewModel.showErrorAlert ) {
                Button("OK") {
                    listElementViewModel.showErrorAlert = false
                    listElementViewModel.error = nil
                    presentationMode.wrappedValue.dismiss()
                }
            } message: {
                if let error = listElementViewModel.error {
                    Text("\(WebService().getErrorMessage(error: error))")
                }
            }
            
        }
    }
}

#Preview {
    RepositoryListView(query: "swift")
}
