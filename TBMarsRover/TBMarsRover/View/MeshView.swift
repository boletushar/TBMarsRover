//
//  MeshView.swift
//  TBMarsRover
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import UIKit

class MeshView: UIView {

    private var path = UIBezierPath()

    var meshWidthMultiple: CGFloat = 5

    var meshHeightMultiple : CGFloat = 5

    private var meshWidth: CGFloat {
        return bounds.width/CGFloat(meshWidthMultiple)
    }

    private var meshHeight: CGFloat {
        return bounds.height/CGFloat(meshHeightMultiple)
    }

    private var meshCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }

    private func drawGrid()
    {
        path = UIBezierPath()
        path.lineWidth = 1

        for index in 1...Int(meshWidthMultiple) - 1
        {
            let start = CGPoint(x: CGFloat(index) * meshWidth, y: 0)
            let end = CGPoint(x: CGFloat(index) * meshWidth, y:bounds.height)
            path.move(to: start)
            path.addLine(to: end)
        }

        for index in 1...Int(meshHeightMultiple) - 1
        {
            let start = CGPoint(x: 0, y: CGFloat(index) * meshHeight)
            let end = CGPoint(x: bounds.width, y:CGFloat(index) * meshHeight)
            path.move(to: start)
            path.addLine(to: end)
        }

        //Close the path.
        path.close()
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawGrid()

        // Specify a border (stroke) color.
        UIColor.white.setStroke()
        path.stroke()
    }
}
