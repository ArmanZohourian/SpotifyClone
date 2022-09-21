//
//  PlaylistView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/13/22.
//

import SwiftUI

struct PlaylistsView: View {
    
    @StateObject var playlistViewModel = CoreDataManagerViewModel()
    
    
    
    var body: some View {
        
        ZStack(alignment: .center) {
            NavigationView {
                VStack {
                    Text("Hey it's here")
                    ForEach(playlistViewModel.playlists) { playlist in
                        
                        
                        NavigationLink {
                            PlaylistSongView(playlist: playlist)
                        } label: {
                            PlaylistCellView(playlistEntity: playlist)
                        }

                
                        
    //                    ForEach(playlist.tracks?.allObjects) { track in
    //                    }
                        
                    }
                    Divider()
                }
            }
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct PlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistsView()
    }
}
