//
//  RoundButton.swift
//

import UIKit

class RoundButton: UIButton {

    let cornerRadius: CGFloat =  8.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }

}

