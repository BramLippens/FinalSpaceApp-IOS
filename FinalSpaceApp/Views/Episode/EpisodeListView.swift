//
//  EpisodeListView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import SwiftUI

struct EpisodeListView: View {
    @StateObject private var viewModel = EpisodeViewModel()
    
    var body: some View {
        VStack{
            if viewModel.episodes.isEmpty{
                ProgressView()
            } else {
                NavigationView {
                    List {
                        ForEach(viewModel.episodes, id: \.id) { episode in
                            NavigationLink(destination: EpisodeDetailView(episode: episode)){
                                HStack {
                                    Image("Placeholder")
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text(episode.name)
                                }
                            }
                        }
                    }
                    .navigationTitle("Episodes")
                }
            }
        }.task{
            await viewModel.fetchEpisodes()
        }
    }
}

#Preview {
    EpisodeListView()
}
