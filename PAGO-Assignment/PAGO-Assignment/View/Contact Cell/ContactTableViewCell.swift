//
//  ContactTableViewCell.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit
import SDWebImage

final class ContactTableViewCell: UITableViewCell {
    
    public static let identifier = "ContactTableViewCell"
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "LightGrayColor")
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(user: User) {
        userNameLabel.text = user.name
        if user.id % 2 == 0 {
            let initials = user.name.getInitials()
            userImageView.image = DrawingHelper.drawImage(
                initials: initials,
                size: 250,
                color: .white)
        } else {
            guard let url = URL(string: URLs.userImage) else { return }
            userImageView.sd_setImage(with: url)
        }
    }
    
}
