//
//  ContentView.swift
//  colorelixir
//
//  Created by Celso Eduardo Muza Ferreira on 03/06/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        MenuView()
    }
}

struct MenuView: View {
    @State var isActive : Bool = false
    
    var body: some View {
   
        NavigationView {
            VStack(alignment: .center) {
                MenuContentView()
                    .navigationTitle("")
                            
                
                
                Image("imgMenu")
                //.resizable()
                //.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.3)
                .scaledToFit()
                .padding()
                
                
                NavigationLink(destination: GameView(gameIsActive: self.$isActive),isActive: self.$isActive, label: {
                    Text("Start")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
                })
                
                NavigationLink(destination: InstructionsView(instructionsIsActive: self.$isActive),isActive: self.$isActive, label: {
                    Text("Instructions")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                    
                        
                })
                
                Spacer(minLength: 120)
                
                
            }
        } .navigationViewStyle(.stack)
    }
}



struct MenuContentView: View {
    var body: some View {
            VStack {
                Text("")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .lineLimit(.max)
            }

    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
