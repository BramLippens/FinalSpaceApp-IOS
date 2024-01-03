//
//  LocationListView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import SwiftUI

struct LocationListView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View{
        VStack{
            if viewModel.locations.isEmpty{
                ProgressView()
            } else {
                NavigationView{
                    List{
                        ForEach(viewModel.locations, id: \.id) { location in
                            NavigationLink(destination: LocationDetailView(location: location)){
                                HStack {
                                    AsyncImage(url: URL(string: location.img_url)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text(location.name)
                                }
                            }
                        }
                    }.navigationTitle("Locations")
                }
            }
        }.task {
            await viewModel.fetchLocations()
        }
    }
}

#Preview {
    LocationListView()
}
