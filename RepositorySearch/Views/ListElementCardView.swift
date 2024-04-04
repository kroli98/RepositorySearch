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
                Text(repo.name ?? "Hiányzó név")
                    .font(.title2)
                    .bold()
                
                Text(repo.description ?? "Hiányzó leírás")
                    .font(.caption2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           
               
                Divider()
               
            
          
            
            
            VStack(alignment: .leading,spacing: 10){
                HStack{
                    Image(systemName: "star")

                    if let stargazersCount = repo.stargazersCount{
                        Text("\(stargazersCount)")
                    }
                    else{
                        Text("Hiányzó csillagok")
                    }
                }
                HStack{
                    Image(systemName: "arrow.up.circle.badge.clock")

                    Text(RepositoryModel.formatDateString(repo.updatedAt ?? "Hiányzó dátum") ?? "")
                }
            }
            .font(.caption2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
        
    }
}

#Preview {
    ListElementCardView(repo: RepositoryModel.getSampleRepo())
}
