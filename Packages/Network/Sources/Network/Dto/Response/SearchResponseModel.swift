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
    public let nationalPokedexNumber: Int?
    public let imageURL, imageURLHiRes: String?
    public let types: [String]?
    public let supertype, subtype, hp: String?
    public let retreatCost: [String]?
    public let convertedRetreatCost: Int?
    public let number, artist, rarity, series: String?
    public let cardSet, setCode: String?
    public let text: [String]?
    public let attacks: [Attack]?
    public let weaknesses: [Resistance]?
    public let ability: Ability?
    public let evolvesFrom: String?
    public let resistances: [Resistance]?
    public let ancientTrait: AncientTrait?

    enum CodingKeys: String, CodingKey {
        case id, name, nationalPokedexNumber
        case imageURL = "imageUrl"
        case imageURLHiRes = "imageUrlHiRes"
        case types, supertype, subtype, hp, retreatCost, convertedRetreatCost, number, artist, rarity, series
        case cardSet = "set"
        case setCode, text, attacks, weaknesses, ability, evolvesFrom, resistances, ancientTrait
    }

    public init(id: String?, name: String?, nationalPokedexNumber: Int?, imageURL: String?, imageURLHiRes: String?, types: [String]?, supertype: String?, subtype: String?, hp: String?, retreatCost: [String]?, convertedRetreatCost: Int?, number: String?, artist: String?, rarity: String?, series: String?, cardSet: String?, setCode: String?, text: [String]?, attacks: [Attack]?, weaknesses: [Resistance]?, ability: Ability?, evolvesFrom: String?, resistances: [Resistance]?, ancientTrait: AncientTrait?) {
        self.id = id
        self.name = name
        self.nationalPokedexNumber = nationalPokedexNumber
        self.imageURL = imageURL
        self.imageURLHiRes = imageURLHiRes
        self.types = types
        self.supertype = supertype
        self.subtype = subtype
        self.hp = hp
        self.retreatCost = retreatCost
        self.convertedRetreatCost = convertedRetreatCost
        self.number = number
        self.artist = artist
        self.rarity = rarity
        self.series = series
        self.cardSet = cardSet
        self.setCode = setCode
        self.text = text
        self.attacks = attacks
        self.weaknesses = weaknesses
        self.ability = ability
        self.evolvesFrom = evolvesFrom
        self.resistances = resistances
        self.ancientTrait = ancientTrait
    }
}

// MARK: - Ability
public struct Ability: Codable {
    public let name, text, type: String?

    public init(name: String?, text: String?, type: String?) {
        self.name = name
        self.text = text
        self.type = type
    }
}

// MARK: - AncientTrait
public struct AncientTrait: Codable {
    public let name, text: String?

    public init(name: String?, text: String?) {
        self.name = name
        self.text = text
    }
}

// MARK: - Attack
public struct Attack: Codable {
    public let cost: [String]?
    public let name, text, damage: String?
    public let convertedEnergyCost: Int?

    public init(cost: [String]?, name: String?, text: String?, damage: String?, convertedEnergyCost: Int?) {
        self.cost = cost
        self.name = name
        self.text = text
        self.damage = damage
        self.convertedEnergyCost = convertedEnergyCost
    }
}

// MARK: - Resistance
public struct Resistance: Codable {
    public let type, value: String?

    public init(type: String?, value: String?) {
        self.type = type
        self.value = value
    }
}
