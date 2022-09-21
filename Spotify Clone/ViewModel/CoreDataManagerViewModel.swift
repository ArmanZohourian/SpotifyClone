//
//  CoreDataManagerViewModel.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/12/22.
//

import Foundation
import CoreData

class CoreDataManagerViewModel: ObservableObject {
    
    
    let manager = CoreDataManager.instance
    
    @Published var playlists: [Playlist1] = []
    
    init() {
        getPlaylists()
    }
    
    func addPlaylist(name: String, tracks: [FinalTrackModel]) {
        
        
        var tracksEntity = [Track(context: manager.context)]
        
        let newPlaylist = Playlist1(context: manager.context)
        let newTrackEntity = Track(context: manager.context)
        
        
        for song in tracks {
            
            newTrackEntity.subtitle = song.subtitle
            newTrackEntity.title = song.title
            tracksEntity.append(newTrackEntity)
            
        }
        
        newPlaylist.name = name
        let finalTracksList = NSSet(array: tracksEntity)
        newPlaylist.tracks = finalTracksList
        save()
        
        
    }
    
    func getPlaylists() {
        
        let request = NSFetchRequest<Playlist1>(entityName: "Playlist1")
        
        do {
           playlists =  try manager.context.fetch(request)
        } catch let error {
            print("Error fetching : \(error.localizedDescription)")
        }
      
        
    }
    
    
    func save() {
        
//        playlists.removeAll()
        manager.save()
        getPlaylists()
         
    }
    
    func getTracksInPlaylist() {
        
        
        
        
    }
    
}
