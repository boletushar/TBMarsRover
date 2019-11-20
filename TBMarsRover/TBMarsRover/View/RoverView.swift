//
//  RoverView.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import UIKit

class RoverView: UIImageView {

    func configure(_ rover: Rover) {

        image = UIImage.init(named: "mars_rover")
        self.tag = rover.id

        switch rover.direction {
        case .east:
            image = image?.rotate(radians: CGFloat(Double.pi/2))
        case .west:
            image = image?.rotate(radians: -CGFloat(Double.pi/2))
        case .south:
            image = image?.rotate(radians: CGFloat(Double.pi))
        default:
            break
        }

        let label = UILabel(frame: bounds)
        label.text = "\(rover.id)"
        label.textAlignment = .center
        self.addSubview(label)
    }

    func turnLeft(delay: TimeInterval, completion: ((Bool) -> Void)?) {

        UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.transform = strongSelf.transform.rotated(by: -CGFloat(Double.pi/2))
        }, completion: completion)
    }

    func turnRight(delay: TimeInterval, completion: ((Bool) -> Void)?) {

        UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.transform = strongSelf.transform.rotated(by: CGFloat(Double.pi/2))
        }, completion: completion)
    }

    func moveForward(inDirection direction: Direction, to scale: CGFloat, with delay: TimeInterval, completion: ((Bool) -> Void)?) {

        switch direction {
        case .north:
            UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.y = strongSelf.center.y - scale
            }, completion: completion)
        case .east:
            UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.x = strongSelf.center.x + scale
            }, completion: completion)
        case .west:
            UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.x = strongSelf.center.x - scale
            }, completion: completion)
        case .south:
            UIView.animate(withDuration: 1.5, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.y = strongSelf.center.y + scale
            }, completion: completion)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
