//
//  Day01.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 01/12/2022.
//

import Foundation

let fileName: String = "1-1.txt"
let input: [String] = loadInputAsStrings(fileName: fileName)

struct SnackSack {
    var snacks: [Int]
    var totalCalories: Int {
        get {
            return snacks.reduce(0, {$0 + $1})
        }
    }
}

struct Day01: Day {
    let snackSacks: [SnackSack]
    
    init() {
        // Split the input on empty lines (""), map the returned ArraySlices as SnackSacks but they need to be converted to Int first.
        snackSacks = input.split(separator: "", maxSplits: Int.max, omittingEmptySubsequences: true).map( { SnackSack(snacks: Array($0).map( { Int($0) ?? 0 })) })
    }
    
    func puzzle1() {
        
        
        // MARK: Day 1 - Puzzle 1
        let mostCalories: SnackSack = snackSacks.max(by: { $0.totalCalories < $1.totalCalories})!
        
        print("Day 1 - Puzzle 1")
        print("Most calorie rich snack sack: \(mostCalories.totalCalories)")
    }
    
    func puzzle2() {
        // MARK: Day 1 - Puzzle 2
        
        let sortedSnackSacks = snackSacks.sorted(by: { $0.totalCalories > $1.totalCalories})
        let topThree = sortedSnackSacks[...2]
        let sumOfTopThreeCalories = topThree.reduce(0, {$0 + $1.totalCalories})
        
        print("Day 1 - Puzzle 2")
        print("Sum of top three calorie rich snack sacks: \(sumOfTopThreeCalories)")
    }
    
    func printIntroduction() {
        print("<== Day 01 ==>\n")
    }
    
    func printSummary() {
        print("\n")
    }
}
