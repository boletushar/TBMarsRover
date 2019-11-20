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

    func setMesh(xBound: CGFloat, yBound: CGFloat)

    func setRovers(rovers: [Rover])

    func navigate(rover: Rover, atIndex: Int, for path: RoverNavigationPath, withdelay: TimeInterval)

    func setOutputText(rovers: [Rover])
}
