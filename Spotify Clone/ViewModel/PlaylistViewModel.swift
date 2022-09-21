//
//  PlaylistViewModel.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/7/22.
//

import Foundation
import SwiftUI

class PlaylistViewModel: ObservableObject {
    
    //MARK: Model
    @Environment(\.managedObjectContext) var trackData
    
    @Published var playlistSongs : [FinalTrackModel] = [] {
        didSet {
            print("New value of array is:\(playlistSongs)")
        }
    }
    @State var playlistName = ""
    //MARK: Intent(s)
    
    func createPlaylist() {
        
        
        
    }
    
    
    func addSong(song: FinalTrackModel) {
        
        
        if !playlistSongs.contains(song) {
            //Add it to the playlist
            playlistSongs.append(song)
            print("Added new song to the Playlist!")
        }
    }
    
    
    func savePlaylist() {
        
        //Save the playlist with the and selected songs
        
        
    }
    
    //create playlist
    
}
