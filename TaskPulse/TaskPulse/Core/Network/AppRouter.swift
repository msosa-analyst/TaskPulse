//
//  AppRouter.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 30/09/26.
//

import UIKit

/// Coordinador/Router principal encargado de la navegación raíz de la aplicación.
final class AppRouter: Router {
    
    // MARK: - Properties
    let navigationController: UINavigationController

    // MARK: - Init
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    // MARK: - Flow Execution
    func start() {
        let initialVC = ViewController()
        initialVC.view.backgroundColor = .systemBackground
        initialVC.title = "TaskPulse Base"
        
        push(initialVC, animated: false)
    }

    // MARK: - Navigation Methods
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}
