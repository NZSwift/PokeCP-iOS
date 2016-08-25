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
    Pokemon(name: "Abra", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Bellsprout", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Bulbasaur", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Caterpie", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Charmander", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Charmeleon", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Clefairy", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Cubone", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Diglett", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Doduo", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Dragonair", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Dratini", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Drowzee", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Eevee", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Ekans", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Exeggcute", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Gastly", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Geodude", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Gloom", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Goldeen", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Graveler", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Grimer", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Growlithe", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Haunter", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Hitmonlee", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Horsea", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Ivysaur", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Jigglypuff", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Kabuto", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Kadabra", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Koffing", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Krabby", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Machoke", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Machop", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Magikarp", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Magnemite", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Mankey", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Meowth", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Metapod", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidoran♀", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidoran♂", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidorina", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Nidorino", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Oddish", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Omanyte", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Paras", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Pidgeotto", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Pidgey", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Pikachu", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Poliwag", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Poliwhirl", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Ponyta", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Psyduck", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Rattata", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Rhyhorn", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Sandshrew", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Seel", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Shellder", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Slowpoke", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Spearow", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Squirtle", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Staryu", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Tentacool", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Venonat", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Voltorb", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Vulpix", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Wartortle", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Weedle", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Weepinbell", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)),
    Pokemon(name: "Zubat", low: 1.1, height: 2.2, candy: 50, nextGeneration: Pokemon(name: "", low: 1.1, height: 1.1, candy: 50, nextGeneration: nil)
    )
]
        