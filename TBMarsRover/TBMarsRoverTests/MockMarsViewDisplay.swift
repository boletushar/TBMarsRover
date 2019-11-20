//
//  MockMarsViewDisplay.swift
//  TBMarsRoverTests
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

@testable import TBMarsRover
import Foundation
import UIKit

class MockMarsViewDisplay: MarsViewDisplay {

    private(set) var errorText: String = ""
    func showError(errorMessage: String) {
        errorText = errorMessage
    }

    private(set) var xBound: CGFloat?
    private(set) var yBound: CGFloat?
    func showMesh(xBound: CGFloat, yBound: CGFloat) {
        self.xBound = xBound
        self.yBound = yBound
    }

    private(set) var rovers:[Rover]?
    func setRovers(rovers: [Rover]) {
        self.rovers = rovers
    }

    func navigate(rover: Rover, at index: Int, for path: RoverNavigationPath, with delay: TimeInterval) {

    }

    
    func setOutputText(rovers: [Rover]) {

    }
}
