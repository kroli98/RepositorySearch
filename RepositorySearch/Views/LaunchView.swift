//
//  LaunchView.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 02/04/2024.
//

import SwiftUI

struct LaunchView: View {
    
    @ObservedObject private var launchViewModel = LaunchViewModel()
    var body: some View {
        
        VStack{
            Text("Repository keresés")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            HStack{
                Image(systemName: "pencil")
                    .padding(.leading)
                Divider()
                TextField("Keresendő repository", text: $launchViewModel.inputText)
                
            }
            
            .frame(height: 50)
            .background(.gray)
            .font(.title2)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            .padding()
            
            
            Button(action: {
                if !launchViewModel.isButtonDisabled{
                    
                }
            }, label: {
                Text("Keresés")
                    .frame(width: 200)
                    .frame(height: 50)
                    .background(.blue)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            })
            
            
            Spacer()
        }
        .alert("Add meg a keresendő repositoryt", isPresented: $launchViewModel.showAlert){ Button("OK", role: .cancel){}
        }
    }
        
}

#Preview {
    LaunchView()
}
