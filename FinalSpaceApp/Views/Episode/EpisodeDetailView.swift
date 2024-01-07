//
//  EpisodeDetailView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import SwiftUI

struct EpisodeDetailView: View {
    var episode: Episode
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("Placeholder")
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25))

            Text(episode.name)
                .font(.title)

            Text("Air Date: \(episode.air_date)")
                .font(.subheadline)

            Text("Director: \(episode.director)")
                .font(.footnote)

            Text("Writer: \(episode.writer)")
                .font(.footnote)

            Spacer()
        }
        .padding()
        .navigationTitle(episode.name)
    }
}

struct CharacterDetailPreview: PreviewProvider {
    static var previews: some View{
        EpisodeDetailView(episode: Episode(
            id: 1,
            name: "Chapter 1",
            air_date: "02/15/2018",
            director: "Mike Roberts",
            writer: "Olan Rogers",
            img_url: "https://finalspaceapi.com/episode/image/chapter1.jpg"
        ))
    }
}
