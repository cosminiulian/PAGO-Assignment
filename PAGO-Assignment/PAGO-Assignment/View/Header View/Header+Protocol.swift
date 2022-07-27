//
//  Header+Protocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

extension HeaderView: ViewProtocol {
    
    func setupSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(button)
    }
    
    func setupConstraints() {
        titleLabel.anchor(
            left: leftAnchor,
            bottom: bottomAnchor,
            right: button.leftAnchor,
            leftConstant: 25,
            bottomConstant: 15,
            heightConstant: 35)
        
        button.anchor(
            bottom: bottomAnchor,
            right: rightAnchor,
            bottomConstant: 15,
            rightConstant: 25,
            widthConstant: 35,
            heightConstant: 35)
    }
}
