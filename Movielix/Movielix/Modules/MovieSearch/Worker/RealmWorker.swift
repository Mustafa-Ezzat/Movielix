//
//  RealmWorker.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/9/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation
import RealmSwift
import Unrealm

protocol RealmWorkerProtocol {
    var databaseURL: String { get }
    func find<T: Realmable>(object: T.Type) -> Unrealm.Results<T>
    func save<T: Realmable>(_ newElement: T)
    func save<T: Realmable>(contentsOf sequence: [T])
    func delete<T: Realmable>(object: T.Type)
    func delete<T: Realmable>(object: T.Type, where condition: String)
    func beginUpdates<T: Realmable>(for type: T.Type, updateClosure: () -> (T))
}

class RealmWorker: RealmWorkerProtocol {
    private var realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            preconditionFailure(error.localizedDescription)
        }
    }

    var databaseURL: String {
        guard let url = Realm.Configuration.defaultConfiguration.fileURL else { return "REALM HELPER: No database found" }
        return "REALM HELPER: \(url.absoluteString)"
    }
        
    func find<T: Realmable>(object: T.Type) -> Unrealm.Results<T> {
        let objects = realm.objects(object)
        return objects
    }
    
    func save<T: Realmable>(_ newElement: T) {
        try! realm.write {
            realm.add(newElement)
        }
    }
    
    func save<T: Realmable>(contentsOf sequence: [T]) {
        try! realm.write {
            realm.add(sequence)
        }
    }
    
    func delete<T: Realmable>(object: T.Type) {
        realm.objects(object).all().forEach(performDelete(object:))
    }
    
    func delete<T: Realmable>(object: T.Type, where condition: String) {
        realm.objects(object).all(where: condition).forEach(performDelete(object:))
    }
    
    func beginUpdates<T: Realmable>(for type: T.Type, updateClosure: () -> (T)) {
        let updateResult = updateClosure()
        try! realm.write {
            realm.add(updateResult, update: .modified)
        }
    }
    
    private func performDelete<T: Realmable>(object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
}

extension Unrealm.Results where Element: RealmableBase {
    
    func all() -> [Element] {
        return Array(self)
    }
    
    func all(where condition: String) -> [Element] {
        return Array(self.filter(condition))
    }
    
    func first(where condition: String) -> Element? {
        return self.filter(condition).first
    }
    
}
