//
//  HeaderView.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

final class HeaderView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageForButton(image: UIImage, tintColor: UIColor? = nil) {
        if let tintColor = tintColor {
            let image = image.withRenderingMode(.alwaysTemplate)
            self.button.setBackgroundImage(image, for: .normal)
            self.button.tintColor = tintColor
        } else {
            self.button.setBackgroundImage(image, for: .normal)
        }
    }
    
    func addActionForButton(_ viewController: UIViewController, action: Selector) {
        self.button.addTarget(viewController, action: action, for: .touchUpInside)
    }
    
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
}
