//
//  ImageUtils.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 6.03.22.
//

import Foundation
import UIKit

enum ProgramingLanguages: String {
    case swift = "Swift"
    case javascript = "JavaScript"
    case typescript = "TypeScript"
    case cpp = "C++"
    case other = "Other"
    
    var image: UIImage? {
        switch self {
        case .swift : return UIImage(named: "swift")
        case .javascript : return UIImage(named: "JavaScript")
        case .typescript : return UIImage(named: "TypeScript")
        case .cpp: return UIImage(named: "C++")
        case .other : return UIImage(named: "not-available")
        }
    }
}
