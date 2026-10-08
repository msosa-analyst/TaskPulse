//
//  LoginRouter.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 08/10/26.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func navigateToCreateAccount() {
        let createAccountVC = ViewController()
        createAccountVC.title = "navigateToCreateAccount"
        createAccountVC.view.backgroundColor = .red
        navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    func navigateToHome() {
        let homeVC = ViewController()
        homeVC.title = "navigateToHome"
        homeVC.view.backgroundColor = .blue
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
