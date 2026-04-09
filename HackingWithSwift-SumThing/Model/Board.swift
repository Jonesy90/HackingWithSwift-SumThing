//
//  Board.swift
//  HackingWithSwift-SumThing
//
//  Created by Michael Jones on 09/04/2026.
//

import Foundation
import Combine

enum Difficulty: CaseIterable {
    case easy, medium, tricky, taxing, nightmare
}

class Board: ObservableObject {
    var exampleCells = [[Int]]() // Going to store one possible solution for the board. But there can be multiple ways to solve the board.
    
    @Published var userCells = [[Int]]() // @Published will allow this property to change as the game is running.
    
    // To store the Row and Column number that is currently selected.
    @Published var selectedRow = 0
    @Published var selectedCol = 0
    
    init(_ difficulty: Difficulty) {
        create(difficulty)
    }
    
    func create(_ difficulty: Difficulty) {
        // Reset the selectedRow and selectedCol.
        selectedRow = 0
        selectedCol = 0
        
        // Properties to create a correct grid based of the difficulty level.
        let size: Int
        let maxNumber: Int
        
        switch difficulty {
        case .easy:
            size = 2
            maxNumber = 4
        case .medium:
            size = 3
            maxNumber = 4
        case .tricky:
            size = 4
            maxNumber = 4
        case .taxing:
            size = 5
            maxNumber = 6
        case .nightmare:
            size = 5
            maxNumber = 8
        }
        
        // Iterating over an array to create [[Int]] property.
        exampleCells = (0..<size).map { _ in
            (0..<size).map { _ in
                Int.random(in: 1...maxNumber)
            }
        }
        
        userCells = Array(repeating: Array(repeating: 0, count: size), count: size)
    }
}
