//
//  GithubInfoRepository.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import Alamofire

class GithubInfoRepository {
    
    let githubURL: String = "https://api.github.com"
    
    func getUserInfo(username: String, completion: @escaping (UserResponseUnion?) -> Void) {
        let url = "\(githubURL)/users/\(username)"
        AF.request(url).responseJSON { response in
            do {
                if let JSON = response.data {
                    let obj = try JSONDecoder().decode(UserResponseUnion.self, from: JSON)
                    completion(obj)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func getUserRepositories(repositoriesLink: String?, completion: @escaping (Repositories?) -> Void) {
        guard let link = repositoriesLink else { return }
        AF.request(link).responseJSON { response in
            do {
                if let JSON = response.data {
                    let obj = try JSONDecoder().decode(Repositories.self, from: JSON)
                    completion(obj)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func getRepositoryBranches(_ repositoryUrl: String?, completion: @escaping (Branches?) -> Void) {
        guard let repositoryUrl = repositoryUrl else { return }
        let url = "\(repositoryUrl)/branches"
        AF.request(url).responseJSON { response in
            do {
                if let JSON = response.data {
                    let obj = try JSONDecoder().decode(Branches.self, from: JSON)
                    completion(obj)
                }
            } catch let error {
                print(error)
            }
        }
    }
}
