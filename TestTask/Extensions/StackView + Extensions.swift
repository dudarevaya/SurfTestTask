//
//  StackView + Extensions.swift
//  TestTask
//
//  Created by Yana Dudareva on 09.02.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview(_:))
    }
}
