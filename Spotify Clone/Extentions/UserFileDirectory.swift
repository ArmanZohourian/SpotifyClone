//
//  UserFileDirectory.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/13/22.
//

import Foundation

class UserFileDirectory {
    
    
    func getUserFileDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.first!
        
    }
    
}
