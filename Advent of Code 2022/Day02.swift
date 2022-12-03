//
//  Day02.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 02/12/2022.
//

import Foundation

struct Game {
    // Conditions from my perspective
    let winConditions: [String] = ["A Y","B Z","C X"]
    let drawConditions: [String] = ["A X","B Y","C Z"]
    let loseConditions: [String] = ["A Z","B X","C Y"]
    
    
    
    let game: String
    let opponentsPlay: Character?
    let myPlay: Character?
    let myPlayScore: Int
    
    init(game: String) {
        self.game = game
        self.opponentsPlay = game.first
        self.myPlay = game.last
        self.myPlayScore = myPlay == "X" ? 1 : myPlay == "Y" ? 2 : 3
    }
    
    var strategyOneScore: Int {
        get {
            if winConditions.contains(game) {
                return 6 + myPlayScore
            } else if drawConditions.contains(game) {
                return 3 + myPlayScore
            } else if loseConditions.contains(game) {
                return 0 + myPlayScore
            } else {
                print("Error calculating score")
                return -1000000
            }
        }
    }
    
    var strategyTwoScore: Int  {
        get {
            // calculate game score
            var gameScore = 0
            var playScore = 0
            
            switch(opponentsPlay, myPlay) {
                case ("A", "Y"), ("B", "Y"), ("C", "Y"): gameScore += 3
                case ("A", "Z"), ("B", "Z"), ("C", "Z"): gameScore += 6
                default: gameScore += 0
            }
            
            switch(opponentsPlay, myPlay) {
                case ("A", "Y"), ("B", "X"), ("C", "Z"): playScore += 1
                case ("A", "Z"), ("B", "Y"), ("C", "X"): playScore += 2
                default: playScore += 3
            }
            
            return gameScore + playScore
        }
    }
}

struct Day02: Day {
    
    let games: [Game]
    
    init() {
        let fileName: String = "2-1.txt"
        let input: [String] = loadInputAsStrings(fileName: fileName)
        games = input.map ({
            Game(game: $0)
        })
    }
    
    func printIntroduction() {
        print("<== Day 02 ==>\n")
    }
    
    func puzzle1() {
        print("Puzzle 2 - 1")
        print(games.reduce(0, { $0 + $1.strategyOneScore}))

    }
    
    func puzzle2() {
        print("Puzzle 2 - 2")
        print(games.reduce(0, { $0 + $1.strategyTwoScore}))
    }
}
