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
        
        //background
        let background = SKSpriteNode(imageNamed: "bluebg.jpeg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        //target title
        let gameTitleLabel = SKLabelNode(fontNamed: "Futura")
        gameTitleLabel.text = "TARGET"
        gameTitleLabel.fontSize = 200
        gameTitleLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameTitleLabel.fontColor = SKColor.white
        gameTitleLabel.zPosition = 1
        self.addChild(gameTitleLabel)
        
        //tapper title
        let gameTitleLabel2 = SKLabelNode(fontNamed: "Futura")
        gameTitleLabel2.text = "TAPPER"
        gameTitleLabel2.fontSize = 200
        gameTitleLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        gameTitleLabel2.fontColor = SKColor.white
        gameTitleLabel2.zPosition = 1
        self.addChild(gameTitleLabel2)
        
        //start button
        let startLabel = SKLabelNode(fontNamed: "Futura")
        startLabel.text = "START"
        startLabel.fontSize = 130
        startLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        startLabel.fontColor = SKColor.white
        startLabel.zPosition = 1
        startLabel.name = "startButton"
        self.addChild(startLabel)
        
        //instructions button
        let instructionsLabel = SKLabelNode(fontNamed: "Futura")
        instructionsLabel.text = "INSTRUCTIONS"
        instructionsLabel.fontSize = 130
        instructionsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        instructionsLabel.fontColor = SKColor.white
        instructionsLabel.zPosition = 1
        instructionsLabel.name = "instructionsButton"
        self.addChild(instructionsLabel)
        
        //target image
        let target = SKSpriteNode(imageNamed: "Target2")
        target.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        target.zPosition = 2
        target.name = "targetObject"
        self.addChild(target)
    }
    
    //button taps
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            //no transition
            if tappedNodeName == "startButton"{
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                self.view!.presentScene(sceneToMoveTo)
            }
            
            //fade transition
            if tappedNodeName == "instructionsButton"{
                let sceneToMoveTo = InstructionsScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
    
}
