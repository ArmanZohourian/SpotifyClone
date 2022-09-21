//
//  HubActionsModel.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/6/22.
//

import Foundation



struct HubActions: Codable {
    
    let name: String
    let type: String
    let uri: URL?
    let id: String?
}
