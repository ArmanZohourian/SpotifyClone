//
//  SongModel.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/28/22.
//

import Foundation
struct BaseModel: Codable {
    
    let tracks: [TrackModel]
    
    
   
}



struct FinalTrackModel : Identifiable, Equatable {
    
    var id: Int
    let title: String
    let subtitle: String
    let image: URL
    let uriPlayer: URL
    let isDownloaded = false
    var isSelected = false
    
    
    
    
}


