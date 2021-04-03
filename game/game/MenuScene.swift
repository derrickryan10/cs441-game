//
//  MenuScene.swift
//  game
//
//  Created by Derrick Ryan on 3/24/21.
//

import Foundation
import SpriteKit

class MenuScene: SKScene{
    
    override func didMove(to view: SKView) {
        //let background = SKSpriteNode(imageNamed: "DiscsBackground")
        //background.size = self.size
        //background.zPosition = 0
        //background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        //self.addChild(background)
        
        //title
        //let gameTitleLabel = SKLabelNode(fontNamed: "Pusab")
        let gameTitleLabel = SKLabelNode()
        gameTitleLabel.text = "Target Taps"
        gameTitleLabel.fontSize = 140
        gameTitleLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        //gameOverLabel.fontColor = SKColor.white
        gameTitleLabel.zPosition = 1
        self.addChild(gameTitleLabel)
        
        //start button
        //let gameTitleLabel = SKLabelNode(fontNamed: "Pusab")
        let startLabel = SKLabelNode()
        startLabel.text = "Start"
        startLabel.fontSize = 140
        startLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.35)
        //gameOverLabel.fontColor = SKColor.white
        startLabel.zPosition = 1
        startLabel.name = "startButton"
        self.addChild(startLabel)
        
        //instructions button
        //let gameTitleLabel = SKLabelNode(fontNamed: "Pusab")
        let instructionsLabel = SKLabelNode()
        instructionsLabel.text = "Instructions"
        instructionsLabel.fontSize = 140
        instructionsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        //gameOverLabel.fontColor = SKColor.white
        instructionsLabel.zPosition = 1
        instructionsLabel.name = "instructionsButton"
        self.addChild(instructionsLabel)
        
        
    }
    
    //button taps
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "startButton"{
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "instructionsButton"{
                let sceneToMoveTo = InstructionsScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
    
}
