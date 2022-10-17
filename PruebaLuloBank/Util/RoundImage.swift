//
//  RoundImage.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 17/10/22.
//

import Foundation
import UIKit
@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var rounded: CGFloat = 0{
        didSet {
            if rounded > 0
            {
                let radius = self.frame.width / 2
                self.layer.cornerRadius = radius
                self.layer.masksToBounds = true
            }
        }
    }
}
