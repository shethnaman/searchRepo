//
//  RepositoryDetailViewController.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 06/06/21.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var itemDetail: Item? = nil
    var repositoryDetailViewModel: RepositoryDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryDetailViewModel = RepositoryDetailViewModel()
        repositoryDetailViewModel?.callDetailApi(with: itemDetail?.fullName ?? "")
        repositoryDetailViewModel?.dispatchGroup.notify(queue: .main, execute: { [weak self] in
            self?.tableView.reloadData()
        })
    }
}

extension RepositoryDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return itemDetail?.name
        case 1:
            return "Contributors"
        case 2:
            return "Comments"
        case 3:
            return "Open Issues"
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if let repo = repositoryDetailViewModel?.contributor, repo.count >= 3 { return 3 }
            return  repositoryDetailViewModel?.contributor?.count ?? 0
        case 2:
            if let repo = repositoryDetailViewModel?.coment, repo.count >= 3 { return 3 }
            return repositoryDetailViewModel?.coment?.count ?? 0
        case 3:
            if let repo = repositoryDetailViewModel?.issues, repo.count >= 3 { return 3 }
            return repositoryDetailViewModel?.issues?.count ?? 0
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.repositoryDetailTableViewCell, for: indexPath) as? RepositoryDetailTableViewCell,
              let repoContributors = repositoryDetailViewModel?.contributor,
              let repoComments = repositoryDetailViewModel?.coment,
              let issues = repositoryDetailViewModel?.issues,
              let itemDetail = itemDetail else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.configureCellDetail(repoDetail: itemDetail)
            return cell
        case 1:
            cell.configureCellForContributor(contributor: repoContributors[indexPath.row])
            return cell
        case 2:
            cell.configureCellForComment(comment: repoComments[indexPath.row])
            return cell
        case 3:
            cell.configureCellForIssue(issue: issues[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
