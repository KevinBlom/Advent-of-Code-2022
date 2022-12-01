//
//  Tools.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 01/12/2022.
//

import Foundation

let baseInputPath: String = "/Users/kevin/Developer/Advent-of-Code-2022/Advent of Code 2022/Inputs/"

func loadInputAsStrings(fileName: String, debugPrint: Bool = false) -> [String] {
    let filePath = baseInputPath + fileName
    do {
        let data = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = data.components(separatedBy: .newlines)
        if debugPrint { print(lines) }
        return lines
    } catch {
        print(error)
        return []
    }
}

protocol Day {
    func printIntroduction()
    func puzzle1()
    func puzzle2()
    func printSummary()
}
