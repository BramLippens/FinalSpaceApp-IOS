//
//  CharacterViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

class CharacterViewModel: ObservableObject{
    @Published private(set) var characters: [Character] = []
    @Published private(set) var bookmarks: Set<Int> = []
    @Published var isShowingBookmarks = false
    
    init(){
        bookmarks = getBookmarks()
    }
    
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
    
    func getBookmarkedCharacters() -> [Character] {
        if(isShowingBookmarks){
            return characters.filter { bookmarks.contains($0.id) }
        } else {
            return characters
        }
    }
    
    func contains(character:Character) -> Bool{
        bookmarks.contains(character.id)
    }
    
    func sortBookmarks(){
        withAnimation{
            isShowingBookmarks.toggle()
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
    
    func bookmark(character: Character){
        if (bookmarks.contains(character.id)){
            bookmarks.remove(character.id)
        } else {
            bookmarks.insert(character.id)
        }
        let array = Array(bookmarks)
        UserDefaults.standard.set(array,forKey: "bookmark_key")
    }
    func getBookmarks() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: "bookmark_key") as? [Int] ?? [Int]()
        return Set(array)
    }
}
