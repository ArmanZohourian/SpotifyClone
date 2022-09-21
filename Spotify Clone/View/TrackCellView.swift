//
//  TrackCellView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/5/22.
//

import SwiftUI

struct TrackCellView: View {
    
    @State var title = ""
    @State var subtitle = ""
    @State var image: URL?
    
    var body: some View {
        
        HStack(spacing:3) {
            
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                Text(subtitle)
                    .font(.system(size: 15, weight: .light, design: .default))
            }
            Spacer()
            
            AsyncImage(url: self.image) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 70, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            Divider()
            
            
            
//                        Text(song.title )
//                        Text(song.subtitle )
        }
        .padding()
    }
}
