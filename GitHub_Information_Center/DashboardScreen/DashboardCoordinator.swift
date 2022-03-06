//
//  DashboardCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 4.03.22.
//

import Foundation
import UIKit

protocol DashboardCoordinatorDelegate {
    func openBranches(for respository: Repository)
    func openLoginScreen()
}

class DashboardCoordinator: Coordinator {
    var navigationController: UINavigationController
    var user: User
    var window: UIWindow?
    
    init(window: UIWindow?, user: User) {
        navigationController = UINavigationController()
        self.user = user
        self.window = window
    }
    
    func start() {
        guard let topVC = DashboardViewController.instantiateFromStoryboard() as? DashboardViewController else { return }
        
        let viewModel = DashboardViewModel(user: user)
        viewModel.delegate = self
        topVC.viewModel = viewModel
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        viewModel.getUserRepositories { [weak self] in
            self?.navigationController.pushViewController(topVC, animated: false)
        }
    }
}

extension DashboardCoordinator: DashboardCoordinatorDelegate {
    func openBranches(for respository: Repository) {
        let coordinator = BranchesCoordinator(navVC: navigationController, repository: respository)
        coordinator.start()
    }
    
    func openLoginScreen() {
        let coordinator = WelcomeCoordinator(window: window)
        coordinator.start()
    }
}
