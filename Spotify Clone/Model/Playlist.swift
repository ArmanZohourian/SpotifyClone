//
//  Playlist.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/4/22.
//

import Foundation

struct Playlist: Identifiable {
    
    var id: Int
    var name: String
    var playlistItem: [FinalTrackModel] = []
    
    
    var songCount: Int {
        return playlistItem.count
    }
    
}
