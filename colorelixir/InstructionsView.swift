//
//  GameView.swift
//  colorelixir
//
//  Created by Claudia Fiorentino on 09/06/22.
//

import SwiftUI
import RealityKit
import ARKit

struct InstructionsView: View {
    @State private var showingGame: Bool = false
    var body: some View {
        if !showingGame {
            VStack {
                Text("Como jogar?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .lineLimit(.max)
                Image("imgPotions")
                    .resizable()
                //.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.3)
                    .scaledToFit()
                    .padding()
                
                Text("Utilize nossas cartas para que consiga participar da experiência. Utilize sua câmera para reconhecer suas poções e fazer os melhores drinks do reino.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .lineLimit(.max)
                
                Button("Estou pronto!") {
                    showingGame = true
                }
                .frame(width: 280, height: 50)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer(minLength: 120)
                
            }
        }
        
        else {
            GameView()
        }
    }
}
