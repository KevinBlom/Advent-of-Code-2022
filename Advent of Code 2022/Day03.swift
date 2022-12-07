//
//  Day03.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 03/12/2022.
//

import Foundation


struct Rucksack {
    let items: Set<Character>
    let compartmentOne: Set<Character>
    let compartmentTwo: Set<Character>
    
    init(items: String) {
        self.items = Set(items.map { $0 })
        compartmentOne = Set(items.prefix(items.count / 2).map { $0 })
        compartmentTwo = Set(items.suffix(items.count / 2).map { $0 })
    }
    
    var commonItem: Character {
        get {
            return compartmentOne.intersection(compartmentTwo).first!
        }
    }
}

struct Day03: Day {
    
    var rucksacks: [Rucksack]
    
    init() {
        let fileName: String = "3-1.txt"
        let input: [String] = loadInputAsStrings(fileName: fileName, debugPrint: true)
        rucksacks = input.map({ Rucksack(items: $0)})
    }
    
    func printIntroduction() {
        print("<== Day 03 ==>")
    }
    
    func puzzle1() {
        print(rucksacks.reduce(0, {$0 + priority(for: $1.commonItem)}))
        
    }
    
    func puzzle2() {
        var groups = rucksacks.grouped(by: 3)

        // Just chain the intersects of the groups 🤷
        print(groups.reduce(0, { $0 + priority(for: $1[0].items.intersection($1[1].items).intersection($1[2].items).first!)}))
    }
    
    func priority(for item: Character) -> Int {
        let asciiValue = Int(item.asciiValue!)
        if asciiValue >= 97 {
            return asciiValue - 96
        } else if asciiValue >= 64 {
            return asciiValue - 38
        }
        
        return 0
    }
}
