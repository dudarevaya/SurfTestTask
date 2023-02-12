//
//  DrawerView.swift
//  TestTask
//
//  Created by Yana Dudareva on 06.02.2023.
//

import UIKit

class DrawerView: UIView {
    
    public var cornerRadius: CGFloat? {
        didSet {
            layoutSubviews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds,
                                      cornerRadius: cornerRadius ?? bounds.width * 0.2).cgPath
        layer.mask = maskLayer
    }
}
