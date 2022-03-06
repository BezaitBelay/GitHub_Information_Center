//
//  AppCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navVC: UINavigationController) {
        navigationController = navVC
    }
    
    func start() {
        let coordinator = WelcomeCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
