//
//  PlaylistView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/27/22.
//

import SwiftUI

struct SongQueueView: View {
    
    @State private var isPresenting = false
    @EnvironmentObject var player: AudioPlayer
    @StateObject var tracksViewModel = SpotifyApiCall()
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
                VStack {
                            List {
                                
                                ForEach(player.playlist) { song in
                                    
                                    Button {
   
                                        //Set up the playlist
                                        setUpSelectedPlaylist()
                                        
                                        //Setting the selected song to the current song
                                        print("IT HAPPENED!!!")
                                        player.currentSong = FinalTrackModel(id: song.id, title: song.title, subtitle: song.subtitle, image: song.image, uriPlayer: song.uriPlayer)
                                        isPresenting.toggle()
                           

                                    }
                                        
                                        
                                        
                                label: {
                        
                                        TrackCellView(title: song.title, subtitle: song.subtitle, image: song.image)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                .foregroundColor(Color.white)
                                }
                                .onDelete { player.playlist.remove(atOffsets: $0)}
                                .onMove { player.playlist.move(fromOffsets: $0, toOffset: $1)}
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
    
    
    
    private func setUpSelectedPlaylist() {
        
        for song in tracksViewModel.tracks {
            
            player.playlist.append(FinalTrackModel(id: song.id
                                                      , title: song.title, subtitle: song.subtitle, image: song.image, uriPlayer: song.uriPlayer))
            
        }
        
    }

    
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        SongQueueView()
    }
}
