//
//  ViewController.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import UIKit
import Alamofire
import TwoWayBondage

class WelcomeViewController: UIViewController {
    
    var viewModel: WelcomeViewModel?
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let username: String = usernameTextField.text ?? ""
        viewModel?.didPressLogin(with: username)
    }
    
    private func bindViewModel() {
        viewModel?.shouldShowAlert.bind { [weak self] alertData in
            let alert = UIAlertController(title: alertData.title, message: alertData.message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: Constants.ok, style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self?.present(alert, animated: true)
        }
    }
}

extension WelcomeViewController: StoryboardInstantiatable {
    
    static func storyboardName() -> String {
        return Constants.mainStoryboardName
    }
}
