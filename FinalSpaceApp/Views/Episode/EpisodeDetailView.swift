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
        Text(episode.name)
    }
}

#Preview {
    EpisodeDetailView(
    episode: Episode(
        id: 1, name: "Chapter 1", air_date: "02/15/2018", director: "Mike Roberts", writer: "Olan Rogers", img_url: "http://finalspaceapi.com/episode/image/chapter1.jpg"
    ))
}
