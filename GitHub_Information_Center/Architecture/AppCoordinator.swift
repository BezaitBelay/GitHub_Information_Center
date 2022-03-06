//
//  AppCoordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let coordinator = WelcomeCoordinator(window: window)
        coordinator.start()
    }
}
