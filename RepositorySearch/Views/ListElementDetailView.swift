//
//  ListElementDetailView.swift
//  RepositorySearch
//
//  Created by Kiss Roland on 03/04/2024.
//

import SwiftUI

struct ListElementDetailView: View {
    let repo: RepositoryModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let avatarUrl = repo.owner?.avatarUrl {
                    AsyncImage(url: URL(string: avatarUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                }

                VStack(alignment: .leading) {
                    if let ownerLogin = repo.owner?.login {
                        Text(ownerLogin)
                            .font(.headline)
                    }

                    if let ownerHtmlUrl = repo.owner?.htmlUrl {
                        Link("GitHub Profil", destination: URL(string: ownerHtmlUrl)!)
                    }
                }
            }

            if let name = repo.name {
                Text(name)
                    .font(.largeTitle)
                    .padding(.top)
            }

            if let description = repo.description {
                Text(description)
                    .padding(.top)
            }

            if let htmlUrl = repo.htmlUrl {
                Link("Repository Link", destination: URL(string: htmlUrl)!)
                    .padding(.top)
            }

            VStack(alignment: .leading) {
                if let stargazersCount = repo.stargazersCount {
                    Text("Csillagok: \(stargazersCount)")
                }

                if let forksCount = repo.forksCount {
                    Text("Forkok: \(forksCount)")
                }
            }
            .padding(.top)

            VStack(alignment: .leading) {
                if let createdAt = repo.createdAt, let formattedCreatedAt = RepositoryModel.formatDateString(createdAt) {
                    Text("Létrehozva: \(formattedCreatedAt)")
                }

                if let updatedAt = repo.updatedAt, let formattedUpdatedAt = RepositoryModel.formatDateString(updatedAt) {
                    Text("Frissítve: \(formattedUpdatedAt)")
                }
            }
            .padding(.top)

            Spacer()
        }
        .padding()
    }
}
