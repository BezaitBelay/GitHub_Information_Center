//
//  WelcomeViewModel.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import Alamofire
import TwoWayBondage

class WelcomeViewModel {
    
    var delegate: WelcomeCoordinatorDelegate?
    var githubInfoRepository: GithubInfoRepository?
    var userDefaultsRepository: UserDefaultsRepository?
    var user: User?
    let shouldShowAlert = Observable<AlertData>()
    
    init(githubInfoRepository: GithubInfoRepository = GithubInfoRepository(),
         userDefaultsRepository: UserDefaultsRepository = UserDefaultsRepository()) {
        self.githubInfoRepository = githubInfoRepository
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func didPressLogin(with username: String) {
        githubInfoRepository?.getUserInfo(username: username) { [weak self] user in
            guard let strongSelf = self, let userInfo = user  else { return }
            if let successUser = userInfo.data {
                strongSelf.user = successUser
                strongSelf.userDefaultsRepository?.setObjectValue(successUser, for: Constants.loggedUser)
                strongSelf.delegate?.openDashboard(user: successUser)
            } else if let errorUser = userInfo.error {
                self?.shouldShowAlert.value = AlertData(title: Constants.errorTitle, message: errorUser.message)
            }
        }
    }
}
