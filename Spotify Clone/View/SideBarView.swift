//
//  SideBarView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/24/22.
//

import SwiftUI

struct SideBarView: View {
    
    @State var showSideBar = true
    @State var volume : CGFloat = 0.0
    
    @State var selection : String = "home"
    @State var selectedTab: TabBarItem = TabBarItem(image: "house", foregroundColor: Color.gray)
    
    
    
    
    @EnvironmentObject var audioPlayer : AudioPlayer
    
    

    var body: some View {
        VStack {
            
            
            //Nav bar button
            Button {
                //hide nav bar
                
                withAnimation(.easeIn) {
                    showSideBar.toggle()
                }
                
                
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.7))
                    .rotationEffect(.init(degrees: showSideBar ? 0 : 180))
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                
            }
            .offset(x: showSideBar ? 0 : 100)
            .padding()


            
//            VStack {
//
//            TabBarView(image: "house.fill", selectedTab: $selectedTab)
//
//            TabBarView(image: "magnifyingglass", selectedTab: $selectedTab)
//
//            TabBarView(image: "square.stack", selectedTab: $selectedTab)
//
//
//            TabBarView(image: "clock.fill", selectedTab: $selectedTab)
//
//
//            }
            CustomTabBarContainer(selection: $selectedTab) {
                
                Color.red
                    .tabBarItem(tab: TabBarItem(image: "magnifyingglass", foregroundColor: Color.gray), selection: $selectedTab)
                
                Color.blue
                    .tabBarItem(tab: TabBarItem(image: "square.stack", foregroundColor: Color.gray), selection: $selectedTab)
                
                
                Color.green
                    .tabBarItem(tab: TabBarItem(image: "clock.fill", foregroundColor: Color.gray), selection: $selectedTab)
                
                
                Color.yellow
                    .tabBarItem(tab: TabBarItem(image: "house", foregroundColor: Color.gray), selection: $selectedTab)
                
                
                
            }
            .frame(height: getRect().height / 2.3)
            .padding(.top)
            
            Spacer(minLength: 50)


            Button {
                //volume up
                withAnimation {
                    audioPlayer.volumeAmount = audioPlayer.volumeAmount + 0.1 < 1.0 ? audioPlayer.volumeAmount + 0.1 : 1
                }
               
                
                
            } label: {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            //Custom Volume indicatior
            GeometryReader {proxy in
                
                let height = proxy.frame(in: .global).height
                let progress = height * CGFloat(audioPlayer.volumeAmount)
                ZStack(alignment: .bottom) {
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 4)
                        
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 4 , height: progress)
                        

                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            }
            .padding()
            
            
            
            Button {
                //volume down
                withAnimation {
                    audioPlayer.volumeAmount = audioPlayer.volumeAmount - 0.1 > 0.0 ? audioPlayer.volumeAmount - 0.1 : 0
                }
                
            } label: {
                Image(systemName: "speaker.wave.1")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            Image("spotify")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60 , height: 60)
                .padding(.top, 10)
            
            


        }
        .frame(width: 80)
        .background(Color.black.ignoresSafeArea())
        .offset(x: showSideBar ? 0 : -100)
        //reclaming spacing by using nevigate spacing.
        .padding(.trailing, showSideBar ? 0 : -100)
        //Changing the stack position so the bar is on top
        .zIndex(1)
        
        
        
        
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
            .environmentObject(AudioPlayer())
    }
}
