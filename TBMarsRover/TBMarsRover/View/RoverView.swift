//
//  RoverView.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import UIKit

/// RoverView used to hold the rover image as well as perform all the navigation actions
class RoverView: UIImageView {

    /// Configuration
    /// - Parameter rover: Holds the rover details like initial position
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

    /// Function to rotate 90 degrees anti clockwise
    /// - Parameter delay: Time interval makes it animate sequentially
    /// - Parameter completion: completion block returned once animation is done
    func turnLeft(delay: TimeInterval, completion: ((Bool) -> Void)?) {

        UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.transform = strongSelf.transform.rotated(by: -CGFloat(Double.pi/2))
        }, completion: completion)
    }

    /// Function to rotate 90 degrees clockwise
    /// - Parameter delay: Time interval makes it animate sequentially
    /// - Parameter completion: completion block returned once animation is done
    func turnRight(delay: TimeInterval, completion: ((Bool) -> Void)?) {

        UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.transform = strongSelf.transform.rotated(by: CGFloat(Double.pi/2))
        }, completion: completion)
    }

    /// <#Description#>
    /// - Parameter direction: direction where the rover is facing
    /// - Parameter scale: scale by which rover need to update its position
    /// - Parameter delay: Time interval makes it animate sequentially
    /// - Parameter completion: completion block returned once animation is done
    func moveForward(inDirection direction: Direction, to scale: CGFloat, with delay: TimeInterval, completion: ((Bool) -> Void)?) {

        switch direction {
        case .north:
            UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.y = strongSelf.center.y - scale
            }, completion: completion)
        case .east:
            UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.x = strongSelf.center.x + scale
            }, completion: completion)
        case .west:
            UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.x = strongSelf.center.x - scale
            }, completion: completion)
        case .south:
            UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.center.y = strongSelf.center.y + scale
            }, completion: completion)
        }
    }
}
