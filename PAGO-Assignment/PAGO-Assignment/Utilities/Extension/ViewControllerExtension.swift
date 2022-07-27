//
//  ViewControllerExtension.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

extension UIViewController {
    
    func displayAlert(title: String? = nil, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    func displayAlert(title: String? = nil, message: String, handler: @escaping (UIAlertAction) -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: handler))
            self.present(alert, animated: true)
        }
    }
}
