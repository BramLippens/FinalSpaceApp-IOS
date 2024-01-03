//
//  ContentView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab){
                    CharacterListView().tag(Tab.person)
                    EpisodeListView().tag(Tab.message)
                    LocationListView().tag(Tab.house)
                }
            }.padding(.bottom, 80)
            VStack{
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                    
            }
        }
        
    }
}

#Preview {
    ContentView()
}
