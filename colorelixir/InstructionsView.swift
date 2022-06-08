//
//  InstructionsView.swift
//  colorelixir
//
//  Created by Claudia Fiorentino on 07/06/22.
//

import SwiftUI

struct InstructionsView: View {
    @Binding var instructionsIsActive : Bool
    
    var body: some View {
        VStack(alignment: .center) {
            InstructionsContentView()
                .navigationTitle("Instructions Screen")
            ZStack {
                NavigationLink(destination: GameView(gameIsActive: self.$instructionsIsActive), label: {
                    Text("Ready")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                })
            }
        }
    }
}

struct InstructionsContentView: View {
    var body: some View {
        VStack {
            Text("Instructions text")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding()
                .lineLimit(.max)
        }
    }
}
