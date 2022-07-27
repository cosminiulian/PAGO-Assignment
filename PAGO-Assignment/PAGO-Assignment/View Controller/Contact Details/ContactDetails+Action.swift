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
        // Last name validator
        guard let lastName = lastNameField.textField.text,
              lastName.isValid() else {
            lastNameField.markFieldRed()
            displayAlert(message: "Invalid last name!")
            return
        }
        // First name validator
        guard let firstName = firstNameField.textField.text,
              firstName.isValid() else {
            firstNameField.markFieldRed()
            displayAlert(message: "Invalid first name!")
            return
        }
        // Phone nr. validator
        guard let phone = phoneField.textField.text,
              (phone.isPhoneNrValid() || phone.isEmpty) else {
            phoneField.markFieldRed()
            displayAlert(message: "Invalid phone number!")
            return
        }
        // Email validator
        guard let email = emailField.textField.text,
              (email.isEmailValid() || email.isEmpty) else {
            phoneField.markFieldRed()
            displayAlert(message: "Invalid email!")
            return
        }
        // Save contact with Core Data
        let contact = CoreDataManager.shared.createContact(
            lastName: lastName,
            firstName: firstName,
            phone: phone,
            email: email)
        
        displayAlert(title: "Contact saved!",
                     message: "\(contact.lastName!) was saved successfully using Core Data.") { [unowned self] _ in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // Observer Actions for Keyboard
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        let keyboardRect = keyboardFrame.cgRectValue
        var contentInset = scrollView.contentInset
        contentInset.bottom = keyboardRect.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
}
