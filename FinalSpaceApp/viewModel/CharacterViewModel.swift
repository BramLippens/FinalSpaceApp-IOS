//
//  CharacterViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import Foundation

class CharacterViewModel: ObservableObject{
    @Published private(set) var characters: [Character] = []
    @Published private(set) var isLoading = false
    
    func fetchCharacters() async throws{
        let url = URL(string: "https://finalspaceapi.com/api/v0/character")!
        isLoading = true
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedCharacters = try JSONDecoder().decode([Character].self, from: data)

        // Update characters on the main thread using MainActor
        await MainActor.run {
            self.characters = decodedCharacters
            self.isLoading = false
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
