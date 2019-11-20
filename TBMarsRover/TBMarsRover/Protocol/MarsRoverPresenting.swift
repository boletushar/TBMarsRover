//
//  MarsRoverPresenting.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import Foundation

protocol MarsViewPresenting {

    /// Informs presenter that user has provided input
    /// - Parameter input: input text entered by user
    func processInput(_ input: String)

    /// Informs presenter that it needs to update Rover position text
    func updateOutput()
}
