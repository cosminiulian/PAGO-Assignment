//
//  ContactCell+Protocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

extension ContactTableViewCell: ViewProtocol {
    
    func setupSubviews() {
        self.addSubview(userImageView)
        self.addSubview(userNameLabel)
    }
    
    func setupConstraints() {
        userImageView.anchorToCenterY(
            left: leftAnchor,
            leftConstant: 25,
            widthConstant: 50,
            heightConstant: 50,
            centerY: centerYAnchor)
        
        userNameLabel.anchorToCenterY(
            left: userImageView.rightAnchor,
            right: rightAnchor,
            leftConstant: 15,
            rightConstant: 10,
            heightConstant: 40,
            centerY: centerYAnchor)
    }
}
