//
//  InstructionsScene.swift
//  game
//
//  Created by Derrick Ryan on 4/3/21.
//

import Foundation
import SpriteKit

class InstructionsScene: SKScene{
    
    override func didMove(to view: SKView) {
        //title
        //let InstructionsLabel = SKLabelNode(fontNamed: "Pusab")
        let InstructionsLabel = SKLabelNode()
        InstructionsLabel.text = "Instructions"
        InstructionsLabel.fontSize = 140
        InstructionsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        //gameOverLabel.fontColor = SKColor.white
        InstructionsLabel.zPosition = 1
        self.addChild(InstructionsLabel)
        
        //title
        //let DescriptionLabel = SKLabelNode(fontNamed: "Pusab")
        let DescriptionLabel = SKLabelNode()
        DescriptionLabel.text = "Tap the targets before they dissapear"
        DescriptionLabel.fontSize = 70
        DescriptionLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        //gameOverLabel.fontColor = SKColor.white
        DescriptionLabel.zPosition = 1
        self.addChild(DescriptionLabel)
        
        //back button
        //let gameTitleLabel = SKLabelNode(fontNamed: "Pusab")
        let backLabel = SKLabelNode()
        backLabel.text = "Back"
        backLabel.fontSize = 140
        backLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        //gameOverLabel.fontColor = SKColor.white
        backLabel.zPosition = 1
        backLabel.name = "backButton"
        self.addChild(backLabel)
    }
    
    //button taps
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "backButton"{
                let sceneToMoveTo = MenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
//            if tappedNodeName == "exitButton"{
//                let sceneToMoveTo = MenuScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let sceneTransition = SKTransition.fade(withDuration: 0.2)
//                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
//            }
        }
    }
    

    
}
