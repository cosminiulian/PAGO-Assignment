//
//  ContactDetailsController+Protocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

extension ContactDetailsViewController: ViewControllerProtocol {
    
    func setupNavController() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func setupSubviews() {
        view.addSubview(headerView)
        view.addSubview(saveButton)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(fieldsStackView)
        
        fieldsStackView.addArrangedSubview(lastNameField)
        fieldsStackView.addArrangedSubview(firstNameField)
        fieldsStackView.addArrangedSubview(phoneField)
        fieldsStackView.addArrangedSubview(emailField)
    }
    
    func setupConstraints() {
        scrollView.anchorToCenterX(
            top: headerView.bottomAnchor,
            bottom: saveButton.topAnchor,
            centerX: view.centerXAnchor)
        
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        contentView.anchorToCenterX(
            top: scrollView.topAnchor,
            bottom: scrollView.bottomAnchor,
            centerX: scrollView.centerXAnchor)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        headerView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            heightConstant: 130)
        
        fieldsStackView.anchor(
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            bottom: contentView.bottomAnchor,
            right: contentView.rightAnchor,
            topConstant: 20,
            leftConstant: 20,
            bottomConstant: 20,
            rightConstant: 20,
            heightConstant: 467)
        
        saveButton.anchor(
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.rightAnchor,
            leftConstant: 20,
            bottomConstant: 20,
            rightConstant: 20,
            heightConstant: 50)
    }
    
    func setupButtonsAction() {
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
}
