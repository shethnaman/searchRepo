//
//  RepositoryViewModel.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 05/06/21.
//

import Foundation

class RepositoryViewModel {
    var apiService: NetworkManager?
    var repositoryObject = [Item]() {
        didSet {
            bindViewModelToController()
        }
    }
    var totalCount = 0
    var bindViewModelToController : () -> () = {}
    
    init() {
        self.apiService = NetworkManager()
    }
    
    /// searchRepository is to call api
    ///
    /// - Parameters:
    ///   - text: String varible
    ///   - filter: String variable
    func searchRepository(with text: String, filter: String, paging: String) {
        apiService?.apiToGetRepositoryList(from: text, with: filter, paging: paging, completion: { [weak self] (object, error)  in
            if error == nil, let item = object?.items {
                self?.repositoryObject.append(contentsOf: item)
                self?.totalCount = object?.totalCount ?? 0
            }
        })
    }
}

