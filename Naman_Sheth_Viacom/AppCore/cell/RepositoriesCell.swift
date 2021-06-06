//
//  RepositoriesCell.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 05/06/21.
//

import UIKit
import Kingfisher
class RepositoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageAvtar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var alphaView: UIView!
    
    func configureCell(list: Item) {
        let url = URL(string: list.owner.avatarUrl)
        imageAvtar.kf.setImage(with: url)
        labelName.text = list.name
        labelDescription.text = list.itemDescription
    }
}
