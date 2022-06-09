//
//  GameView.swift
//  colorelixir
//
//  Created by Claudia Fiorentino on 07/06/22.
//

import SwiftUI
import RealityKit
import ARKit

struct GameView: View {
    var body: some View {

        VStack(alignment: .center) {
            GameContentView()
                .navigationTitle("Como jogar?")
            Button (action: { self.gameIsActive = false } ){
                Text("Estou Pronto!")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    //.padding()
            }
        }
    }
}

struct GameContentView: View {
    var body: some View {
        VStack {
          
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
            
           
        }

        return ARViewContainer.init()
    }
}
