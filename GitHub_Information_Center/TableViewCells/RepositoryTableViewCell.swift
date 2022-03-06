//
//  RepositoryTableViewCell.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var dateLastPushLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var languageLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(cellModel: Repository?) {
        repositoryNameLabel.text = cellModel?.name
        dateLastPushLabel.text = cellModel?.pushedAt?.getDateFromString()
        elapsedTimeLabel.text = elapsedTimeTransformer(dateString: cellModel?.pushedAt)
        languageLogo.image = ProgramingLanguages.init(rawValue: cellModel?.language ?? "Other")?.image ?? ProgramingLanguages.other.image
    }
    
    private func elapsedTimeTransformer(dateString: String?) -> String? {
        let userDefaultsRepository = UserDefaultsRepository()
        let lastUpdate = userDefaultsRepository.getObject(of: Date.self, for: Constants.lastListUpdate) ?? Date()
        let minutes = getMinutesDifferenceFromTwoDates(start: lastUpdate, end: Date())
        return "\(minutes) min"
    }
    
    private func getMinutesDifferenceFromTwoDates(start: Date, end: Date) -> Int {
        let diff = Int(end.timeIntervalSince1970 - start.timeIntervalSince1970)
        let minutes = diff / 60
        return minutes
    }
}
