//
//  SearchResponseModel.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

import Foundation

// MARK: - SearchResponseModel
public struct SearchResponseModel: Codable {
    public let cards: [Card]?
    
    public init(cards: [Card]?) {
        self.cards = cards
    }
}

// MARK: - Card
public struct Card: Codable {
    public let id, name: String?
    public let imageURL, artist: String?

    enum CodingKeys: String, CodingKey {
        case id, name, artist
        case imageURL = "imageUrl"
    }
    
    public init(id: String?, name: String?, imageURL: String?, artist: String?) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.artist = artist
    }
}
