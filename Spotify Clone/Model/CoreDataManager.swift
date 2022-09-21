//
//  CoreDataManager.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/12/22.
//

import Foundation
import CoreData
class CoreDataManager {
    
    
    static let instance = CoreDataManager()
    let container : NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        
        container = NSPersistentContainer(name: "SpotifyClone")
        container.loadPersistentStores { description, err in
            
            if let err = err {
                print("Error loading core data :\(err)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        
        do {
            try context.save()
            print("Playlist has been saved")
        } catch let err {
            print(err.localizedDescription)
        }
        
    }
    
    
    
}
