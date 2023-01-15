//
//  Int+Ext.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/12/23.
//

import Foundation

extension Int {
    static var randomPokemonId: Int {
        return Int.random(in: 0...151)
    }
}
