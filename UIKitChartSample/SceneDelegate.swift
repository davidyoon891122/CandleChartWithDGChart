//
//  SceneDelegate.swift
//  UIKitChartSample
//
//  Created by Jiwon Yoon on 2/26/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        window?.rootViewController = ViewController(viewModel: ViewModel())

        window?.makeKeyAndVisible()
        
    }


}

