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

    func showError(errorMessage: String)

    func showMesh(xBound: CGFloat, yBound: CGFloat)

    func setRovers(rovers: [Rover])

    func navigate(rover: Rover, at index: Int, for path: RoverNavigationPath, with delay: TimeInterval)

    func setOutputText(rovers: [Rover])
}
