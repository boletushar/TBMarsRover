//
//  MarsRoverViewController.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import UIKit

class MarsRoverViewController: UIViewController, MarsViewDisplay {

    // MARK: - Outlets

    @IBOutlet weak var inputTextView: UITextView!

    @IBOutlet weak var outputLabel: UILabel!

    // MARK: - Private variables

    private(set) var presenter: MarsViewPresenting!

    // MARK: - Lifecycle override

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter = MarsViewPresenter(display: self)
    }

    // MARK: - MarsViewDisplay

    func showError(errorMessage: String) {

    }

    func setGrid(xPos: CGFloat, yPos: CGFloat) {

    }

    func setRovers(rovers: [Rover]) {

    }

    func navigate(rover: Rover, atIndex: Int, for path: RoverNavigationPath, withdelay: TimeInterval) {

    }

    func setOutputText(rovers: [Rover]) {

    }

    // MARK: - Button action

    @IBAction func didTapSubmitButton(_ sender: UIButton) {
        presenter.processInput(inputTextView.text)
    }
}

