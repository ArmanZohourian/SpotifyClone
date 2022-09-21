//
//  PlayerView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/25/22.
//

import SwiftUI



struct PlayerView: View {
    
    
    @Environment(\.managedObjectContext) var trackData
    @Environment(\.presentationMode) var isPresented
//    @State var playShape = "play.fill"
//    @State var songDuration = "2:24"
//
//
    
    
    @EnvironmentObject var viewModel : AudioPlayer
    
    let tracks = SpotifyApiCall().$tracks
    let downloader = DownloadManager()
    let filePathUrl = UserFileDirectory().getUserFileDirectory()
    
    var body: some View {
        
        
        
        ZStack {
            
            VStack(spacing: 10) {
                HStack {
                  
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .onTapGesture {
                            //Dismiss view
                            isPresented.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text(viewModel.songSinger)
                        .font(.system(size: 15, weight: .light, design: .default))
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding()
                
                AsyncImage(url: viewModel.coverArtUrl) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 300, height: 300, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                    
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.songTitle)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .fixedSize(horizontal: true, vertical: false)
                        
                        Text(viewModel.songSinger)
                            .font(.system(size: 15, weight: .heavy, design: .default))
                            .foregroundColor(Color.gray)
                        
                    }
                    Spacer()
                    Image(systemName:  "arrow.down.circle")
                        .frame(width: 50, height: 50)
                        .onTapGesture {
//                            MARK: Downloader
                            
                            let songNameRaw = viewModel.songTitle.replacingOccurrences(of: " ", with: "")
                            
                            print("Donwload Hit")
                            downloader.downloadFile(with: viewModel.songUrl!, toFileDir: songNameRaw) { err in
                                print(err)
                            }

//                            Download song By ViewModel and write it to db
                            
                            let newTrack = Track(context: trackData)
                            newTrack.title = viewModel.songTitle
                            newTrack.subtitle = viewModel.songSinger
                            newTrack.id = UUID()
                            try? trackData.save()

                        }
                    //MARK: TODO
//                    Button {
//                        downloader.loadData(with: viewModel.songTitle.replacingOccurrences(of: " ", with: ""))
//                    } label: {
//                        Text("Click to read data")
//                    }

                }
                .padding()
                
                VStack {
                    ZStack(alignment: .leading) {
                        
                        Capsule(style: .circular)
                            .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                        .padding()
                        


                        
                        ZStack(alignment: .trailing) {
                            //Filled Time
                            Capsule(style: .circular)
                                .frame(maxWidth: 30, maxHeight: 1, alignment: .center)
                                .foregroundColor(Color.green)
                            //Indicatior
                            Circle()
                                .frame(width: 10, height: 10, alignment: .center)
                                .foregroundColor(Color.green)
                            
                                

                        }
                        
                    }
                    HStack {
                        
                        Text("0:47")
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Spacer()
                        Text("-2:47)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                    
                    
                    
                    
                }
                .padding()
                
                
                HStack(alignment: .center, spacing: 40) {
                    
                    //Previous song button
                    Button {
                        viewModel.playPrevious()
                        //Start playing the album and change the play shape
                       
                        
                    } label: {
                        
        
                            Image(systemName: "backward.end.fill")
                                .resizable()
                                .foregroundColor(Color.white)
                            
                    }
                    .frame(width: 30, height: 30)
                    
                    
                    //Play,Pause button
                    Button {
                        
                        print("value is : \(viewModel.isPlaying)")
//                        if viewModel.isPlaying {
//                            viewModel.isPlaying = false
//                        } else {
//                            //Do nothing
//                            viewModel.isPlaying = true
//
//
//                        }
                        viewModel.isPlaying.toggle()
                        //Start playing the album and change the play shape
                        
                        withAnimation {
                            
                        }
                       
                        
                    }
                    label: {
                            
                            
                            ZStack(alignment: .center) {
                                
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    
                                
                                Image(systemName : viewModel.playShape)
                                        .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 30, height: 30, alignment: .center)
                            }
                                
                        }
                    .frame(width: 70, height: 70)
//                    .onAppear {
//                        playShape = isPlaying ? "pause" : "play.fill"
//                    }
//
//
                    
                    //MARK: Next Song Button
                    Button {
                        viewModel.playNext()
                        print("CLICKED!")
                        //Start playing the album and change the play shape
                    } label: {
                        
        
                            Image(systemName: "forward.end.fill")
                                .resizable()
                                .foregroundColor(Color.white)
                            
                    }.disabled(false)
                    .frame(width: 30, height: 30)
                    
                    
                }
                .padding()
                

            
                
                
                
            }
        }
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background {
            Color.black
        }
        .ignoresSafeArea()
    }
        
    
    //MARK: FILE LOADER
    //Returning the Music URL to play in the Player
    private func loadMusicDataFromDisk(with fileName: String) -> URL? {
       
    //Check the File URL, if exists, load data
        
        
        let documentDir = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        
        let paths = NSSearchPathForDirectoriesInDomains(documentDir, userDomainMask, true)
        
        if let dirPath = paths.first {
            
            let musicUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            
            
            print("Music URL has been set!")
            return musicUrl
            
        }
        
        print("Music URL NOT FOUND ON DEVICE")
        return nil
        
}
}
