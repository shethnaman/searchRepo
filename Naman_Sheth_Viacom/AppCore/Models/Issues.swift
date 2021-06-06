//
//  Issues.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 06/06/21.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let issue = try? newJSONDecoder().decode(Issue.self, from: jsonData)

import Foundation

// MARK: - IssueElement
struct IssueElement: Codable {
    let url, repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let title: String
    let user: User
    let state: State
    let locked: Bool
    let comments: Int
    let authorAssociation: String
    let activeLockReason: JSONNull?
    let pullRequest: PullRequest?
    let body: String
    let performedViaGithubApp: JSONNull?

    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number, title, user, state, locked, comments
        case authorAssociation = "author_association"
        case activeLockReason = "active_lock_reason"
        case pullRequest = "pull_request"
        case body
        case performedViaGithubApp = "performed_via_github_app"
    }
}

// MARK: - PullRequest
struct PullRequest: Codable {
    let url, htmlURL: String
    let diffURL: String
    let patchURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
}

enum State: String, Codable {
    case stateOpen = "open"
}

typealias Issue = [IssueElement]
