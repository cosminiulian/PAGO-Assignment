//
//  Field+Protocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

extension FieldView: ViewProtocol {
    
    func setupSubviews() {
        addSubview(label)
        addSubview(textField)
        addSubview(separatorView)
    }
    
    func setupConstraints() {
        label.anchor(
            top: topAnchor,
            left: leftAnchor,
            right: rightAnchor,
            topConstant: 15,
            leftConstant: 15,
            rightConstant: 15,
            heightConstant: 30)
        
        textField.anchor(
            left: leftAnchor,
            bottom: separatorView.topAnchor,
            right: rightAnchor,
            leftConstant: 15,
            rightConstant: 15,
            heightConstant: 30)
        
        separatorView.anchor(
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            leftConstant: 15,
            bottomConstant: 15,
            rightConstant: 15,
            heightConstant: 2)
    }
}
