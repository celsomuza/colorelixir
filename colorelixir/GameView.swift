//
//  GameView.swift
//  colorelixir
//
//  Created by Claudia Fiorentino on 07/06/22.
//

import SwiftUI

struct GameView: View {
    @Binding var gameIsActive : Bool
    
    var body: some View {
        VStack(alignment: .center) {
            GameContentView()
                .navigationTitle("Como jogar?")
            Button (action: { self.gameIsActive = false } ){
                Text("Done")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}

struct GameContentView: View {
    var body: some View {
        VStack {
            Text("Character text")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding()
                .lineLimit(.max)
        }
    }
}
