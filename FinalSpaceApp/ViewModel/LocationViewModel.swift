//
//  LocationViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import Foundation

class LocationViewModel: ObservableObject{
    @Published private(set) var locations: [Location] = []
    
    func fetchLocations() async{
        do{
            let url = URL(string:"https://finalspaceapi.com/api/v0/location")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedLocations = try JSONDecoder().decode([Location].self, from: data)
            
            DispatchQueue.main.async {
                self.locations = decodedLocations
            }
        }catch{
            print("Error")
        }
    }
    
    //TODO: create a function with validation to create new location
}
