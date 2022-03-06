//
//  WelcomeViewModel.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import Alamofire

class WelcomeViewModel {
    
    var delegate: WelcomeCoordinatorDelegate?
    var githubRepository: GithubInfoRepository?
    var user: GithubUser?
    
    init(githubInfoRepository: GithubInfoRepository = GithubInfoRepository()) {
        githubRepository = githubInfoRepository
    }
    
    func didPressLogin(with username: String) {
        githubRepository?.getUserInfo(username: username) { [weak self] user in
            guard let strongSelf = self else { return }
            guard let user2 = user else { return }
            strongSelf.user = user2
            strongSelf.delegate?.openDashboard(user: user2)
        }
    }
    
}
