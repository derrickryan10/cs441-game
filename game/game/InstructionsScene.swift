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
        
        //background
        let background = SKSpriteNode(imageNamed: "bluebg.jpeg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        //instructions title
        let instructionsLabel = SKLabelNode(fontNamed: "Futura")
        instructionsLabel.text = "INSTRUCTIONS"
        instructionsLabel.fontSize = 130
        instructionsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        instructionsLabel.fontColor = SKColor.white
        instructionsLabel.zPosition = 1
        self.addChild(instructionsLabel)
        
        //description line 1
        let descriptionLabel = SKLabelNode(fontNamed: "Futura")
        descriptionLabel.text = "Tap the targets before they dissapear"
        descriptionLabel.fontSize = 70
        descriptionLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        descriptionLabel.fontColor = SKColor.white
        descriptionLabel.zPosition = 1
        self.addChild(descriptionLabel)
        
        //description line 2
        let descriptionLabel2 = SKLabelNode(fontNamed: "Futura")
        descriptionLabel2.text = "Each target is worth 1 point"
        descriptionLabel2.fontSize = 70
        descriptionLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        descriptionLabel2.fontColor = SKColor.white
        descriptionLabel2.zPosition = 1
        self.addChild(descriptionLabel2)
        
        //description line 3
        let descriptionLabel3 = SKLabelNode(fontNamed: "Futura")
        descriptionLabel3.text = "Miss a target and it's game over"
        descriptionLabel3.fontSize = 70
        descriptionLabel3.position = CGPoint(x: self.size.width/2, y: self.size.height*0.4)
        descriptionLabel3.fontColor = SKColor.white
        descriptionLabel3.zPosition = 1
        self.addChild(descriptionLabel3)
        
        //back button
        let backLabel = SKLabelNode(fontNamed: "Futura")
        backLabel.text = "BACK"
        backLabel.fontSize = 130
        backLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        backLabel.fontColor = SKColor.white
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
            
            //fade transition
            if tappedNodeName == "backButton"{
                let sceneToMoveTo = MenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
    

    
}
