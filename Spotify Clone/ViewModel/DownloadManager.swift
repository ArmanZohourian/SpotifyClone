//
//  DownloadManager.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/10/22.
//

import Foundation


class DownloadManager: ObservableObject {
    
    
    var url: String?
    let filePathUrl = UserFileDirectory().getUserFileDirectory()
    

    //MARK: Downloader And Writing To Disk
func downloadFile(with url: URL, toFileDir filePath: String, completion: @escaping((Error?) -> Void)) {
        
        
        let downloadTask = URLSession.shared.downloadTask(with: url) { (tempUrl, resp, err) in
            
            guard let tempUrl = tempUrl else {
                print(err)
                return
            }
            
            do {
                //Download file
//                if FileManager.default.fileExists(atPath: filePath.path) {
//                    try FileManager.default.removeItem(at: filePath)
//                }
                
                let urlData = try Data(contentsOf: tempUrl)
                try urlData.write(to: self.filePathUrl.appendingPathComponent(filePath))
//                try FileManager.default.copyItem(at: tempUrl, to: filePath)
                print("Download has been successful")
                completion(nil)
                
            } catch let fileError{
                completion(err)
            }

            
        }
        //Starting the download after checking the cridentials.
        downloadTask.resume()
        
    }
    
    //MARK: Accessing the The Disk to Load Data
    //NOT NEEDED
    func loadData(with songName: String) {
        
        do {
            let savedMusicData = try Data(contentsOf: filePathUrl.appendingPathComponent(songName))
            print("Saved Data Loaded UP\(savedMusicData)")
        }
        catch {
            
        print("Song does not exist !")
        }
        
    }
    
}
