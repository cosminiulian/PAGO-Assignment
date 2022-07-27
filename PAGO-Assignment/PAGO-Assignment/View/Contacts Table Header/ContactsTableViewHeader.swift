//
//  ContactsTableViewHeader.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

final class ContactsTableViewHeader: UIView {
    
    let myContactsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = UIColor(named: "GrayColor")
        label.text = "MY CONTACTS"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "BackgroundColor")
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
