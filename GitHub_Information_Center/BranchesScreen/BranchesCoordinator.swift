//
//  BranchesCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import Foundation
import UIKit

class BranchesCoordinator: Coordinator {
    var navigationController: UINavigationController
    var repository: Repository
    
    init(navVC: UINavigationController, repository: Repository){
        navigationController = navVC
        self.repository = repository
    }
    
    func start() {
        guard let topVC = BranchesViewController.instantiateFromStoryboard() as? BranchesViewController else { return }
        
        let viewModel = BranchesViewModel()
        topVC.viewModel = viewModel
        viewModel.getBranches(repositoryName: repository.url) {
            self.navigationController.pushViewController(topVC, animated: false)
        }
    }
}
