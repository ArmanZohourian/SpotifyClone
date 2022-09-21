//
//  CustomTabBarContainer.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/9/22.
//

import SwiftUI

struct CustomTabBarContainer<Content:View>: View {
    
    
    @Binding var selectedTab: TabBarItem
    let content: Content
    @EnvironmentObject var viewModel : AudioPlayer
    
    @State var tabs : [TabBarItem] = []

    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        
        self._selectedTab = selection
        self.content = content()
        
    }
    
    var body: some View {
  
        
        
        ZStack {
            HStack(spacing: -2) {


                CustomTabBarView(selectedTab: $selectedTab, tabs: tabs)
                ZStack(alignment: .bottom) {


                    content
                    MiniPlayerView()
                       
                }
                .onPreferenceChange(TabBarItemsPrefrenceKey.self) { value in
                    self.tabs = value
                }
                
            }
//            .environmentObject(viewModel)
            
            .background {
                Color.black
        }
        }

    }
}
