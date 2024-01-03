//
//  EpisodeViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import Foundation

class EpisodeViewModel: ObservableObject{
    @Published private(set) var episodes: [Episode] = []
    
    func fetchEpisodes() async{
        do{
            let url = URL(string:"https://finalspaceapi.com/api/v0/episode")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedEpisodes = try JSONDecoder().decode([Episode].self, from: data)
            
            DispatchQueue.main.async {
                self.episodes = decodedEpisodes
            }
        }catch{
            print("Error")
        }
    }
}
