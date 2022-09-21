//
//  SongView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/24/22.
//

import SwiftUI

struct SongView: View {
    
    
    //Album Art
    @State var albumArt = ""
    @State var albumName = ""
    
    
    
    var body: some View {
        VStack(spacing: 5) {
            Image("heartless")
                .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(10)
            Text("Heatless")
                .font(.system(size: 15, weight: .light, design: .rounded))
                .foregroundColor(Color.white)
        }
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView()
    }
}
