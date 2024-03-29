//
//  CustomTabBar.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case person
    case globe = "globe.americas"
    case video
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage:String{
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage:tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25: 1.0)
                        .foregroundStyle(selectedTab == tab ? .blue : .gray)
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }.frame(width: nil, height: 60)
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding()
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.globe))
}
