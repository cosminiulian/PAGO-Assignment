//
//  ContactsTableHeader+Protocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

extension ContactsTableViewHeader: ViewProtocol {
    
    func setupSubviews() {
        addSubview(myContactsLabel)
    }
    
    func setupConstraints() {
        myContactsLabel.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            topConstant: 10,
            leftConstant: 25,
            bottomConstant: 10,
            rightConstant: 25)
    }
}
