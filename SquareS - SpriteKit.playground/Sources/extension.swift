import Foundation
import SpriteKit

extension UIColor {
    /**
     * Returns random color
     * EXAMPLE: self.backgroundColor = UIColor.random
     */
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0.25 ... 1)
        let g:CGFloat  = .random(in: 0.25 ... 1)
        let b:CGFloat  = .random(in: 0.25 ... 1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

