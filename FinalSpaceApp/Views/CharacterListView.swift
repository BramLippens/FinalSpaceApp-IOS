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
        if viewModel.isLoading{
            ProgressView()
        } else {
            NavigationView {
                List {
                    ForEach(viewModel.characters, id: \.id) { character in
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
                            }
                        }
                    }
                }
                .navigationTitle("Final Space Characters")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
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
                .onAppear {
                    Task {
                        do {
                            try await viewModel.fetchCharacters()
                        } catch {
                            print("Error fetching characters: \(error)")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    CharacterListView()
}
