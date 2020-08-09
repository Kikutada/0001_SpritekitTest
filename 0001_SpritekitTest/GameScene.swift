//
//  GameScene.swift
//  0001_SpritekitTest
//
//  Created by Kikutada on 2020/08/09.
//  Copyright © 2020 Kikutada All rights reserved.
//

import SpriteKit

//
class CgCustomBackgroundManager : CgBackgroundManager {
    override func extendTextures() -> Int {
        // Texture number assigns to #128(=16*8).
        extendAnimationTexture(sequence: [79, 0], timePerFrame: 0.2)
        return 1 // Number of added textures by calling extendAnimationTexture function.
    }
}

class GameScene: SKScene {
    
    var sprite: CgSpriteManager!
    var background: CgCustomBackgroundManager!

    override func didMove(to view: SKView) {

        // Creates sprite and background instances.
        sprite = CgSpriteManager(view: self, imageNamed: "spriteTest.png", width: 16, height: 16, maxNumber: 64)
        background = CgCustomBackgroundManager(view: self, imageNamed: "backgroundTest.png", width: 8, height: 8, maxNumber: 2)

        // Draws cherries.
        sprite.draw(0, x: 8, y: 8, texture: 3)
        sprite.draw(1, x: 16*13+8, y: 8, texture: 3)
        sprite.draw(2, x: 8, y: 16*17+8, texture: 3)
        sprite.draw(3, x: 16*13+8, y: 16*17+8, texture: 3)

        // Animates Pacman.
        sprite.setPosition(4, x: 13*8+8, y: 16*12)
        sprite.setRotation(4, radians: CGFloat(90.0 * .pi / 180.0))
        sprite.startAnimation(4, sequence: [0,1,2], timePerFrame: 0.1, repeat: true)

        // Animates Ghost.
        sprite.setPosition(5, x: 13*8+8, y: 16*6)
        sprite.startAnimation(5, sequence: [4,5], timePerFrame: 0.1, repeat: true)
        
        // Draws grid on background #0.
        background.draw(0, x: 14*8, y: 18*8, columnsInWidth: 28, rowsInHeight: 36)
        background.setDepth(0, zPosition: 0)

        for y in 0 ..< 18  {
            for x in 0 ..< 14  {
                background.put(0, column: x*2, row: y*2, columnsInwidth: 2, rowsInHeight: 2, textures: [4,5,6,7])
            }
        }

        // Prints text on background #1.
        background.draw(1, x: 14*8, y: 18*8, columnsInWidth: 28, rowsInHeight: 36)
        background.setDepth(1, zPosition: 1)

        let asciiOffset = -16*2
        background.putString(1, column: 8, row: 18, string: "SPRITEKIT TEST", offset: asciiOffset)
 
        // Put an animated texture on background #1.
        background.put(1, column: 14, row: 19, texture: 16*8)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
