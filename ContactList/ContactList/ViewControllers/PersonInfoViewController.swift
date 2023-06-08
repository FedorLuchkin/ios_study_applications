//
//  PersonInfoViewController.swift
//  ContactList
//
//  Created by Fixed on 09.05.2023.
//

import UIKit

class PersonInfoViewController: UIViewController {
    
    var person: Person!
    
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var mailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = person.fullName
        phoneLabel.text = person.phone
        mailLabel.text = person.email
    }
}
