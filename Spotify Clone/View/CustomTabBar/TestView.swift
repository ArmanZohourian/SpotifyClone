//
//  TestView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 5/9/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    
                    Text("Custom Bar Player")
                        .frame(maxWidth: 80, maxHeight: .infinity)
                        .background {
                            Color.red
                        }
                    Text("Content")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            Color.green
                        }
                }
                
            }
            Text("Mini Player")
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background {
                    Color.blue.opacity(0.5)
                }
                .ignoresSafeArea()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.gray
        }
        .ignoresSafeArea()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
