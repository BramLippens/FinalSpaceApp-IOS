//
//  CreateLocationView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 07/01/2024.
//

import SwiftUI

struct CreateLocationView: View {
    @StateObject private var viewModel:CreateLocationViewModel = CreateLocationViewModel()
    let action: (_ location: Location) -> Void
    
    @Environment(\.dismiss) private var dissmiss
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Location Details")) {
                    TextField("Name", text: $viewModel.newLocation.name)
                    TextField("Type", text: $viewModel.newLocation.type)
                }
                Section(header: Text("Inhabitants")) {
                    ForEach($viewModel.newLocation.inhabitants.indices, id: \.self) { index in
                        TextField("Inhabitant \(index + 1)", text: $viewModel.newLocation.inhabitants[index])
                    }
                    .onDelete(perform: viewModel.removeInhabitant)

                    Button("Add Inhabitant") {
                        viewModel.addInhabitant()
                    }
                }
                Section {
                    Button("Clear All", role: .destructive) {
                        viewModel.clearAll()
                    }
                }
            }
            .navigationTitle("Add Location")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Done"){
                        action(viewModel.newLocation)
                        dissmiss()
                    }
                    .disabled(!viewModel.isValid)
                }
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel", role:.cancel){
                        dissmiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    CreateLocationView()
//}
