//
//  VMTestView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/13/22.
//

import SwiftUI

struct VMTestView: View {
    
    @EnvironmentObject var viewModel: PlayerViewModel
    
    var body: some View {
        
        
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background {
                if viewModel.isPlaying {
                    Color.gray
                } else {
                    Color.orange
                }
            }
    }
}

struct VMTestView_Previews: PreviewProvider {
    static var previews: some View {
        VMTestView()
    }
}
