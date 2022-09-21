//
//  TestAudioPlayer.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/1/22.
//

import Foundation
import AVKit


class MusicPlayer {
    public static var sharedInstance = MusicPlayer()
    var player = AVPlayer()

    func initPlayer(url: URL) {
//        guard let url = URL(string: url) else { return }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        playAudioBackground()
        play()
    }
    
    func playAudioBackground() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }
    
    func pause(){
        player.pause()
    }
    
    func play() {
        player.play()
    }
}

