//
//  HubActions.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/6/22.
//

import Foundation


struct HubPlayer: Codable {
    
    let type: String
    let image: URL
    let actions: [HubActions]
    let options: [HubOptions]
    
}
