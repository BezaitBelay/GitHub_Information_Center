//
//  BranchesViewModel.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import Foundation

class BranchesViewModel {
    
    var itemsSize: Int? {
        return items?.count
    }
    
    private var githubRepository: GithubInfoRepository?
    private var items: Branches?
    
    init(githubInfoRepository: GithubInfoRepository = GithubInfoRepository()){
        githubRepository = githubInfoRepository
    }
    
    func getBranches(repositoryName: String?, completion: @escaping () -> Void) {
        githubRepository?.getRepositoryBranches(repositoryName) { [weak self] list in
            self?.items = list
            completion()
        }
    }
    
    func getBranchName(index: Int) -> String? {
        return items?[index].name
    }
}
