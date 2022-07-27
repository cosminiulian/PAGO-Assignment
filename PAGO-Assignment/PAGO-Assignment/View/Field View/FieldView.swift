//
//  FieldView.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

final class FieldView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "GrayColor")
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.addDoneButtonOnKeyboard()
        textField.setLeftPaddingPoints(5)
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        return textField
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        return view
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    func markFieldRed() {
        label.textColor = .red
        separatorView.backgroundColor = .red
    }
    
    func resetFieldColor() {
        label.textColor = UIColor(named: "GrayColor")
        separatorView.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
}
