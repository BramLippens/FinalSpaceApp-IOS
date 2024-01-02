//
//  CharacterViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import Foundation

class CharacterViewModel: ObservableObject{
    @Published var characters: [Character] = []
    
    let url = URL(string: "https://finalspaceapi.com/api/v0/character")!
    func fetchCharacters() async throws{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode([Character].self, from: data)
        
        await MainActor.run{
            characters = decoded
        }
    }
    
    func shuffleOrder(){
        characters.shuffle()
    }
    
    func reversOrder(){
        characters.reverse()
    }
    func removeFirst(){
        characters.removeFirst()
    }
}


