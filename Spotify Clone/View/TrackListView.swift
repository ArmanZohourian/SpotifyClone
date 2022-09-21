//
//  TrackView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/5/22.
//

import SwiftUI

struct TrackListView: View {
    
    //Track(s) View Model
    @StateObject var tracksViewModel = SpotifyApiCall()
    
    @State private var isPresenting = false
    @State private var isNavigationActive = false
    
    @EnvironmentObject var viewModel: AudioPlayer
    var playerSharedInstance = MusicPlayer.sharedInstance
    
    
    var body: some View {
       

            
        ZStack(alignment: .bottom) {
                ScrollView(.vertical) {
                        
                            VStack {
                                
                                ForEach(tracksViewModel.tracks) { song in
                                    
                                    Button {
   
                                        //Set up the playlist
                                        setUpSelectedPlaylist(fromIndex: song.id)
                                        
                                        //Setting the selected song to the current song
                                        print("IT HAPPENED!!!")
                                        viewModel.currentSong = FinalTrackModel(id: song.id, title: song.title, subtitle: song.subtitle, image: song.image, uriPlayer: song.uriPlayer)
                                        isPresenting.toggle()
                           

                                    }
                                        
                                        
                                        
                                label: {
                        
                                        TrackCellView(title: song.title, subtitle: song.subtitle, image: song.image)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
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
                .onAppear {
                    tracksViewModel.fetchAlbums()
            }
        }
    }
    
    
    private func setUpSelectedPlaylist(fromIndex: Int) {
        
        let remainingQueue = tracksViewModel.tracks[fromIndex - 1..<tracksViewModel.tracks.endIndex]
        
        for song in remainingQueue {
            
            viewModel.playlist.append(FinalTrackModel(id: song.id
                                                      , title: song.title, subtitle: song.subtitle, image: song.image, uriPlayer: song.uriPlayer))
            
        }
        
    }

}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListView()
    }
}
