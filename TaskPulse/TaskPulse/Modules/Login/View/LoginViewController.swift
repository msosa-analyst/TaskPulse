//
//  LoginViewController.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 07/10/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: DesignTextField!
    @IBOutlet weak var passwordTextField: DesignTextField!
    
    
    private let viewModel: LoginViewModelProtocol
    init?(coder: NSCoder, viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapToDismiss()
    }
    
    private func setupTapToDismiss() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
        }
    
    @objc private func dismissKeyboard() {
        view.endEditing(false)
    }
    
    @IBAction func loginButtonOnTapped(_ sender: Any) {
        viewModel.navigateToHome()
    }
    @IBAction func faceIDButtonOnTapped(_ sender: Any) {
        viewModel.navigateToHome()
    }
    @IBAction func signUpButtonOnTapped(_ sender: Any) {
        viewModel.navigateToCreateAccount()
    }
    
}



