//
//  WelcomeCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit

protocol WelcomeCoordinatorDelegate {
 func openDashboard(user: GithubUser)
}

class WelcomeCoordinator: Coordinator {
    
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let topVC = WelcomeViewController.instantiateFromStoryboard() as? WelcomeViewController else { return }
        let viewModel = WelcomeViewModel()
        viewModel.delegate = self
        topVC.viewModel = viewModel
        navigationController.pushViewController(topVC, animated: false)
    }
}

extension WelcomeCoordinator: WelcomeCoordinatorDelegate {
    func openDashboard(user: GithubUser) {
        let coordinator = DashboardCoordinator(navVC: navigationController, user: user)
        coordinator.start()
    }
}

