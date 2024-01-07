//
//  CharacterView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        VStack{
            if viewModel.characters.isEmpty{
                ProgressView()
            } else {
                NavigationView {
                    List {
                        ForEach(viewModel.getBookmarkedCharacters(), id: \.id) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)){
                                HStack {
                                    AsyncImage(url: URL(string: character.img_url)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text(character.name)
                                    Spacer()
                                    Image(systemName:viewModel.contains(character: character) ? "bookmark.fill" : "bookmark")
                                        .foregroundStyle(.blue)
                                        .onTapGesture{
                                            viewModel.bookmark(character: character)
                                        }
                                }
                            }
                            
                        }
                    }
                    .navigationTitle("Final Space Characters")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button("Bookmarks"){
                                viewModel.sortBookmarks()
                            }
                            Button("Shuffle") {
                                viewModel.shuffleOrder()
                            }
                            Button("Reverse") {
                                viewModel.reversOrder()
                            }
                            Button("Remove First") {
                                viewModel.removeFirst()
                            }
                        }
                    }
                }
            }
        }.task{
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharacterListView()
}
