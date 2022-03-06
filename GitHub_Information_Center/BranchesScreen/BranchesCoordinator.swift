//
//  BranchesCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import Foundation
import UIKit

class BranchesCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    var repo: GithubRepositoryElement
    
    init(navVC: UINavigationController, repo: GithubRepositoryElement){
        navigationController = navVC
        self.repo = repo
    }
    
    func start() {
        guard let topVC = BranchesViewController.instantiateFromStoryboard() as? BranchesViewController else { return }
        
        let viewModel = BranchesViewModel()
        //        viewModel.delegate = self
        topVC.viewModel = viewModel
        viewModel.getBranches(url: repo.name) {
            self.navigationController.pushViewController(topVC, animated: false)
        }
    }
    
    
}
