//
//  PlayerTestView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/17/22.
//

import SwiftUI

struct PlayerTestView: View {
    
    
    @EnvironmentObject var playerViewModel: AudioPlayer
    let dataLoader = DownloadManager()
    
    var body: some View {
        Button {
            //Play music from device
            playerViewModel.songUrl = dataLoader.filePathUrl.appendingPathComponent("myMusic.m4a")
            playerViewModel.isPlaying = true 
            print("Playing Downloaded Muisc")
        } label: {
            Text("Play Music by saved url")
        }

    }
}

struct PlayerTestView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTestView()
            .environmentObject(AudioPlayer())
    }
}
