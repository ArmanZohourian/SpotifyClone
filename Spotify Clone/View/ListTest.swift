//
//  ListTest.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 6/4/22.
//

import SwiftUI

struct ListTest: View {
    
    
    @State private var songs = [
        "Heartless",
        "Is The someone else?",
        "PRISONER MIKE!"
    ]
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .trailing) {
                EditButton()
                    .padding()
                List {
                    ForEach(songs, id: \.self) { song in
                        Text(song)
                    }
                    .onDelete {  songs.remove(atOffsets: $0) }
                    .onMove { songs.move(fromOffsets: $0, toOffset: $1)}
                            
                }
            }
     
        }
        
    }
}

struct ListTest_Previews: PreviewProvider {
    static var previews: some View {
        ListTest()
    }
}
