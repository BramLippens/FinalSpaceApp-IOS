//
//  ContentView.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .globe
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab){
                    CharacterListView().tag(Tab.person)
                    EpisodeListView().tag(Tab.video)
                    LocationListView().tag(Tab.globe)
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
