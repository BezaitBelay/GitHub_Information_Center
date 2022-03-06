//
//  Coordinator.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//


import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
