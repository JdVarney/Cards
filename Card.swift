//
//  Card.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation

public struct Card: Klondike, CustomStringConvertible {
    public var description: String
    
    var rank: Rank
    var suit: Suit
    var color: CardColor
    var faceShowing = false
    var encumbered = true
    var hashCalc: Int
    var suitIcon: SuitIcon
    
    public init(rank:Rank, suit:Suit, color:CardColor, suitIcon: SuitIcon) {
        self.rank = rank
        switch rank {
        case .Ace: description = "A"
            case .two: description = "2"
            case .three: description = "3"
            case .four: description = "4"
            case .five: description = "5"
            case .six: description = "6"
            case .seven: description = "7"
            case .eight: description = "8"
            case .nine: description = "9"
            case .ten: description = "T"
            case .jack: description =  "J"
            case .queen: description = "Q"
            case .king: description = "K"
        }
        self.suitIcon = suitIcon
        self.description += suitIcon.rawValue

        self.suit = suit
        self.color = color
        hashCalc = self.rank.rawValue + self.suit.rawValue * 10 +
            self.color.rawValue * 100
    }
    
    public func toString() -> String {
        return "\(self.color) \(self.description)"
    }
    
    public static func compare (lhs: Card, rhs:Card) -> Bool {
        switch lhs.color {
        case .red : return rhs.color == .black &&
            lhs.rank.rawValue == rhs.rank.rawValue + 1
        default: return rhs.color == .red &&
            lhs.rank.rawValue == rhs.rank.rawValue + 1
        }
    }
}

public protocol Klondike {
    static func compare (lhs: Card, rhs: Card) -> Bool
}

extension Card: Hashable, Equatable {
    public static func == (lhs: Card, rhs:Card) -> Bool {
        return lhs.hashCalc == rhs.hashCalc
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashCalc)
    }
}
