//
//  Comments.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 06/06/21.
//

import Foundation

// MARK: - CommentElement
struct CommentElement: Codable {
    let url, htmlURL: String
    let id: Int
    let nodeID: String
    let user: User
    let position, line: Int?
    let path: String?
    let commitID: String
    let authorAssociation: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case user, position, line, path
        case commitID = "commit_id"
        case authorAssociation = "author_association"
        case body
    }
}

// MARK: - User
struct User: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool

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
    }
}

typealias Comment = [CommentElement]
