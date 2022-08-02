//
//  ContactDetails+Action.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

extension ContactDetailsViewController {
    
    @objc func saveButtonAction() {
        resetFieldsColor()
        if validateFields() {
            // Save contact with Core Data
            let contact = CoreDataManager.shared.createContact(
                lastName: lastNameField.textField.text!,
                firstName: firstNameField.textField.text!,
                phone: phoneField.textField.text!,
                email: emailField.textField.text!)
            
            displayAlert(title: "Contact saved!",
                         message: "\(contact.lastName!) was saved successfully using Core Data.") { [unowned self] _ in
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            displayAlert(message: "Invalid data!")
        }
    }
    
    func validateFields() -> Bool {
        var isValid = true
        // Last name validator
        if let lastName = lastNameField.textField.text,
           !lastName.isValid() {
            lastNameField.markFieldRed()
            isValid = false
        }
        // First name validator
        if let firstName = firstNameField.textField.text,
           !firstName.isValid() {
            firstNameField.markFieldRed()
            isValid = false
        }
        // Phone nr. validator
        if let phone = phoneField.textField.text,
           !(phone.isPhoneNrValid() || phone.isEmpty) {
            phoneField.markFieldRed()
            isValid = false
        }
        // Email validator
        if let email = emailField.textField.text,
           !(email.isEmailValid() || email.isEmpty) {
            emailField.markFieldRed()
            isValid = false
        }
        return isValid
    }
    
    // Observer Actions for Keyboard
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        scrollView.contentInset.bottom = keyboardFrame.cgRectValue.size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
}
