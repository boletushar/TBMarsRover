//
//  Rover.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import Foundation
import UIKit

struct Rover {
    let id: Int
    var xPos: CGFloat
    var yPos: CGFloat
    var direction: Direction

    mutating func moveRover() {
        switch direction {
        case .north:
            yPos += 1
        case .east:
            xPos += 1
        case .south:
            yPos -= 1
        case .west:
            xPos -= 1
        }
    }

    mutating func turnLeft() {
        switch direction {
        case .north:
            direction = .west
        case .east:
            direction = .north
        case .south:
            direction = .east
        case .west:
            direction = .south
        }
    }

    mutating func turnRight() {
        switch direction {
        case .north:
            direction = .east
        case .east:
            direction = .south
        case .south:
            direction = .west
        case .west:
            direction = .north
        }
    }
}

enum Direction: String {
    case north = "N"
    case east = "E"
    case west = "W"
    case south = "S"
}
