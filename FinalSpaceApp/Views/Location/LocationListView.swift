//
//  LocationListView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import SwiftUI

struct LocationListView: View {
    @StateObject private var viewModel = LocationViewModel()
    @State private var isCreateShowing: Bool = false
    
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
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button("Add Location"){
                                isCreateShowing.toggle()
                            }
                        }
                    }
                    .sheet(isPresented: $isCreateShowing){
                        CreateLocationView{ location in
                            viewModel.addLocation(location: location)
                        }
                    }
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
