//
//  SpotifyAPICall.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/30/22.
//

import Foundation
import Accessibility
import SwiftUI

final class SpotifyApiCall: ObservableObject {
    
    
    //MARK: Model
    @Published var tracks =  [FinalTrackModel]()
    
    //MultiThreading for UI should be asssigned
    
    
    //MARK: Intent
    func fetchAlbums() {

    let headers = [
        "X-RapidAPI-Host": "shazam.p.rapidapi.com",
        "X-RapidAPI-Key": "93e122311bmsh84b8d3afdd93a49p1dc017jsn21f24e3bfec4"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://shazam.p.rapidapi.com/charts/track?locale=en-US&pageSize=20&startFrom=0")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            
            
            print(error!)
        } else {
            
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    if let shazamData = try? decoder.decode(BaseModel.self, from: data) {
                        
                        for song in shazamData.tracks.indices {
                            
                            self.tracks.append(FinalTrackModel(id: song + 1, title: shazamData.tracks[song].title, subtitle: shazamData.tracks[song].subtitle, image: shazamData.tracks[song].images.coverarthq, uriPlayer: shazamData.tracks[song].hub.actions[1].uri!))
                            
                        }
                        
                        print("Songs are: \(self.tracks)")
                        
                    }
                    
                    
                }
                
            }
            
            
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse!)
        }
    })

    dataTask.resume()
    }
    
}
