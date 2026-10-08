//
//  SceneDelegate.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 30/09/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // 1. Inicializar la ventana con la escena actual
        let window = UIWindow(windowScene: windowScene)
        
        // 2. Crear el NavigationController y el AppRouter
        let navigationController = UINavigationController()
        appRouter = AppRouter(navigationController: navigationController)
        
        // 3. Iniciar el flujo del Router
        appRouter?.start()

        // 4. Configurar el rootViewController e visibilizar la ventana
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

