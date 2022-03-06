//
//  StoryboardInstantiatable.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 3.03.22.
//

import Foundation
import UIKit

public protocol StoryboardInstantiatable: AnyObject {
    
    /* Make sure this protocol is only used by classes inhereting UIViewController */
    
    associatedtype ViewControllerType: UIViewController = Self
    
    /* Returns the name of the storyboard where the view of the ViewController is */
    static func storyboardName() -> String
    
    static func instantiateFromStoryboard(withName storyboardName: String) -> UIViewController
}

//extension won't work in @objc ViewController classes, you will have to implement the method in the ViewController itself.
public extension StoryboardInstantiatable where Self: UIViewController {
    static func instantiateFromStoryboard(withName storyboardName: String = Self.storyboardName()) -> UIViewController {
        return UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: self))
    }
}

