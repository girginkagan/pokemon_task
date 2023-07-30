//
//  File.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

@_exported import Network
import RealmSwift
import Unrealm

final public class RealmUtil {
    private let version: UInt64 = 1

    public init() {
        Realm.registerRealmables(SearchCardModel.self)
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: version, migrationBlock: migrate)
    }

    private func migrate(migration: Migration, oldVersion: UInt64) {

    }

    public func setData(data: Card, completion: @escaping (_ added: Bool) -> Void) {
        let realm = try! Realm()
        let items = getData()
        if items.contains(where: {$0.id == data.id}) {
            removeData(data: data)
            completion(false)
        } else {
            let item = SearchCardModel(id: data.id, name: data.name, imageURL: data.imageURL, artist: data.artist)
            try! realm.write {
                realm.add(item)
            }
            completion(true)
        }
    }

    public func getData() -> [Card] {
        let realm = try! Realm()
        let res = realm.objects(SearchCardModel.self)
        var items: [Card] = []
        for item in res {
            items.append(Card(id: item.id, name: item.name, imageURL: item.imageURL, artist: item.artist))
        }
        
        return Array(items)
    }

    public func removeData(data: Card) {
        let realm = try! Realm()
        let item = SearchCardModel(id: data.id, name: data.name, imageURL: data.imageURL, artist: data.artist)
        try! realm.write {
            realm.delete(item)
        }
    }
}
