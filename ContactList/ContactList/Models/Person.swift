//
//  Person.swift
//  ContactList
//
//  Created by Fixed on 09.05.2023.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let email: String
    let phone: String
    
    var fullName: String {
        return "\(name) \(surname)"
    }
}

extension Person {
    static func getContactList() -> [Person] {
        var contactList: [Person] = []
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let emails = DataManager.shared.emails.shuffled()
        let phones = DataManager.shared.phones.shuffled()
        for index in 0 ..< min(names.count, surnames.count, emails.count, phones.count)  {
            contactList.append(Person(name: names[index],
                                      surname: surnames[index],
                                      email: emails[index],
                                      phone: phones[index])
            )
        }
        return contactList
    }
}
