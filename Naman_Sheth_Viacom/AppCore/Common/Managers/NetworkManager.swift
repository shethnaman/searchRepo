//
//  NetworkManager.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 05/06/21.
//

import Foundation

class NetworkManager {
 
    /// apiToGetRepositoryList is to call api
    ///
    /// - Parameters:
    ///   - text: String varible
    ///   - filter: String variable
    ///   - completion: escaping clouser for Repository
    func apiToGetRepositoryList(from text: String, with filter: String, paging: String, completion : @escaping (Repository?, Error?) -> ()) {
        let appendingString = "q=language:\(text)&sort=\(filter)&order=desc&page=\(paging)"
        let url = Constants.apiURL + Constants.searchRepoUrl + appendingString
        let finalUrl = URL(string: url)
        guard let getUrl = finalUrl else { return }
        URLSession.shared.dataTask(with: getUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let serverData = try decoder.decode(Repository.self, from: data)
                completion(serverData, error)
            } catch let err {
                print("Err", err)
                completion(nil, err)
            }
        }.resume()
    }
    
    /// apiToGetRepositoryContributors is to call api for Contributor
    ///
    /// - Parameters:
    ///   - author: String varible
    ///   - repoName: String variable
    ///   - completion: escaping clouser for Contributor
    func apiToGetRepositoryContributors(with fullName: String, completion : @escaping (Contributor?, Error?)  -> ()) {
        let appendingString = fullName + "/contributors"
        let url = Constants.apiURL + Constants.repos + appendingString
        let finalUrl = URL(string: url)
        guard let getUrl = finalUrl else { return }
        print("finalUrl", getUrl)
        URLSession.shared.dataTask(with: getUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let serverData = try decoder.decode(Contributor.self, from: data)
               completion(serverData, error)
            } catch let err {
                print("Err", err)
                completion(nil, err)
            }
        }.resume()
    }
    
    
    /// apiToGetRepositoryComments is to call api for Coments
    ///
    /// - Parameters:
    ///   - author: String varible
    ///   - repoName: String variable
    ///   - completion: escaping clouser for Coments
    func apiToGetRepositoryComments(with fullName: String, completion : @escaping (Comment?, Error?) -> ()) {
        let appendingString = fullName + "/comments"
        let url = Constants.apiURL + Constants.repos + appendingString
        let finalUrl = URL(string: url)
        guard let getUrl = finalUrl else { return }
        print("finalUrl", getUrl)
        URLSession.shared.dataTask(with: getUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let serverData = try decoder.decode(Comment.self, from: data)
                completion(serverData, error)
            } catch let err {
                print("Err", err)
                completion(nil, err)
            }
        }.resume()
    }
    
    
    /// apiToGetRepositoryIssues is to call api for issues
    ///
    /// - Parameters:
    ///   - author: String varible
    ///   - repoName: String variable
    ///   - completion: escaping clouser for Issue
    func apiToGetRepositoryIssues(with fullName: String, completion : @escaping (Issue?, Error?) -> ()) {
        let appendingString = fullName + "/issues?state=open"
        let url = Constants.apiURL + Constants.repos + appendingString
        let finalUrl = URL(string: url)
        guard let getUrl = finalUrl else { return }
        print("finalUrl", getUrl)
        URLSession.shared.dataTask(with: getUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let serverData = try decoder.decode(Issue.self, from: data)
               completion(serverData, error)
            } catch let err {
                print("Err", err)
                completion(nil, err)
            }
        }.resume()
    }
}
