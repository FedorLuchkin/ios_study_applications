//
//  StorageManager.swift
//  RealmApp
//
//  Created by Fixed on 20.06.2023.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    func save(taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
}
