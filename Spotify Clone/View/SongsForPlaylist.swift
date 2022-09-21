//
//  PlaylistView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/27/22.
//

import SwiftUI

struct SongsForPlaylist: View {
    
    @State private var isPresenting = false
    @StateObject var tracksViewModel = SpotifyApiCall()
    @Environment(\.dismiss) var disMiss
    
    
    
    @EnvironmentObject var playlistViewModel : PlaylistViewModel
    
    var playlistSongs : [FinalTrackModel] = []
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            VStack {
                Button {
                    //Save the Songs into Core data
                    disMiss.callAsFunction()
                } label: {
                    Text("Done")
                }

                ScrollView(.vertical) {
                        
                            VStack {
                                
                                ForEach(tracksViewModel.tracks) { song in
                                    
                                    Button {
                                        playlistViewModel.addSong(song: song)
                                    }
                                        
                                label: {
                        
                                    
                                    HStack(spacing: 5) {
                                        
                                       
                                        TrackCellView(title: song.title, subtitle: song.subtitle, image: song.image)
                                       
                                        if song.isSelected {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(Color.green)
                                        } else {
                                            Image(systemName: "plus.circle")
                                                .foregroundColor(Color.green)
                                        }
                                        
                                        
                                        

                                        
                                        }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .foregroundColor(Color.white)
                                    }
                                }
                            }
                            .background(Color.black.opacity(0.9))
                        
                    }
            }
                .onAppear {
                    tracksViewModel.fetchAlbums()
            }
        }
        
        
//        ZStack(alignment: .bottom) {
//
//            ScrollView(.vertical) {
//
//                VStack {
//
//                    ForEach(tracksViewModel.tracks) { song in
//
//                                    Button {
//                                        //Add the selected Song to the array
//                                        playlistViewModel.addSong(song: song)
//                                    }
//
//
//
//                                label: {
//
//                                        TrackCellView(title: song.title, subtitle: song.subtitle, image: song.image)
//                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                        }
//                                .foregroundColor(Color.white)
//                                }
//                            .background(Color.black.opacity(0.9))
//
//                    }
//            }
//        }
    }
    
    
    
    
}

struct SongsForPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        SongQueueView()
    }
}
