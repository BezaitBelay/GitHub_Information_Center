//
//  RepositoryTableViewCell.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(cellModel: GithubRepositoryElement?) {
        repositoryNameLabel.text = cellModel?.name
    }
    
}
