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
                    CharacterListView().tag(Tab.house)
                    ForEach(Tab.allCases, id: \.rawValue){ tab in
                        HStack{
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                                .animation(nil, value: selectedTab)
                        }.tag(tab)
                    }
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
