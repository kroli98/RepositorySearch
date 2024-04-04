//
//  ListElementCardView.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import SwiftUI

struct ListElementCardView: View {
    var repo: RepositoryModel
    
    var body: some View {
        HStack(alignment: .center)
        {
            VStack(alignment: .leading){
                Text(repo.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text(repo.description ?? "")
                    .font(.caption)
            }
            VStack{
                Image(systemName: "star")
                
                Image(systemName: "arrow.up.circle.badge.clock")
            }
            
            .font(.caption)
            VStack(alignment: .leading){
                HStack{
                   
                    Text("\(repo.stargazersCount)")
                }
                HStack{
                  
                    Text(RepositoryModel.formatDateString(repo.updatedAt) ?? "")
                }
            }
            .font(.caption)
            
        }
        .padding()
        
    }
}

#Preview {
    ListElementCardView(repo: RepositoryModel.getSampleRepo())
}
