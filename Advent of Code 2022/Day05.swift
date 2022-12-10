//
//  Day05.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 07/12/2022.
//

import Foundation

struct Stack {
    var crates: [Character]
    
    init(crates: String) {
        self.crates = crates.map { $0 } // Mapping a string creates an array of Characters
    }
    
    mutating func push(crates: [Character]) {
        self.crates.append(contentsOf: crates)
    }
    
    mutating func cratesToMove(from move: Move, oneByOne: Bool = true) -> [Character] {
        var cratesToMove: [Character] = []
        
        if oneByOne {
            for _ in 0..<move.numberOfCrates {
                cratesToMove.append(crates.popLast() ?? "👀")
            }
        } else {
            if move.numberOfCrates > crates.count {
                print("Crates count: \(crates.count)")
                print("Crates to move: \(move.numberOfCrates)")
                print(move)
            }
            
            cratesToMove = Array(crates[crates.count-move.numberOfCrates..<crates.count])
        }
        return cratesToMove
    }
}

struct Move {
    let numberOfCrates: Int
    let from: Int
    let to: Int
    
    init(move: String) {
        let splitted = move.split(separator: " ")
        numberOfCrates = Int(splitted[1]) ?? 0
        
        // -1 to compensate for array indexing starting at 0
        from = (Int(splitted[3]) ?? 0) - 1
        to = (Int(splitted[5]) ?? 0) - 1
    }
    
}


struct Day05: Day {
    func puzzle2() {
        // Left this empty because I needed a mutating func and then we don't adhere to the protocol.
    }
    
    
    func puzzle1() {
        // Left this empty because I needed a mutating func and then we don't adhere to the protocol.
    }
    
    
    var stacks: [Stack] = [
        Stack(crates: "SMRNWJVT"), // 1
        Stack(crates: "BWDJQPCV"), // 2
        Stack(crates: "BJFHDRP"), // 3
        Stack(crates: "FRPBMND"), // 4
        Stack(crates: "HVRPTB"), // 5
        Stack(crates: "CBPT"), // 6
        Stack(crates: "BJRPL"), // 7
        Stack(crates: "NCSLTZBW"), // 8
        Stack(crates: "LSG")  // 9
    ]
    
    var moves: [Move]
    
    init() {
        
        let movesFile: String = "5-moves.txt"
        let lines: [String] = loadInputAsStrings(fileName: movesFile)
        
        moves = lines.map { Move(move: $0) }
    }
    
    func printIntroduction() {
        print("<== Day 05 ==>")
    }
    
    mutating func puzzle1mutating() {
        
        for move in moves {
            stacks[move.to].push(crates: stacks[move.from].cratesToMove(from: move))
        }
        let result = stacks
            .compactMap { $0.crates.last }
            .map { String($0) }
            .joined()
        print(result)
        
    }
    
    mutating func puzzle2mutating() {
        for move in moves {
            stacks[move.to].push(crates: stacks[move.from].cratesToMove(from: move, oneByOne: false))
        }
        
        let result = stacks
            .compactMap { $0.crates.last }
            .map { String($0) }
            .joined()
        print(result)
    }
    
    
}
