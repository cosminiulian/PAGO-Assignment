//
//  DrawingHelper.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

struct DrawingHelper {
    
    static func drawImage(initials: String, size: CGFloat, color: UIColor) -> UIImage {
        let imageRenderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        
        let image = imageRenderer.image { _ in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size / 2),
                              NSAttributedString.Key.paragraphStyle: paragraphStyle,
                              NSAttributedString.Key.foregroundColor: color]
            
            initials.draw(with: CGRect(x: 0, y: size / 5, width: size, height: size),
                          options: .usesLineFragmentOrigin,
                          attributes: attributes,
                          context: nil)
        }
        return image
    }
}
