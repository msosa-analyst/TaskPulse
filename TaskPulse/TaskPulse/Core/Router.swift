//
//  Router.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 30/09/26.
//

import UIKit

/// Protocolo base que define los métodos y contratos de navegación de la app.
protocol Router: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
