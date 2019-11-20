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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    // MARK: - MarsViewDisplay

    func showError(errorMessage: String) {
        let alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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

        for rover in rovers {

            let xPos = multiplier * rover.xPos - multiplier / 2
            let yPos = (meshView?.frame.height ?? marsSurfaceView.frame.height) - multiplier * rover.yPos
            let roverView = RoverView(frame: CGRect(x: xPos, y: yPos - multiplier/2, width: multiplier, height: multiplier))
            roverView.configure(rover)
            meshView?.addSubview(roverView)
        }
    }

    func navigate(rover: Rover, at index: Int, for path: RoverNavigationPath, with delay: TimeInterval) {

        let roverView: RoverView = meshView?.subviews.first(where: { $0.isKind(of: RoverView.self) && $0.tag == rover.id }) as! RoverView

        switch path {
        case .turnLeft:
            roverView.turnLeft(delay: delay) { (finished) in
                if finished {
                    self.presenter.updateOutput()
                }
            }
        case .turnRight:
            roverView.turnRight(delay: delay) { (finished) in
                if finished {
                    self.presenter.updateOutput()
                }
            }
        case .moveForward:
            roverView.moveForward(inDirection: rover.direction, to: multiplier, with: delay) { (finished) in
                if finished {
                    self.presenter.updateOutput()
                }
            }
        }
    }

    func setOutputText(text: String) {

        outputLabel.text = text
    }

    // MARK: - Button action

    @IBAction func didTapSubmitButton(_ sender: UIButton) {
        presenter.processInput(inputTextView.text)
    }
}

