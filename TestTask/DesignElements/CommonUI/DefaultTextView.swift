//
//  DefaultTextView.swift
//  TestTask
//
//  Created by Yana Dudareva on 11.02.2023.
//

import UIKit

protocol TextViewModelProtocol {
    var text: String? { get set }
    var textColor: UIColor? { get set }
    var font: UIFont? { get set }
    var numberOfLines: Int? { get set }
}

struct TextViewModel: TextViewModelProtocol {
    var text: String?
    var textColor: UIColor?
    var font: UIFont?
    var numberOfLines: Int?
}

protocol TextViewProtocol {
    func configure(with: TextViewModelProtocol)
}

final class TextView: UILabel, TextViewProtocol {
    func configure(with model: TextViewModelProtocol) {
        self.text = model.text
        self.textColor = model.textColor
        self.font = model.font
        if let numberOfLines = model.numberOfLines {
            self.numberOfLines = numberOfLines
        }
    }
}
