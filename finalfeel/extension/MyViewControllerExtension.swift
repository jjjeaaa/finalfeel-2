//
//  MyViewControllerExtension.swift
//  finalfeel
//
//  Created by jea on 1/4/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
    static func getViewControllerWith(storyboardName: String = "Main", viewControllerIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
    
}

