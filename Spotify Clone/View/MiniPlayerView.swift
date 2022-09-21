//
//  MiniPlayerView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/24/22.
//

import SwiftUI

struct MiniPlayerView: View {
    
    

    @EnvironmentObject var viewModel : AudioPlayer
    @State private var isPresented = false
    
    //Mark: Shared Instance
    
    
    
    var body: some View {
        //Mini Player
        HStack(alignment: .center, spacing: 10) {
         
            
            AsyncImage(url: viewModel.coverArtUrl) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(10)
                .padding(.leading, 5)
           
            VStack(alignment: .leading, spacing: 7) {
                Text(viewModel.songTitle)
                    .font(.system(size: 12, weight: .heavy, design: .default))
            
                
                Text(viewModel.songSinger)
                    .font(.system(size: 12, weight: .light, design: .default))
                
            }
            
            Spacer()
            Button {
                
                if viewModel.isPlaying {
                    viewModel.isPlaying = false
                } else {
                    //Play the song
                    viewModel.isPlaying = true
                    
                }
                
                
                withAnimation {
                    //Change the button logo
                    viewModel.playShape = viewModel.isPlaying ? "pause" : "play.fill"
                }
                
            } label: {
                Image(systemName: viewModel.playShape)
                    .padding()

            }
//            .onAppear {
//                playShape = viewModel.isPlaying ? "pause" : "play.fill"
//                
//            }

         
            
        }
        .fullScreenCover(isPresented: $isPresented, onDismiss: {
            //Minimize the Player to mini player
        }, content: {
            //Present Player View
            PlayerView()
//                .environmentObject(viewModel)
        })
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(content: {
            Color.black.opacity(0.8)
        })
        
        .onTapGesture {
            isPresented.toggle()
        }
        .padding()
        
        
    }
}


