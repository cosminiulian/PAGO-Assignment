//
//  ButtonExtension.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

extension UIButton {
    
    func addShadowAndCornerRadius(shadowColor: UIColor, cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
