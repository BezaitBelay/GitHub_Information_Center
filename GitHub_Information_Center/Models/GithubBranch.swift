//
//  GithubBranch.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import Foundation

// MARK: - GithubBranch
struct GithubBranch: Codable {
    let name: String?
    let commit: Commit?
    let protected: Bool?
}

// MARK: - Commit
struct Commit: Codable {
    let sha: String?
    let url: String?
}

typealias GithubBranches = [GithubBranch]

