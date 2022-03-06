//
//  DashboardViewModel.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit
import TwoWayBondage

class DashboardViewModel {
    
    var title: String {
        return user.login
    }
    
    var itemsSize: Int? {
        return items?.count
    }
    
    var delegate: DashboardCoordinatorDelegate?
    var shouldRefreshData = Observable<Bool>(false)
    
    private var user: User
    private var items: Repositories?
    private var githubRepository: GithubInfoRepository
    private var userDefaultsRepository: UserDefaultsRepository?
    
    init(user: User,
         githubInfoRepository: GithubInfoRepository = GithubInfoRepository(),
         userDefaultsRepository: UserDefaultsRepository = UserDefaultsRepository()) {
        self.user = user
        self.githubRepository = githubInfoRepository
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func getElement(index: Int) -> Repository? {
        return items?[index]
    }
    
    func getUserRepositories(completion: @escaping () -> Void) {
        githubRepository.getUserRepositories(repositoriesLink: user.reposURL) { [weak self] repos in
            guard let strongSelf = self else { return }
            strongSelf.items = repos
            if strongSelf.userDefaultsRepository?.getObject(of: Date.self, for: Constants.lastListUpdate) == nil {
                self?.userDefaultsRepository?.setObjectValue(Date(), for: Constants.lastListUpdate)
            }
            completion()
        }
    }
    
    func openBranches(for index: Int) {
        guard let item = items?[index] else { return }
        delegate?.openBranches(for: item)
    }
    
    func logoutUser() {
        userDefaultsRepository?.removeValue(for: Constants.loggedUser)
        userDefaultsRepository?.removeValue(for: Constants.lastListUpdate)
        delegate?.openLoginScreen()
    }
    
    func refreshData() {
        getUserRepositories { [weak self] in
            self?.userDefaultsRepository?.setObjectValue(Date(), for: Constants.lastListUpdate)
            self?.shouldRefreshData.value = true
        }
    }
}
