//
//  ContentView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/23/22.
//

import SwiftUI
import CoreData

struct HomeView: View {

    @State private var isPresenting = false
    @State var isPlaying = false
    @State var tracks = SpotifyApiCall()
    @StateObject var player = AudioPlayer()
    
    var body: some View {

                    ZStack(alignment: .bottom) {
                            
                                    ScrollView(.vertical, showsIndicators: false) {
                                        
                                        
                                     
                                        
                                        Spacer()
                                        RecenltyPlayedView()
                                        
                                        
                                    }
                                    
                                  
                                    
//
//                                    Button(action: {
//                                        self.isPresenting.toggle()
//                                    }, label: {
//                                        MiniPlayerView()
//                                            .environmentObject(player)
//                                    })
//
//                                        .fullScreenCover(isPresented: $isPresenting) {
//                                            PlayerView()
//                                                .environmentObject(player)
//
//                                        }
                        }
            .background(Color.black.opacity(1))
            .environmentObject(player)
        



    }
    
}

//Tab Bar View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
.previewInterfaceOrientation(.portrait)
    }
}

//Get size of the screen
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
    }
    
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        
        self.modifier(TabBarViewModifier(tabValue: tab, selectedTab: selection))
    }
    
    

}
