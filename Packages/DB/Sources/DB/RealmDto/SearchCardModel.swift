//
//  SearchCardModel.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

import Unrealm

// MARK: - SearchCardModel
struct SearchCardModel: Codable, Realmable {
    var id, name: String?
    var imageURL, artist: String?
    
    static func primaryKey() -> String? {
        return "id"
    }
}
