// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let githubUser = try? newJSONDecoder().decode(GithubUser.self, from: jsonData)

import Foundation
import Alamofire

struct UserResponse: Codable {
    let userResponse: UserResponseUnion
}

enum UserResponseUnion: Codable {
    case errorResponse(ErrorResponse)
    case githubUser(GithubUser)
    
    var data: GithubUser? {
        switch self {
        case .errorResponse(_): return nil
        case .githubUser(let user): return user
        }
    }
    
    var error: ErrorResponse? {
        switch self {
        case .errorResponse(let error): return error
        case .githubUser(_): return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            if let element = try? container.decode(ErrorResponse.self) {
                self = .errorResponse(element)
                return
            }
            if let element = try? container.decode(GithubUser.self) {
                self = .githubUser(element)
                return
            }
        } catch let someerror {
            print(someerror)
        }
        throw DecodingError.typeMismatch(UserResponseUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for UserResponseUnion"))
    }
}

// MARK: - ErrorResponse
struct ErrorResponse: Codable {
    let message: String?
    let documentationURL: String?

    enum CodingKeys: String, CodingKey {
        case message
        case documentationURL = "documentation_url"
    }
}



// MARK: - Welcome
struct GithubUser: Codable {
    let login: String
    let id: Int
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    let name, company: String?
    let blog: String?
    let location, email: String?
    let hireable: Bool?
    let bio, twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int?
    let createdAt, updatedAt: String?
    let privateGists, totalPrivateRepos, ownedPrivateRepos, diskUsage: Int?
    let collaborators: Int?
    let twoFactorAuthentication: Bool?
    let plan: Plan?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name, company, blog, location, email, hireable, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case privateGists = "private_gists"
        case totalPrivateRepos = "total_private_repos"
        case ownedPrivateRepos = "owned_private_repos"
        case diskUsage = "disk_usage"
        case collaborators
        case twoFactorAuthentication = "two_factor_authentication"
        case plan
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePlan { response in
//     if let plan = response.result.value {
//       ...
//     }
//   }

// MARK: - Plan
struct Plan: Codable {
    let name: String?
    let space, privateRepos, collaborators: Int?

    enum CodingKeys: String, CodingKey {
        case name, space
        case privateRepos = "private_repos"
        case collaborators
    }
}

// MARK: - Helper functions for creating encoders and decoders

//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
