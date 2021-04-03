//
//  GameViewController.swift
//  game
//
//  Created by Derrick Ryan on 3/23/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            //if let scene = SKScene(fileNamed: "GameScene") {
            let scene = MenuScene(size: CGSize(width: 1536, height: 2048))
            //let scene = GameScene(size: CGSize(width: 1080, height: 1920))
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            //}
            
            view.ignoresSiblingOrder = true
            
            //view.showsFPS = true
            //view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
