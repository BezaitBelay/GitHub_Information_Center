//
//  WelcomeCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit

protocol WelcomeCoordinatorDelegate {
    func openDashboard(user: User)
}

class WelcomeCoordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        if let user = checkForUser() {
            openDashboard(user: user)
        } else {
            guard let topVC = WelcomeViewController.instantiateFromStoryboard() as? WelcomeViewController else { return }
            let viewModel = WelcomeViewModel()
            viewModel.delegate = self
            topVC.viewModel = viewModel
            self.window?.rootViewController = topVC
            self.window?.makeKeyAndVisible()
        }
    }
    
    private func checkForUser() -> User? {
        let userDefaultsRepository = UserDefaultsRepository()
        let user = userDefaultsRepository.getObject(of: User.self, for: Constants.loggedUser)
        return user
    }
}

extension WelcomeCoordinator: WelcomeCoordinatorDelegate {

    func openDashboard(user: User) {
        let coordinator = DashboardCoordinator(window: window, user: user)
        coordinator.start()
    }
}

