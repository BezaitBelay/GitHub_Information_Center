//
//  DashboardViewModel.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit

class DashboardViewModel {
    
    var title: String {
        return user.login
    }
    
    var itemsSize: Int? {
        return items?.count
    }
    
    var delegate: DashboardCoordinatorDelegate?
    
    private var user: GithubUser
    private var items: GithubRepository?
    private var githubRepository: GithubInfoRepository
    
    init(user: GithubUser, githubInfoRepository: GithubInfoRepository = GithubInfoRepository()) {
        self.user = user
        self.githubRepository = githubInfoRepository
    }
    
    func getElement(index: Int) -> GithubRepositoryElement? {
        return items?[index]
    }
    
    func getUserRepositories(completion: @escaping () -> Void) {
        githubRepository.getUserRepositories(repositoriesLink: user.reposURL) { [weak self] repos in
            guard let strongSelf = self else { return }
            strongSelf.items = repos
            completion()
        }
    }
    
    func openBranches(for index: Int) {
        let item = items?[index]
        
        delegate?.openBranches(for: item!)
    }
}
