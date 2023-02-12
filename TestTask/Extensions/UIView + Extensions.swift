//
//  UIView + Extensions.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach(addSubview(_:))
    }
}
