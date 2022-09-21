//
//  CustomTabBarView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/8/22.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @State var showSideBar = true
    @EnvironmentObject var audioPlayer : AudioPlayer
    @Binding var selectedTab: TabBarItem
    let tabs: [TabBarItem]
    
    var body: some View {
        
        
        VStack {
            
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


            //MARK: NAV BAR
            VStack {
               
                ForEach(tabs, id:\.self) { tab in
                    
                    tabBarItemView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                }
                
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

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        
        TabBarItem(image: "house.fill", foregroundColor: Color.gray),
        TabBarItem(image: "magnifyingglass", foregroundColor: Color.gray),
        TabBarItem(image: "square.stack", foregroundColor: Color.gray),
        TabBarItem(image: "clock.fill", foregroundColor: Color.gray)
        

    ]
    
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(tabs.first!), tabs: tabs )
            .environmentObject(AudioPlayer())
    }
}

extension CustomTabBarView {
    
    private func tabBarItemView(tab: TabBarItem) -> some View {
        
        Image(systemName: tab.image)
            .foregroundColor(selectedTab == tab ? Color.white : Color.gray)
                .padding()
                .frame(width: 100, height: 100, alignment: .center)
        //MARK: Should be assigned
//                .frame(height: getRect().height/2.3)
                 
        
    }
    
    private func switchToTab(tab: TabBarItem) {
        
        withAnimation(.easeInOut) {
            
            selectedTab = tab
            
        }
    }
    
    
}


struct TabBarItem : Hashable {
    
    let image: String
    let foregroundColor: Color
    
}
