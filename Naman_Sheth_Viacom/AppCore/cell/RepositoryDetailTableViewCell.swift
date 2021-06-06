//
//  RepositoryDetailTableViewCell.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 06/06/21.
//

import UIKit

class RepositoryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageRepoAvtar: UIImageView!
    @IBOutlet weak var labelRepoName: UILabel!
    @IBOutlet weak var labelRepoDes: UILabel!
    @IBOutlet weak var labelOpenIssues: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCellDetail(repoDetail: Item) {
        let url = URL(string: repoDetail.owner.avatarUrl)
        imageRepoAvtar.kf.setImage(with: url)
        labelRepoName.text = repoDetail.fullName
        labelRepoDes.text = repoDetail.itemDescription
        labelOpenIssues.text = "open issues: \(repoDetail.openIssuesCount)"
        labelLanguage.text = repoDetail.language
    }
    
    func configureCellForContributor(contributor: ContributorElement) {
        let url = URL(string: contributor.avatarURL)
        imageRepoAvtar.kf.setImage(with: url)
        labelRepoName.text = contributor.login
        labelRepoDes.text = "Contribution: \(contributor.contributions)"
    }
    
    func configureCellForComment(comment: CommentElement) {
        let url = URL(string: comment.user.avatarURL)
        imageRepoAvtar.kf.setImage(with: url)
        labelRepoName.text = comment.user.login
        labelRepoDes.text = comment.body
    }
    
    func configureCellForIssue(issue: IssueElement) {
        let url = URL(string: issue.user.avatarURL)
        imageRepoAvtar.kf.setImage(with: url)
        labelRepoName.text = issue.user.login
        labelRepoDes.text = issue.title
        labelOpenIssues.text = issue.body
        labelLanguage.text = "Comment id: \(issue.id)"
    }

}
