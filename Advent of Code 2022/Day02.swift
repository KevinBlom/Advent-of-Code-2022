//
//  Day02.swift
//  Advent of Code 2022
//
//  Created by Kevin Blom on 02/12/2022.
//

import Foundation

struct Game {
    
    let game: String
    let opponentsPlay: Character?
    let myPlay: Character?
    let myPlayScore: Int
    
    init(game: String) {
        self.game = game
        self.opponentsPlay = game.first
        self.myPlay = game.last
        self.myPlayScore = myPlay == "X" ? 1 : myPlay == "Y" ? 2 : 3 // Strategy one score only. For second strategy this is different
    }
    
    var strategyOneScore: Int {
        get {
            var gameScore = 0
            
            switch(opponentsPlay, myPlay) {
                case ("A", "Y"), ("B", "Z"), ("C", "X"): gameScore += 6 // Win conditions
                case ("A", "X"), ("B", "Y"), ("C", "Z"): gameScore += 3 // Draw conditions
                default: gameScore += 0 // Lose condition is anything else.
            }
            
            return gameScore + myPlayScore
        }
    }
    
    var strategyTwoScore: Int  {
        get {
            var gameScore = 0
            var playScore = 0
            
            // My play determines the game outcome so we only need to know my play
            switch(myPlay) {
                case "Y" : gameScore += 3
                case "Z" : gameScore += 6
                default: gameScore += 0
            }
            
            // Opponents play determines what I play, and this my play score
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
