//
//  ContactDetailsViewController.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerView: HeaderView = {
        let view = HeaderView()
        view.button.isHidden = true
        view.setTitle(text: "Add contact")
        return view
    }()
    
    let fieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 25
        return stackView
    }()
    
    let lastNameField: FieldView = {
        let field = FieldView()
        field.label.text = "LAST NAME"
        field.layer.cornerRadius = 10
        return field
    }()
    
    let firstNameField: FieldView = {
        let field = FieldView()
        field.label.text = "FIRST NAME"
        field.layer.cornerRadius = 10
        return field
    }()
    
    let phoneField: FieldView = {
        let field = FieldView()
        field.label.text = "PHONE"
        field.layer.cornerRadius = 10
        return field
    }()
    
    let emailField: FieldView = {
        let field = FieldView()
        field.label.text = "EMAIL"
        field.layer.cornerRadius = 10
        return field
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemGreen
        button.addShadowAndCornerRadius(shadowColor: .gray,
                                        cornerRadius: 10)
        return button
    }()
    
    let user: User?
    
    init() {
        self.user = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        setupNavController()
        setupSubviews()
        setupConstraints()
        setupButtonsAction()
        
        populateFieldsIfNeeded()
    }
    
    func populateFieldsIfNeeded() {
        if let user = user {
            lastNameField.textField.text = user.name.components(separatedBy: " ")[0]
            firstNameField.textField.text = user.name.components(separatedBy: " ")[1]
            emailField.textField.text = user.email
            saveButton.setTitle("Update", for: .normal)
        } else {
            saveButton.setTitle("Save", for: .normal)
        }
    }
    
    func resetFieldsColor() {
        lastNameField.resetFieldColor()
        firstNameField.resetFieldColor()
        phoneField.resetFieldColor()
        emailField.resetFieldColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserversForKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
}
