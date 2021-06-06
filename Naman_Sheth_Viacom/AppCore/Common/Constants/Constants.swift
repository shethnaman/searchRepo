//
//  Constants.swift
//  Naman_Sheth_Viacom
//
//  Created by Naman Sheth on 05/06/21.
//

import Foundation
import UIKit
struct Constants {
    static let repositoriesCell = "RepositoriesCell"
    static let repositoryDetailTableViewCell = "RepositoryDetailTableViewCell"
    static let apiURL = "https://api.github.com/"
    static let searchRepoUrl = "search/repositories?"
    static let repos = "repos/"
}

/// getDate to make operation for date related
///
/// - Parameter time: String value of time
/// - Returns: Date object
func getDate(time: Int) -> String {
    let timeInterval = TimeInterval(time)
    // create NSDate from Double (NSTimeInterval)
    let myNSDate = Date(timeIntervalSince1970: timeInterval)
    
    let dateFormater = DateFormatter()
    dateFormater.dateStyle = .medium
    dateFormater.timeStyle = .medium
    return dateFormater.string(from: myNSDate)
}


// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}
