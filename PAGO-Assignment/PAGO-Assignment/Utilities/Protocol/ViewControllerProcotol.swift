//
//  ViewControllerProcotol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

protocol ViewControllerProtocol {
    
    func setupNavController()
    func setupSubviews()
    func setupConstraints()
    func setupButtonsAction()
    func setupSubscribers()
}

// Optional methods
extension ViewControllerProtocol {
    
    func setupNavController() {}
    func setupButtonsAction() {}
    func setupSubscribers() {}
}
