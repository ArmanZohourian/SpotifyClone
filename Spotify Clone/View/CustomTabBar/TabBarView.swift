//
//  TabBarView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/23/22.
//

import SwiftUI



struct TabBarView: View {
    
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        
        Button {
            withAnimation {
                selectedTab = image
            }
            
        } label: {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(selectedTab == image ? .white : Color.gray.opacity(0.6) )
                .frame(maxHeight: .infinity)
        }

    }
    
    
}

