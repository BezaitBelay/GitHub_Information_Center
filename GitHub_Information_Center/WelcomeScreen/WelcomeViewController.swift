//
//  ViewController.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import UIKit
import Alamofire

class WelcomeViewController: UIViewController {

    var viewModel: WelcomeViewModel?
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let username: String = usernameTextField.text ?? ""
        viewModel?.didPressLogin(with: username)
    }
}


extension WelcomeViewController: StoryboardInstantiatable {
    
    static func storyboardName() -> String {
        return Constants.mainStoryboardName
    }
}
