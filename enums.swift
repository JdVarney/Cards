//
//  enums.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation


public enum Rank: Int, CaseIterable {
    case Ace = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7,
         eight = 8, nine = 9, ten = 10, jack = 11, queen = 12, king = 13
}

public enum Suit: Int, CaseIterable {
    case hearts = 1, clubs = 2, diamonds = 3, spades = 4
}

public enum SuitIcon: String {
    case hearts = "♥︎" , clubs = "♣︎", diamonds = "♦︎", spades = "♠︎"
}

public enum CardColor: Int, CaseIterable {
    case red = 1 , black = 2
}
