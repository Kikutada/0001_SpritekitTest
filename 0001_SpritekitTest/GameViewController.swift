//
//  GameViewController.swift
//  0001_SpritekitTest
//
//  Created by Kikutada on 2020/08/09.
//  Copyright © 2020 Kikutada All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    private var scene: SKScene!
    
    override func viewDidLoad() {
       super.viewDidLoad()
       
       if let view = self.view as! SKView? {
           
           let size = CGSize(width: 28*8, height: 36*8)
           scene = GameScene(size: size)
           
           // Set background color to black
           scene.backgroundColor = UIColor.black

           // Set the scale mode to scale to fit the window
           scene.scaleMode = .aspectFit
           
           // Present the scene
           view.presentScene(scene)
           
           view.ignoresSiblingOrder = true
           
           view.showsFPS = true
           view.showsNodeCount = true
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
