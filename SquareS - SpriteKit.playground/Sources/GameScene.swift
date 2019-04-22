import Foundation
import SpriteKit

var SquareS = [SKSpriteNode]()
public class GameScene: SKScene {
    
    // http://depts.washington.edu/madlab/proj/dollar/index.html - reconhecimento de forma
    // http://depts.washington.edu/madlab/proj/dollar/dollar.pdf
    
    // parte de cima game
    // parte de baixo SquareS
    // botão de limpar
    
    
    override public func didMove(to view: SKView) {
        let song = SKAction.playSoundFileNamed("Song", waitForCompletion: false)
        run(song)
    }
    
    func createSquareS(pos: CGPoint) {
        let newSquare = SKSpriteNode(imageNamed: "square")
        
        newSquare.position = pos
        newSquare.color = UIColor.random
        newSquare.colorBlendFactor = 1
        newSquare.setScale(CGFloat.random(in: 0.1...0.3))
        addChild(newSquare)
        SquareS.append(newSquare)
//        print(SquareS.count)
        animateSquareS(square: newSquare)
    }
    
    func animateSquareS(square: SKSpriteNode) {
        let startDuration = 0.5
        let finalPosition = square.position
        
        square.position = CGPoint(x: CGFloat.random(in: -300...300), y: CGFloat.random(in: -300...300))
        square.alpha = 0
        let startAnimation = SKAction.move(to: finalPosition, duration: startDuration)
        let fadeIn = SKAction.fadeIn(withDuration: startDuration)
        let rotation = SKAction.rotate(byAngle: CGFloat.random(in: 0...CGFloat.pi*2), duration: startDuration)
        
        let startGroup = SKAction.group([startAnimation, fadeIn, rotation])
        square.run(startGroup)
    }
    
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        createSquareS(pos: pos)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        createSquareS(pos: pos)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count > 1 {
            print(touches.count)
            for square in SquareS {
                square.removeFromParent()
            }
            SquareS.removeAll()
        }
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
