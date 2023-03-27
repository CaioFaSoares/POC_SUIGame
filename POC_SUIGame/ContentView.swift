//
//  ContentView.swift
//  POC_SUIGame
//
//  Created by Caio Soares on 27/03/23.
//

import SwiftUI
import SpriteKit

// A simple game scene with falling boxes
class GameScene: SKScene, ObservableObject {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
    
    func generateBoxFromButtonClick() {
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = CGPoint(x: 100, y: 100)
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
    
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct ContentView: View {
    @ObservedObject var gameScene = GameScene(
        size: CGSize(width: 300, height: 400)
    )

    var body: some View {
        VStack{
            SpriteView(scene: gameScene)
                .frame(width: 300, height: 400)
                .ignoresSafeArea()
            Button("Spawn Box") {
                gameScene.generateBoxFromButtonClick()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
