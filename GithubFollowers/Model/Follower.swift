//
//  Follower.swift
//  GithubFollowers
//
//  Created by Soumik Sen on 19/05/24.
//

import Foundation

// MARK: We can have names as camelcase and Codable will handle that. EG. avatar_url can be named as avatarUrl
struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
}
