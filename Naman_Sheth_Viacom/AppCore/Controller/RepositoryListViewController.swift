//
//  RepositoryListViewController.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 05/06/21.
//

import UIKit
import Kingfisher

class RepositoryListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var index = 0
    var paging = 1
    var repositoryViewModel: RepositoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryViewModel = RepositoryViewModel()
        self.title = "Repository"
    }
    
    /// getSortingString is to call api
    ///
    /// - Parameters:
    ///   - int: String varible
    /// - Return String: String varible
    func getSortingString(from int: Int) -> String {
        switch int {
        case 0:
            return "stars"
        case 1:
            return "forks"
        case 2:
            return "help-wanted-issues"
        case 3:
            return "updated"
        default:
            return ""
        }
    }
    
    /// Reload data and cancel serch api
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            return
        }
        let sortedBy = getSortingString(from: searchBar.selectedScopeButtonIndex)
        repositoryViewModel?.searchRepository(with: query, filter: sortedBy, paging: "\(paging)")
        repositoryViewModel?.bindViewModelToController = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    /// Overide segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            let vc = segue.destination as? RepositoryDetailViewController
            vc?.itemDetail = repositoryViewModel?.repositoryObject[index]
        }
    }
}


// MARK: SearchBar
extension RepositoryListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        repositoryViewModel?.repositoryObject.removeAll()
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.75)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        repositoryViewModel?.repositoryObject.removeAll()
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.75)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        repositoryViewModel?.repositoryObject.removeAll()
        self.collectionView.reloadData()
    }
}

/// MARK: CollectionView Datasource and Delegate
extension RepositoryListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositoryViewModel?.repositoryObject.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.repositoriesCell, for: indexPath as IndexPath) as? RepositoriesCell, let repository = repositoryViewModel?.repositoryObject, let totalCount = repositoryViewModel?.totalCount else { return UICollectionViewCell() }
        cell.configureCell(list: repository[indexPath.row])
        if indexPath.row == repository.count - 2 { // last 2 cell
            if totalCount > repository.count { // more items to fetch
                paging += paging
                perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0)
            }
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
    }
    
}

extension RepositoryListViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let repositry = repositoryViewModel?.repositoryObject
        let urls = indexPaths.map({ URL(string: (repositry?[$0.row].owner.avatarUrl ?? ""))! })
        ImagePrefetcher(urls: urls).start()
    }
}
extension RepositoryListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth, height: 250)
    }
}
