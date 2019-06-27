//
//  RoundView.swift
//

import UIKit

class RoundView: UIControl {

    let cornerRadius: CGFloat =  8.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }

}
