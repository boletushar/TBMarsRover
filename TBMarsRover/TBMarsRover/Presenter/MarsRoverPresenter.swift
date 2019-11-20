//
//  MarsRoverPresenter.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import Foundation
import UIKit

class MarsViewPresenter: MarsViewPresenting {

    // MARK: - Private variables

    private weak var display: MarsViewDisplay!

    private var rovers: [Rover] = []

    // MARK: - Initialisation

    init(display: MarsViewDisplay) {
        self.display = display
    }

    // MARK: - MarsViewPresenting

    func processInput(_ input: String) {

        guard isValidInput(input) else { return }

        let inputArray = input.split(separator: "\n")

        configureMeshData(meshData: String(inputArray[0]))

        showRover(inputArray)

        navigateRover(inputArray)
    }

    func updateOutput() {
        var position: String = ""
        for rover in rovers {
            position.append(contentsOf: "\(Int(rover.xPos)) \(Int(rover.yPos)) \(rover.direction.text)\n")
        }
        display.setOutputText(text: position)
    }
}

// MARK: - Private functions

extension MarsViewPresenter {

    /// Function to validate input
    /// - Parameter input: input text entered by user
    private func isValidInput(_ input: String) -> Bool {

        // If user do not enter any input
        guard !input.isEmpty else {
            display.showError(errorMessage: "Please enter the input")
            return false
        }

        // If the first line is not a correct grid information
        guard input.split(separator: "\n")[0].split(separator: " ").count == 2 else {
            display.showError(errorMessage: "Please enter the valid grid bounds on first line e.g. 3 3")
            return false
        }

        // To check if the input is present to display atleast one rover
        guard input.split(separator: "\n").count >= 3 else {
            display.showError(errorMessage: "Please enter the valid Rover cordinates and Navigation info")
            return false
        }

        return true
    }

    /// Function to configure Mesh data
    /// - Parameter meshData: First line of Input box holds the maximum bounds
    private func configureMeshData(meshData: String) {

        let xBound = CFloat("\(meshData.split(separator: " ")[0])")
        let yBound = CFloat("\(meshData.split(separator: " ")[1])")
        display.showMesh(xBound: CGFloat(xBound ?? 10), yBound: CGFloat(yBound ?? 10))
    }

    /// Function to constitute array of Rover based on Input
    /// - Parameter inputData: String array holds user input sperated by \n
    private func showRover(_ inputData: [Substring]) {
        rovers.removeAll()
        let roverDetails = stride(from: 1, to: inputData.count, by: 2).map { inputData[$0] }
        var id: Int = 1
        for roverData in roverDetails {
            let roverDetails = roverData.split(separator: " ")
            rovers.append(
                Rover(
                    id: id,
                    xPos: CGFloat(CFloat("\(roverDetails[0])") ?? 0),
                    yPos: CGFloat(CFloat("\(roverDetails[1])") ?? 0),
                    direction: Direction(rawValue: roverDetails[2].uppercased()) ?? .north
                )
            )
            id += 1
        }
        display.setRovers(rovers: rovers)
    }

    /// Function to navigate Rovers based on Input
    /// - Parameter inputData: String array holds user input sperated by \n
    private func navigateRover(_ inputData: [Substring]) {

        let roverNavigations = stride(from: 2, to: inputData.count, by: 2).map { inputData[$0] }

        var delay: TimeInterval = 0.3
        for (index, navigation) in roverNavigations.enumerated() {

            for (_, char) in navigation.enumerated() {

                var path: RoverNavigationPath = .moveForward
                switch char {
                case "L":
                    rovers[index].turnLeft()
                    path = .turnLeft
                case "R":
                    rovers[index].turnRight()
                    path = .turnRight
                case "M":
                    rovers[index].moveForward()
                    path = .moveForward
                default: break
                }
                display.navigate(rover: rovers[index], at: index, for: path, with: delay)
                delay += 0.3
            }
        }
    }
}
