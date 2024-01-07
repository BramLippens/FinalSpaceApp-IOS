//
//  CharacterDetailView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: URL(string: character.img_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()

                Group {
                    Text(character.name).font(.title).fontWeight(.bold)
                    Text("Status: \(character.status ?? "Unknown")").font(.subheadline)
                    Text("Species: \(character.species ?? "Unknown")").font(.subheadline)
                    Text("Gender: \(character.gender ?? "Unknown")").font(.subheadline)
                    Text("Hair: \(character.hair ?? "Unknown")").font(.subheadline)
                    Text("Origin: \(character.origin ?? "Unknown")").font(.subheadline)
                }
                .padding(.leading)

                if !character.alias.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Aliases").font(.headline)
                        ForEach(character.alias, id: \.self) { alias in
                            Text(alias).font(.subheadline)
                        }
                    }
                    .padding(.leading)
                }

                if !character.abilities.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Abilities").font(.headline)
                        ForEach(character.abilities, id: \.self) { ability in
                            Text(ability).font(.subheadline)
                        }
                    }
                    .padding(.leading)
                }
                
                Spacer()
            }
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CharacterDetailView(
    character: Character(
        id: 1,
        name: "Gary Goodspeed",
        img_url: "https://finalspaceapi.com/api/character/avatar/gary_goodspeed.png",
        status: "Alive",
        species: "Human",
        gender: "Male",
        hair: "Blonde",
        origin: "Earth",
        alias: ["The Gary", "Thunder Bandit"],
        abilities: ["Piloting", "Marksmanship"]
    ))
}
