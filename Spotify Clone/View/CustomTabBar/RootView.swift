//
//  TabBarFinalView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/9/22.
//

import SwiftUI
import CoreData

struct RootView: View {
    

    @Environment(\.managedObjectContext) var trackData
    @FetchRequest(sortDescriptors: []) var track: FetchedResults<Track>

    @State var selection : String = "home"
    @State var selectedTab: TabBarItem = TabBarItem(image: "house", foregroundColor: Color.gray)
    
    @StateObject private var viewModel = AudioPlayer()
    
    
    var body: some View {
        
        
            CustomTabBarContainer(selection: $selectedTab) {



                                HomeView()
                    .tabBarItem(tab: TabBarItem(image: "house", foregroundColor: Color.gray), selection: $selectedTab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                                TrackListView()
                                    .tabBarItem(tab: TabBarItem(image: "square.stack", foregroundColor: Color.gray), selection: $selectedTab)

                
                                PlaylistsView()
                                    .tabBarItem(tab: TabBarItem(image: "clock.fill", foregroundColor: Color.gray), selection: $selectedTab)


                                CreatePlaylistView()
                                    .tabBarItem(tab: TabBarItem(image: "magnifyingglass", foregroundColor: Color.gray), selection: $selectedTab)
                                    .environmentObject(PlaylistViewModel())





            }
            .environmentObject(viewModel)
    }
}

struct TabBarFinalView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
