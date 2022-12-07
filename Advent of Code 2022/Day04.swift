//
//  Day04.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 07/12/2022.
//

import Foundation

struct Pair {
    let assignmentOneStart: Int
    let assignmentOneEnd: Int
    
    let assignmentTwoStart: Int
    let assignmentTwoEnd: Int
    
    let sectionsOneRange: ClosedRange<Int>
    let sectionsTwoRange: ClosedRange<Int>
    
    init(assignment: String) {
        let assignmentOne = assignment.split(separator: ",").first!
        assignmentOneStart = Int(assignmentOne.split(separator: "-").first!) ?? -1
        assignmentOneEnd = Int(assignmentOne.split(separator: "-").last!) ?? -1
        
        sectionsOneRange = assignmentOneStart ... assignmentOneEnd
        
        let assignmentTwo = assignment.split(separator: ",").last!
        assignmentTwoStart = Int(assignmentTwo.split(separator: "-").first!) ?? -1
        assignmentTwoEnd = Int(assignmentTwo.split(separator: "-").last!) ?? -1
        
        sectionsTwoRange = assignmentTwoStart ... assignmentTwoEnd
    }
}

struct Day04: Day {
    
    let pairs: [Pair]
    
    func printIntroduction() {
        print("<== Day 04 ==>")
    }
    
    init() {
        let fileName: String = "4-1.txt"
        let input: [String] = loadInputAsStrings(fileName: fileName)
        pairs = input.map( { Pair(assignment: $0) } )
    }
    
    func puzzle1() {
        print(pairs.filter {
            Set($0.sectionsOneRange).isSubset(of: Set($0.sectionsTwoRange)) || Set($0.sectionsTwoRange).isSubset(of: $0.sectionsOneRange)

        }.count)
    }
    
    func puzzle2() {
        print(pairs.filter {
            !Set($0.sectionsOneRange).isDisjoint(with: Set($0.sectionsTwoRange))
        }.count)
    }
    
    
}
