//
//  MarsRoverDisplay.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import Foundation
import UIKit

enum RoverNavigationPath {
    case turnLeft
    case turnRight
    case moveForward
}

protocol MarsViewDisplay: class {

    /// Asks display to show error
    /// - Parameter errorMessage: error message to be shown
    func showError(errorMessage: String)

    /// Asks display to show grid with Bonds provided on first line
    /// - Parameter xBound: Maximum horizontal bound of the Mesh
    /// - Parameter yBound: Maximum vertical bound of the Mesh
    func showMesh(xBound: CGFloat, yBound: CGFloat)

    /// Asks display to show Rower image with there initial position
    /// - Parameter rovers: Array of Rover objects
    func setRovers(rovers: [Rover])

    /// Asks display to perform navigation on Rover with 1 operation at a time
    /// - Parameter rover: Rover data which holds the navigation change
    /// - Parameter index: index or Rover data in an array
    /// - Parameter path: path of navigation course
    /// - Parameter delay: Timeinterval to delay the animation
    func navigate(rover: Rover, at index: Int, for path: RoverNavigationPath, with delay: TimeInterval)

    /// Asks display to show the position of Rovers
    /// - Parameter rovers: Array of Rover objects
    func setOutputText(rovers: [Rover])
}
