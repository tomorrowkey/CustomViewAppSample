//
//  ArcView.swift
//  CustomViewAppSample
//
//  Created by tomoki-yamashita on 2017/10/19.
//  Copyright © 2017 Tomoki Yamashita. All rights reserved.
//

import UIKit

@IBDesignable class ArcView: UIView {
    @IBInspectable var fillColor: UIColor = UIColor.orange {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var startTheta: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var endTheta: CGFloat = 270 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        let radius = min(rect.width, rect.height) / 2
        let startAngle = startTheta * CGFloat(Double.pi / 180)
        let endAngle = endTheta * CGFloat(Double.pi / 180)
        let centerX = self.bounds.width / 2
        let centerY = self.bounds.height / 2
        let arcCenter = CGPoint(x: centerX, y: centerY)
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        fillColor.setFill()
        path.fill()
    }
}
