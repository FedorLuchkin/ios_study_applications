//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Fixed on 09.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let persons = Person.getContactList()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        for viewController in viewControllers! {
            if let mainVC = viewController as? MainViewController {
                mainVC.persons = persons
            } else if let secondVC = viewController as? SecondViewController {
                secondVC.persons = persons
            }
        }
    }
}
