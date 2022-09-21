//
//  Spotify_CloneApp.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/23/22.
//

import SwiftUI

@main
struct Spotify_CloneApp: App {
    
    private var dataController = CoreDataManager.instance

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
