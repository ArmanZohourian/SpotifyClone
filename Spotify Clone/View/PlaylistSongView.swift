//
//  PlaylistSongView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/24/22.
//

import SwiftUI

struct PlaylistSongView: View {
    
    
    var playlist : Playlist1
    
    
    var body: some View {
        
        
        VStack {
            
            Text(playlist.name ?? "Unknown Playlist")
                .font(.system(size: 30, weight: .heavy, design: .default))
            
            let trackPlaylist = playlist.tracks?.allObjects as! [Track]
            
          
            
            
            ScrollView(.vertical) {
    
               
                
                ForEach(trackPlaylist) { song in
                
                    
                    TrackCellView(title: song.title ?? "Shark" , subtitle: song.subtitle ?? "Imagine Dragons", image: nil)
                        .onTapGesture {
                             //Play the Song, Pass to the Player VM
                            
                        }
                }
            
                
                
            }
        }
        
      
        
        
        
    }
}
