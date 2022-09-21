//
//  CreatePlaylistView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/7/22.
//

import SwiftUI

struct CreatePlaylistView: View {
    
    @State var name = ""
    @State var isPresented = false
    
    @EnvironmentObject var playlistViewModel : PlaylistViewModel
    
    @StateObject var vm = CoreDataManagerViewModel()
    
    var body: some View {
        
        
        ZStack(alignment: .center) {
    
            VStack {
                
                Button("Done") {
                    //Save the Playlist
                    print("The Playlist: \(playlistViewModel.playlistSongs)")
                    vm.addPlaylist(name: name, tracks:  playlistViewModel.playlistSongs)
                }
                
                TextField("Name", text: $name)
                    .padding()
                    .foregroundColor(Color.white)
                
                
                Button("Add a new song") {
                    //Present Songs in the library
                    isPresented.toggle()
                }
                
                
                List {
                    
                    //Gonna Show each song saved to ?core data? so far and be able to remove and move it
                    
                    ForEach(playlistViewModel.playlistSongs) { song in
                        
                        TrackCellView(title: song.title, subtitle: song.subtitle, image: song.image)
                    }
                    .onDelete { playlistViewModel.playlistSongs.remove(atOffsets: $0) }
                    .onMove { playlistViewModel.playlistSongs.move(fromOffsets: $0, toOffset: $1)}
                }
                   
                
                
            }
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            
        }, content: {
            SongsForPlaylist()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
        
}

struct CreatePlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaylistView()
    }
}
