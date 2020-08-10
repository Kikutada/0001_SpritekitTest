# SpriteKit Manager

"SpriteKit Manager" makes it easy to draw sprites. This is a wrapper class for SpriteKit. "SpritekitManager.swift" file provides below features.

For example, if you want to draw a sprite at the position:

```swift
draw(0, x: 8, y: 8, texture: 1)
```

Also, if you want to animate a sprite at regular intervals:

```swift
startAnimation(0, sequence: [0,1,2], timePerFrame: 0.1, repeat: true)
```
You can draw and animate the sprites by using specified sprite and texture number.

# Assets

The texture number is cut out from an asset image by the size of character pixels.

"spriteTest.png" is an asset image for sprite. 

<img src="https://github.com/Kikutada/0001_SpritekitTest/blob/master/0001_SpritekitTest/Assets.xcassets/spriteTest.imageset/spriteTest.png?raw=true" width=256>

The assigned texture numbers are :

| 4 | 5 | 6 | 7 |
|---|---|---|---|
| 0 | 1 | 2 | 3 |


"backgroundTest.png" is an asset image for background. It is useful for background tiles and pixel texts.

<img src="https://github.com/Kikutada/0001_SpritekitTest/blob/master/0001_SpritekitTest/Assets.xcassets/backgroundTest.imageset/backgroundTest.png?raw=true" width=384>

# Sample

When you run the program, the following screen will be displayed.

<img src="https://github.com/Kikutada/0001_SpritekitTest/blob/master/imgaes/0001_spritekitTest.png?raw=true" width=288>

# Usages

To display the sprites, create CgSpriteManager class and call the APIs.

```swift
// Create a sprite manager object.
let sprite = CgSpriteManager(view: self, imageNamed: "spriteTest.png", width: 16, height: 16, maxNumber: 64)
        
// Draw a #0 sprite with #1 texture at (8,8) position.
sprite.draw(0, x: 8, y: 8, texture: 1)
```

To display the backgrounds, create CgBackgroundManager class and call the APIs.

```swift
// Create a background manager object.
let background = CgBackgroundManager(view: self, imageNamed: "backgroundTest.png", width: 8, height: 8, maxNumber: 2)

// Draw a #0 background of (28x36) size at (14*8,18*8) position.
background.draw(0, x: 14*8, y: 18*8, columnsInWidth: 28, rowsInHeight: 36)

// Put a #1 texture on #0 background at (14,19).
background.put(0, column: 14, row: 19, texture: 16*8)

// Print text on #0 background at (8,18).
background.putString(0, column: 8, row: 18, string: "SPRITEKIT TEST", offset: -16*2 /* ASCII offset */)
```


# APIs

CgSpriteManager class

 * draw(_ number: Int, x: CGFloat, y: CGFloat, texture: Int)
 * clear(_ number: Int)
 * hide(_ number: Int)
 * setPosition(_ number: Int, x: CGFloat, y: CGFloat)
 * setDepth(_ number: Int, zPosition: CGFloat)
 * setTexture(_ number: Int, texture: Int)
 * startAnimation(_ number: Int, sequence: [Int], timePerFrame: Double,  repeat forever: Bool)
 * stopAnimation(_ number: Int)
 * setOrigin(_ number: Int, xOrigin: CGFloat, yOrigin: CGFloat)
 * setRotation(_ number: Int, radians: CGFloat)
 * setScale(_ number: Int, xScale: CGFloat, yScale: CGFloat)

CgBackgroundManager class

* draw(_ number: Int, x: CGFloat, y: CGFloat, columnsInWidth: Int, rowsInHeight: Int)
* clear(_ number: Int)
* setPosition(_ number: Int, x: CGFloat, y: CGFloat)
* setDepth(_ number: Int, zPosition: CGFloat)
* fill(_ number: Int, texture: Int)
* put(_ number: Int, column: Int, row: Int, texture: Int)
* put(_ number: Int, column: Int, row: Int, columnsInwidth: Int, rowsInHeight: Int, textures: [Int], offset: Int = 0)
* putString(_ number: Int, column: Int, row: Int, string: String, offset: Int = 0)
* extendAnimationTexture(sequence: [Int], timePerFrame: CGFloat)

# Enviornments

* Swift 5.0
* Xcode 11.6
* iOS 12.2

# Author

* Kikutada

# License

"SpriteKit Manager" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

