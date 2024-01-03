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
        VStack(
            alignment: .leading
        )   {
                AsyncImage(url: URL(string: character.img_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25))

                Text(character.name).font(.title)
                Text(character.status ?? "unknown").font(.subheadline)
                Spacer()
            }
            .padding()
            .navigationTitle(character.name)
       }
}

#Preview {
    CharacterDetailView(
    character: Character(
        id: 1,
        name: "Gary Goodspeed",
        img_url: "https://finalspaceapi.com/api/character/avatar/gary_goodspeed.png", status: "Alive",
        species: "Human",
        gender: "Male",
        hair: "Blonde",
        origin: "Earth",
        alias: ["The Gary", "Thunder Bandit"],
        abilities: ["Piloting", "Marksmanship"]
    ))
}
