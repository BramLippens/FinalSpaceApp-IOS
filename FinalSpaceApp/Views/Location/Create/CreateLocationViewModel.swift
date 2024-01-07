//
//  CreateLocationViewModel.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 07/01/2024.
//

import SwiftUI

final class CreateLocationViewModel: ObservableObject{
    @Published var newLocation: Location = Location(id: UUID().hashValue, name: "", type: "", img_url: "", inhabitants: [""])
    
    var isValid: Bool {
        !newLocation.name.isEmpty && !newLocation.type.isEmpty && newLocation.inhabitants.allSatisfy { !$0.isEmpty }
    }

    func addInhabitant() {
        newLocation.inhabitants.append("")
    }

    func removeInhabitant(at offsets: IndexSet) {
        newLocation.inhabitants.remove(atOffsets: offsets)
    }

    func clearAll() {
        self.newLocation.name = ""
        self.newLocation.type = ""
        self.newLocation.inhabitants = [""]
    }
}
