//
//  BranchesViewController.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 5.03.22.
//

import Foundation
import UIKit

class BranchesViewController: UIViewController {
    
    var viewModel: BranchesViewModel?
    
    @IBOutlet weak var branchesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.branches
        branchesTableView.dataSource = self
        registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        branchesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension BranchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsSize ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else { return UITableViewCell() }
        cell.textLabel?.text = viewModel?.getBranchName(index: indexPath.row)
        return cell
    }
}

extension BranchesViewController: StoryboardInstantiatable {
    static func storyboardName() -> String {
        return Constants.mainStoryboardName
    }
}
