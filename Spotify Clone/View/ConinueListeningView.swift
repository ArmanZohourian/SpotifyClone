//
//  ConinueListeningView.swift
//  Spotify Clone
//
//  Created by Arman Zohourian on 4/24/22.
//

import SwiftUI

struct ConinueListeningView: View {
    
    //play button state
    @State var playShape = "play.fill"
    @State var isPlaying = false
    
    var body: some View {
        
        
        
        VStack {
            
            VStack(alignment: .leading, spacing: 10) {
                
              
                Text("Conintue Listening")
                    .font(.system(size: 25, weight: .heavy, design: .default))
                    .foregroundColor(Color.white)
                    .foregroundColor(.white)
                
              
                ZStack(alignment: .bottomTrailing) {
                    
                  
                    
                    Image("willow")
                        .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                    .cornerRadius(10)
                    

                    
                    Button {
                        
                        //Start playing the album and change the play shape
                        
                        withAnimation {
                            isPlaying = !isPlaying
                            playShape = isPlaying ? "pause" : "play.fill"
                        }
                       
                        
                    } label: {
                        
                        
                        ZStack {
                            
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundColor(Color.green)
                            
                            Image(systemName : playShape)
                                    .resizable()
                                .foregroundColor(Color.white)
                                .padding()
                        }
                            
                    }
                    .frame(width: 50, height: 50)
                    
                    .padding()


                    
                }
                

            }
            VStack(alignment: .center, spacing: 5) {
                Text("Marjorie")
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .foregroundColor(Color.white)
                    .foregroundColor(.white)
                Text("Taylor Swift")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundColor(Color.white)
                    .foregroundColor(.white)
            }
            
            
            
            
        }
        

        
    }
}

struct ConinueListeningView_Previews: PreviewProvider {
    static var previews: some View {
        ConinueListeningView()
    }
}
