//
//  LoginViewModel.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 07/10/26.
//

import Foundation

class LoginViewModel {
    private let router: LoginRouterProtocol
    
    init(router: LoginRouterProtocol){
        self.router = router
    }
}
extension LoginViewModel: LoginViewModelProtocol {
    func navigateToCreateAccount() {
        router.navigateToCreateAccount()
    }
    
    func navigateToHome() {
        router.navigateToHome()
    }
    
    
}
