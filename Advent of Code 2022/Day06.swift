//
//  Day06.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 10/12/2022.
//

import Foundation

struct Day06: Day {

    let characters: [Character]
    
    init() {
        let fileName: String = "6-1.txt"
        let lines: [String] = loadInputAsStrings(fileName: fileName)
        
        characters = lines.first!.map { $0 }
    }
    
    func printIntroduction() {
        print("<== Day 06 ==>")
    }
    
    func puzzle1() {
        print("First start-of-packet marker: \(findMarker(windowSize: 4))")
    }
    
    func puzzle2() {
        print("First start-of-message marker: \(findMarker(windowSize: 14))")
    }
    
    private func findMarker(windowSize: Int) -> Int {
        for index in 0..<characters.count-windowSize { // Make sure we don't go out of bounds
            let candidateMarker = characters[index..<index+windowSize]
            if Set(candidateMarker).count == windowSize {
                return index + windowSize
            }
        }
        return -1
    }
    
    
}
