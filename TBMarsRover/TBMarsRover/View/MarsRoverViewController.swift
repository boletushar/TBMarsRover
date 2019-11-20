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

    @IBOutlet weak var marsSurfaceView: UIImageView!

    // MARK: - Private variables

    private(set) var presenter: MarsViewPresenting!

    private var meshView: MeshView?

    private var multiplier: CGFloat = 0

    // MARK: - Lifecycle override

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter = MarsViewPresenter(display: self)
    }

    // MARK: - MarsViewDisplay

    func showError(errorMessage: String) {

    }

    func showMesh(xBound: CGFloat, yBound: CGFloat) {

        meshView?.removeFromSuperview()
        meshView = nil

        // Provide some padding so as to display Rover on the edges of Mesh
        let maxAvailableSize = CGSize(width: marsSurfaceView.frame.width - 20, height: marsSurfaceView.frame.height - 20)
        multiplier = min(maxAvailableSize.width/xBound, maxAvailableSize.height/yBound)

        meshView = MeshView(frame: CGRect(x: (maxAvailableSize.width - multiplier * xBound) / 2,
                                          y: (maxAvailableSize.height - multiplier * yBound) / 2,
                                          width: multiplier * xBound,
                                          height: multiplier * yBound))
        meshView?.meshHeightMultiple = yBound
        meshView?.meshWidthMultiple = xBound
        meshView?.backgroundColor = .clear
        meshView?.layer.borderColor = UIColor.white.cgColor
        meshView?.layer.borderWidth = 1.0
        marsSurfaceView.addSubview(meshView!)
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

