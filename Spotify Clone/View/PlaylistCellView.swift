//
//  PlaylistCellview.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/13/22.
//

import SwiftUI

struct PlaylistCellView: View {
    
    let playlistEntity: Playlist1
    
    var body: some View {
        Text(playlistEntity.name ?? "NOTHING HERE BUDDY")
            .foregroundColor(.green)
        
       
        
    }
}
