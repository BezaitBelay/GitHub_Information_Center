//
//  DashboardViewController.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit


class DashboardViewController: UIViewController {
    
    @IBOutlet weak var dashboardTableView: UITableView!
    var viewModel: DashboardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardTableView.dataSource = self
        dashboardTableView.delegate = self
        registerTableViewCells()
        //
        //        register(UINib.init(nibName: "\(RepositoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(RepositoryTableViewCell.self)")
        title = viewModel?.title
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        self.dashboardTableView.register(textFieldCell, forCellReuseIdentifier: "RepositoryTableViewCell")
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsSize ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell") as? RepositoryTableViewCell else { return RepositoryTableViewCell() }
        
        cell.configureWith(cellModel: viewModel?.getElement(index: indexPath.row))
        return cell
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.openBranches(for: indexPath.row)
    }
}

extension DashboardViewController: StoryboardInstantiatable {
    static func storyboardName() -> String {
        return Constants.mainStoryboardName
    }
}
