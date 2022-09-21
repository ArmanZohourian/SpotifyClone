//
//  AudioPlayer.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/27/22.
//

import AVKit
import SwiftUI

class AudioPlayer: ObservableObject {
    
    
    var avPlayer = AVPlayer()
    var audioPlayer: AVAudioPlayer?
    var playerItem: AVPlayerItem?
    
    //MARK: Model
    //fetch the list of tracks in the array, One of the should be the current song
    @Published var playlist = [FinalTrackModel]() {
        didSet {
            print(playlist.count)
            print(playlist)
        }
    }
    
    
    @Published var currentSong : FinalTrackModel? {
        didSet {
            // need to Set all the variables and play it
            settingUpSong()
            audioDuration = avPlayer.currentTime().seconds
            print(currentSong?.id)
        }
    }

    @Published var audioDuration: Double = 0.00
    
    @Published var songTitle = "" {
        didSet {
            print("The current song is\(self.songTitle)")
        }
    }
    
    @Published var playShape = "play.fill"
    @Published var songSinger = ""
    @Published var coverArtUrl: URL?
    var songUrl: URL?
    @Published var volumeAmount : Float = 1 {
        didSet {
            audioPlayer?.volume = volumeAmount
            print("New volume has been set")
        }
    }
     @Published var isPlaying = false {
        didSet {
            
//            setupEngine()
//            audioPlayerEngine.play()
//            avPlayerFunction(
            playAudio(soundFile: songTitle)
            print("song name is :\(songTitle)")
            if isPlaying {
                playShape = "pause"
                avPlayer.play()
            } else {
                playShape = "play.fill"
                avPlayer.pause()
            }
        }
    }
    
    
    func avPlayerFunction() {
        
        if let musicUrl = songUrl {
         
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: musicUrl)
                avPlayer.play()
                
            } catch {
                
                print(error.localizedDescription)
            }
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    //MARK: Intent (Audio Control)
     func playAudio(soundFile: String) {
         
         if isPlaying {
            //if the player has an item it should be prepared to play.
            //MARK: TODO Weak self Should be assigned
           if let musicUrl = songUrl {
                
                do {

                    let playerItem = AVPlayerItem(url: musicUrl)
                    avPlayer = AVPlayer(playerItem: playerItem)
                    avPlayer.play()
//                    PlayerViewModel.audioPlayer?.play()

                } catch {
                    //throw error
                    print("Audio file not found!")
                }
                
            }
                
        } else {
            
//            PlayerViewModel.audioPlayer?.pause()
//            audioPlayer?.pause()
            
        }
        
        

            
        
    }
    
    func playNext() {
        
        
        //Current Song index from Playlist
        if let song = currentSong {
            if let currentIndex = playlist.firstIndex(of: song) {
                print(playlist[currentIndex])
                //Move it to the next index
                let nextIndex = currentIndex + 1
                if playlist.indices.contains(nextIndex) {
                    currentSong = playlist[nextIndex]
                }
            }
            //Now that we know where we are in the array we can move from there to next part
        }
        
//
//        if let currentIndex = currentSong {
//
//            //Check if the latter index exists
//            if  playlist.indices.contains(currentIndex.id + 1 ) {
//                print("Current Playlist is:\(playlist)")
//                if let newIndex = playlist.firstIndex { $0.id == currentIndex.id + 1 } {
//                    currentSong = playlist.first{ $0.id == currentIndex.id + 1 }
//                    print(currentIndex)
//                }
//            }
//        }
      
       
        
    }
    
    func playPrevious() {
        
        
        if let song = currentSong {
            if let currentIndex = playlist.firstIndex(of: song) {
                print(playlist[currentIndex])
                //Move it to the next index
                let nextIndex = currentIndex - 1
                if playlist.indices.contains(nextIndex) {
                    currentSong = playlist[nextIndex]
                }
            }
            //Now that we know where we are in the array we can move from there to next part
        }
        
        
//        if let currentIndex = currentSong {
//            if  playlist.indices.contains(currentIndex.id - 1 ) {
//                print("Current Playlist is:\(playlist)")
//                if let newIndex = playlist.firstIndex { $0.id == currentIndex.id - 1 } {
//                    currentSong = playlist.first{ $0.id == currentIndex.id - 1 }
//                    print(currentIndex)
//                }
//            }
//        }
    }
    
    
    
    
    
    func playAudioUsingAVEnginge() throws {
        
        
        if isPlaying {
            if let musicUrl = songUrl {
                let musicFile = try AVAudioFile(forReading: musicUrl)
                
                
                //Audio Player(NODE TO ENGINE)
                let audioPlayer = AVAudioPlayerNode()

                
                do {
                  
                    audioPlayer.scheduleFile(musicFile, at: nil) {
                        print()
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
                
                

                   
                    audioPlayer.play()
                
            }
        }
        
    }
    
    func seekTo() {
        
//        avPlayer.seek(to: <#T##CMTime#>)
        
    }
    
    
    
    private func settingUpSong() {
        songTitle = currentSong!.title
        songSinger = currentSong!.subtitle
        coverArtUrl = currentSong?.image
        songUrl = currentSong?.uriPlayer
        isPlaying = true
        playAudio(soundFile: "Something")
    }
    
//
//    func setUpAudio() {
//
//        if let musicUrl = songUrl {
//
//            do {
//                let musicFile = try AVAudioFile(forReading: musicUrl)
//                audioFile = musicFile
//            } catch {
//                print(error.localizedDescription)
//            }
//
//        }
//
//    }
//
//    func setupEngine() {
//
//
//
//        audioEngine.attach(audioPlayerEngine)
//        audioEngine.attach(pitchControl)
//        audioEngine.attach(speedControl)
//
//        audioEngine.connect(audioPlayerEngine, to: speedControl, format: nil)
//        audioEngine.connect(speedControl, to: pitchControl, format: nil)
//        audioEngine.connect(pitchControl, to: audioEngine.mainMixerNode, format: nil)
//
//        setUpAudio()
//
//        do {
//
//            //1
//            try audioEngine.start()
//
//            //2
//            audioPlayerEngine.scheduleFile(audioFile, at: nil) {
//            }
//
//        }
//        catch {
//
//
//            print(error.localizedDescription)
//        }
//
//
//
//    }
//
}
