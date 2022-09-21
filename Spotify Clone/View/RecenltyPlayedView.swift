//
//  RecenltyPlayedView8.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/24/22.
//

import SwiftUI

struct RecenltyPlayedView: View {
    
    @StateObject var vm = CoreDataManagerViewModel()
    
    var body: some View {
        ZStack {
        
            VStack(alignment: .leading) {
                Text("Recently played")
                    .font(.system(size: 25, weight: .heavy, design: .default))
                    .foregroundColor(Color.white)
                .foregroundColor(.white)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        ForEach(0..<8){_ in
                            SongView()
                                
                        }
                    }
                }
                ConinueListeningView()

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RecenltyPlayedView8_Previews: PreviewProvider {
    static var previews: some View {
        RecenltyPlayedView()
    }
}
