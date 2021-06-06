//
//  RepositoryDetailViewModel.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 06/06/21.
//

import Foundation

class RepositoryDetailViewModel {
    var apiService: NetworkManager?
    var coment: Comment?
    var issues: Issue?
    var contributor: Contributor?
    
    let dispatchGroup = DispatchGroup()
    
    init() {
        self.apiService = NetworkManager()
    }
    
    /// callDetailApi is to call api
    ///
    /// - Parameters:
    ///   - fullName: String varible
    func callDetailApi(with fullName: String) {
        dispatchGroup.enter()
        apiService?.apiToGetRepositoryComments(with: fullName, completion: { [weak self] (Comment, error)  in
            if error == nil {
                self?.coment = Comment
                self?.dispatchGroup.leave()
            }
        })
        
        dispatchGroup.enter()
        apiService?.apiToGetRepositoryIssues(with: fullName, completion: { [weak self] (Issue, error) in
            if error == nil {
                self?.issues = Issue
                self?.dispatchGroup.leave()
            }
        })
        
        dispatchGroup.enter()
        apiService?.apiToGetRepositoryContributors(with: fullName, completion: { [weak self] (Contributor, error) in
            if error == nil {
                self?.contributor = Contributor
                self?.dispatchGroup.leave()
            }
        })
    }
}
