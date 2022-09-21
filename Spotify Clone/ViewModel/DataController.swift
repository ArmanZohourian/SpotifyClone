//
//  DataController.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/11/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    
    let container = NSPersistentContainer(name: "Track")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("core data failed to load: \(error.localizedDescription)")
                
            }
        }
    }
}
