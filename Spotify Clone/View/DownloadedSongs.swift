//
//  DownloadedSongs.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/17/22.
//

import SwiftUI

struct DownloadedSongs: View {
    
    
    @FetchRequest(sortDescriptors: []) var tracks: FetchedResults<Track>
    @EnvironmentObject var viewModel: AudioPlayer
    @State private var isPresenting = false
    let dataLoader = DownloadManager()
    var playerSharedInstance = MusicPlayer.sharedInstance
    
    
    
    
    var body: some View {
        
        
        
        
        Text("works")
        VStack {

            ZStack(alignment: .bottom) {
                   VStack {
                            
                       EditButton()
                           .padding()
                        
                                List {
                                    
                                    ForEach(tracks) { song in
                                        
                                        
                                        Button (action: {
                                            //Playing the Selected Song
                                            
                                            let songRawName = song.title?.replacingOccurrences(of: " ", with: "")
                                            
//                                            viewModel.songTitle = song.title ?? "Unknown"
//                                            viewModel.songSinger = song.subtitle ?? "Unknown"
//                                            viewModel.coverArtUrl = song.image
//                                            viewModel.songUrl = song.uriPlayer
                                            playerSharedInstance.initPlayer(url: dataLoader.filePathUrl.appendingPathComponent(songRawName!))
                                            
                                           
//                                            viewModel.songUrl = dataLoader.filePathUrl.appendingPathComponent(songRawName!)
//                                            viewModel.isPlaying = true
                                            isPresenting.toggle()
                                            
                                            DownloadManager().loadData(with: songRawName!)
                                        }
                                   , label: {
                            
                                        TrackCellView(title: song.title ?? "No song available", subtitle: song.subtitle ?? "Unavaiable")
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            })
                                    .foregroundColor(Color.white)
                                    }
                                }
                                .background(Color.black.opacity(0.9))
                            
                        }
                        .fullScreenCover(isPresented: $isPresenting, onDismiss: {
                            //Minimize the Player to mini player
                        }, content: {
                            //Present Player View
                            PlayerView()
    //                            .environmentObject(player)
                        })
            }

        }
        
    }
}

struct DownloadedSongs_Previews: PreviewProvider {
    static var previews: some View {
        DownloadedSongs()
    }
}
