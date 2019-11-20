//
//  MarsRoverPresenter.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import Foundation

class MarsViewPresenter: MarsViewPresenting {

    private weak var display: MarsViewDisplay!

    private var rovers: [Rover] = []

    init(display: MarsViewDisplay) {
        self.display = display
    }

    func processInput(_ input: String) {
        
    }
}
