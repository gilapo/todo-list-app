//
//  CardView.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 07/04/22.
//

import Foundation
import UIKit

@IBDesignable class CardView:UIView{
    
    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var shadowColor:UIColor = UIColor.systemBackground
    
    var offsetWidth:CGFloat = 5
    var offsetHeight:CGFloat = 5
    var offsetShadowOpacity:CGFloat = 0.3
    
    
    
    override func layoutSubviews() {
        layer.cornerRadius = self.cornerRadius
        layer.shadowColor = self.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: self.offsetWidth, height: self.offsetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        layer.shadowOpacity = Float(self.offsetShadowOpacity)
    }
    
    
}
