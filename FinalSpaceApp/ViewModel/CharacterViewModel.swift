//
//  CharacterViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import Foundation

class CharacterViewModel: ObservableObject{
    @Published private(set) var characters: [Character] = []
    
    func fetchCharacters() async{
        do{
            let url = URL(string: "https://finalspaceapi.com/api/v0/character")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedCharacters = try JSONDecoder().decode([Character].self, from: data)
            
            DispatchQueue.main.async {
                self.characters = decodedCharacters
            }
        } catch	{
            print("Error")
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
