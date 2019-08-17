

import UIKit

extension UILabel {
    // init  is a designated initializer and must always call the superclass designated initalizer
    // a convenience initialzer calls a designated initialzer of the same class
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String,fontSize:CGFloat,width:CGFloat,height:CGFloat) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        self.constrainWidth(constant: width)
        self.constrainHeight(constant: height)
        self.layer.cornerRadius = height / 2
        self.backgroundColor = UIColor(white: 0.95, alpha: 1)


        
    }
}
