//
//  LoginController.swift
//  dz2.4
//
//  Created by Абдулла-Бек on 15/4/23.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        present(navigationController, animated: false, completion: nil)
    }
}
