//
//  GameOverScene.swift
//  game
//
//  Created by Derrick Ryan on 3/24/21.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    override func didMove(to view: SKView) {
        
        //background
        let background = SKSpriteNode(imageNamed: "bluebg.jpeg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        //title
        let gameOverLabel = SKLabelNode(fontNamed: "Futura")
        gameOverLabel.text = "GAME OVER"
        gameOverLabel.fontSize = 180
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        //score
        let finalScoreLabel = SKLabelNode(fontNamed: "Futura")
        finalScoreLabel.text = "Score: \(scoreNumber)"
        finalScoreLabel.fontSize = 80
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        finalScoreLabel.zPosition = 1
        finalScoreLabel.fontColor = SKColor.white
        self.addChild(finalScoreLabel)
        
        //high score
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        //save high score
        if scoreNumber > highScoreNumber{
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
        //high score label
        let highScoreLabel = SKLabelNode(fontNamed: "Futura")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 80
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        self.addChild(highScoreLabel)
        
        //restart button
        let restartLabel = SKLabelNode(fontNamed: "Futura")
        restartLabel.text = "RESTART"
        restartLabel.fontSize = 130
        restartLabel.zPosition = 1
        restartLabel.fontColor = SKColor.white
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        restartLabel.name = "restartButton"
        self.addChild(restartLabel)
        
        //exit button
        let exitLabel = SKLabelNode(fontNamed: "Futura")
        exitLabel.text = "EXIT"
        exitLabel.fontSize = 130
        exitLabel.zPosition = 1
        exitLabel.fontColor = SKColor.white
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        exitLabel.name = "exitButton"
        self.addChild(exitLabel)
    }
    
    //button taps
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "restartButton"{
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "exitButton"{
                let sceneToMoveTo = MenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
}
