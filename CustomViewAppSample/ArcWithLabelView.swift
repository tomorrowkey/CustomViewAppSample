//
//  ArcWithLabelView.swift
//  CustomViewAppSample
//
//  Created by tomoki-yamashita on 2017/10/19.
//  Copyright © 2017 Tomoki Yamashita. All rights reserved.
//

import UIKit

@IBDesignable class ArcWithLabelView: UIView {
    @IBOutlet weak var arcView: ArcView!
    @IBOutlet weak var label: UILabel!

    @IBInspectable var fillColor: UIColor = UIColor.orange {
        didSet {
            arcView.fillColor = fillColor
        }
    }

    @IBInspectable var startTheta: CGFloat = 0 {
        didSet {
            arcView.endTheta = startTheta
        }
    }

    @IBInspectable var endTheta: CGFloat = 270 {
        didSet {
            arcView.endTheta = endTheta
        }
    }

    @IBInspectable var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(true)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView(true)
    }

    init (frame: CGRect, useAutoLayout: Bool) {
        super.init(frame: frame)
        setupView(useAutoLayout)
    }

    func setupView(_ useAutoLayout: Bool) {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ArcWithLabelView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)

        if useAutoLayout {
            view.translatesAutoresizingMaskIntoConstraints = false

            let views:[String:UIView] = ["item": view]
            NSLayoutConstraint.activate(
                NSLayoutConstraint.constraints(withVisualFormat: "|[item]|", options: [], metrics: nil, views: views)
                    + NSLayoutConstraint.constraints(withVisualFormat: "V:|[item]|", options: [], metrics: nil, views: views)
            )
        }
    }
}
