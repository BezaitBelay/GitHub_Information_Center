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
    
    func getUserInfo(username: String, completion: @escaping (GithubUser?) -> Void) {
        let user = "bezaitbelay"
        let url = "\(githubURL)/users/\(user)"
        AF.request(url).responseJSON { response in
            do {
                if let JSON = response.data {
                    let obj = try JSONDecoder().decode(GithubUser.self, from: JSON)
                    completion(obj)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func getUserRepositories(repositoriesLink: String?, completion: @escaping (GithubRepository?) -> Void) {
        guard let link = repositoriesLink else { return }
        AF.request(link).responseJSON { response in
            do {
                if let JSON = response.data {
                    let obj = try JSONDecoder().decode(GithubRepository.self, from: JSON)
                    completion(obj)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func getRepositoryBranches(_ username: String?, completion: @escaping (GithubBranches?) -> Void) {
            let user = "bezaitbelay"
            let url = "\(githubURL)/repos/\(user)/\(username!)/branches"
//        guard let link = repositoryLink else { return }
        AF.request(url).responseJSON { response in
            do {
                if let JSON = response.data {
                    let obj = try JSONDecoder().decode(GithubBranches.self, from: JSON)
                    completion(obj)
                }
            } catch let error {
                print(error)
            }
        }
    }
}
