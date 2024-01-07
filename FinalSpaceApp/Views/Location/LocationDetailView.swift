//
//  LocationDetailView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import SwiftUI

struct LocationDetailView: View {
    let location: Location
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: location.img_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .padding()

                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Type: \(location.type)")
                    .font(.subheadline)
                    .padding()

                Divider()

                Text("Inhabitants")
                    .font(.title2)
                    .padding()

                ForEach(location.inhabitants, id: \.self) { inhabitant in
                    Text(inhabitant)
                        .padding(5)
                }
            }
        }
        .navigationTitle("Location Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LocationDetailView(location: Location(
        id: 1,
        name: "Earth",
        type: "Planet",
        img_url: "https://finalspaceapi.com/api/location/image/earth.jpg",
        inhabitants: ["Humans", "Animals", "Robots", "Aliens"]
    ))
}
