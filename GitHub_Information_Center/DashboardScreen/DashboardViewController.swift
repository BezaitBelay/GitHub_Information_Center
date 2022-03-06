//
//  DashboardViewController.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit


class DashboardViewController: UIViewController {
    
    var viewModel: DashboardViewModel?
    
    @IBOutlet weak var dashboardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardTableView.dataSource = self
        dashboardTableView.delegate = self
        registerTableViewCells()
        addBarButtons()
        bindViewModel()
        title = viewModel?.title
    }
    
    @objc private func logout() {
        viewModel?.logoutUser()
    }
    
    @objc private func refreshData() {
        viewModel?.refreshData()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        self.dashboardTableView.register(textFieldCell, forCellReuseIdentifier: "RepositoryTableViewCell")
    }
    
    private func addBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.logout,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logout))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: Constants.refresh,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(refreshData))
    }
    
    private func bindViewModel() {
        viewModel?.shouldRefreshData.bind { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.dashboardTableView.reloadData()
        }
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
        dashboardTableView.deselectRow(at: indexPath, animated: true)
        viewModel?.openBranches(for: indexPath.row)
    }
}

extension DashboardViewController: StoryboardInstantiatable {
    static func storyboardName() -> String {
        return Constants.mainStoryboardName
    }
}
