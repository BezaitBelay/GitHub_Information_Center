//
//  DashboardCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 4.03.22.
//

import Foundation
import UIKit

protocol DashboardCoordinatorDelegate {
    func openBranches(for repo: GithubRepositoryElement)
}

class DashboardCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    var user: GithubUser
    
    init(navVC: UINavigationController, user: GithubUser) {
        navigationController = navVC
        self.user = user
    }
    
    func start() {
        guard let topVC = DashboardViewController.instantiateFromStoryboard() as? DashboardViewController else { return }
        
        let viewModel = DashboardViewModel(user: user)
        viewModel.delegate = self
        topVC.viewModel = viewModel
        viewModel.getUserRepositories { 
            self.navigationController.pushViewController(topVC, animated: false)
        }
    }
}

extension DashboardCoordinator: DashboardCoordinatorDelegate {
    func openBranches(for repo: GithubRepositoryElement) {
        let coordinator = BranchesCoordinator(navVC: navigationController, repo: repo)
        coordinator.start()
    }
}
