//
//  Pokemon.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/21.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import Foundation

class Pokemon {
    var name : String
    var low : Float
    var height : Float
    var candy : Int
    var nextGeneration : Pokemon?
    
    init(name:String, low:Float, height: Float, candy: Int, nextGeneration : Pokemon?) {
        self.name = name
        self.low = low
        self.height = height
        self.candy = candy
        self.nextGeneration = nextGeneration
    }
    
}

let pokemons = [
    Pokemon(name: "Abra - 063", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Bellsprout - 069", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Bulbasaur - 001", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Caterpie - 010", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Charmander - 004", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Charmeleon - 005", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Clefairy - 035", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Cubone - 104", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Diglett - 050", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Doduo - 084", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Dragonair - 148", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Dratini - 147", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Drowzee - 096", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Eevee - 133", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Ekans - 023", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Exeggcute - 102", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Gastly - 092", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Geodude - 074", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Gloom - 044", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Goldeen - 118", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Graveler - 075", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Grimer - 088", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Growlithe - 058", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Haunter - 093", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Hitmonlee - 106", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Horsea - 116", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Ivysaur - 002", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Jigglypuff - 039", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Kabuto - 140", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Kadabra - 064", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Koffing - 109", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Krabby - 098", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Machoke - 067", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Machop - 066", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Magikarp - 129", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Magnemite - 081", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Mankey - 056", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Meowth - 052", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Metapod - 011", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidoran♀ - 029", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidoran♂ - 032", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidorina - 030", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidorino - 033", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Oddish - 043", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Omanyte - 138", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Paras - 046", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Pidgeotto - 017", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Pidgey - 016", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Pikachu - 025", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Poliwag - 060", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Poliwhirl - 061", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Ponyta - 077", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Psyduck - 054", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Rattata - 019", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Rhyhorn - 111", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Sandshrew - 027", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Seel - 086", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Shellder - 090", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Slowpoke - 079", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Spearow - 021", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Squirtle - 007", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Staryu - 120", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Tentacool - 072", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Venonat - 048", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Voltorb - 100", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Vulpix - 037", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Wartortle - 008", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Weedle - 013", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Weepinbell - 070", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Zubat - 041", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)
    )
]
        