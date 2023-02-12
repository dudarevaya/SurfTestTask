//
//  DefaultButtonView.swift
//  TestTask
//
//  Created by Yana Dudareva on 11.02.2023.
//

import UIKit

protocol ButtonViewModelProtocol {
    var controlState: UIControl.State { get }
    var title: String? { get }
    var titleColor: UIColor? { get }
    var font: UIFont? { get }
    var cornerRadius: CGFloat? { get }
    var backgroundColor: UIColor? { get }
}

struct ButtonViewModel: ButtonViewModelProtocol {
    var controlState: UIControl.State
    var title: String?
    var titleColor: UIColor?
    var font: UIFont?
    var cornerRadius: CGFloat?
    var backgroundColor: UIColor?
}

protocol ButtonViewProtocol {
    func configure(with: ButtonViewModelProtocol)
}

final class ButtonView: UIButton, ButtonViewProtocol {
    func configure(with model: ButtonViewModelProtocol) {
        self.setTitle(model.title, for: model.controlState)
        self.setTitleColor(model.titleColor, for: model.controlState)
        self.titleLabel?.font = model.font
        if let cornerRadius = model.cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        self.backgroundColor = model.backgroundColor
    }
}
