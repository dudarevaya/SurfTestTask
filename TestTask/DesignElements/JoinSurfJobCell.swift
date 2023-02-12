//
//  JoinSurfJobCell.swift
//  TestTask
//
//  Created by Yana Dudareva on 11.02.2023.
//

import Foundation
import UIKit
 
class JoinSurfJobCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    private let label = TextView()
    
    // MARK: - Public properties
    
    var isTapped: Bool = false {
        didSet {
            changeColor()
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        label.isHidden = false
    }
        
    override var isSelected: Bool {
        didSet {
            if isSelected {
                isTapped.toggle()
            }
        }
    }
    
    // MARK: - Private Methods

    private func initialSetup() {
        contentView.backgroundColor = UIColor(named: "cellBackgroundColor")
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        addSubview(label)
        setConstraints()
    }
    
    private func setConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func changeColor() {
        if isTapped {
            label.textColor = .white
            contentView.backgroundColor = UIColor(named: "AccentColor")
        } else {
            label.textColor = UIColor(named: "AccentColor")
            contentView.backgroundColor = UIColor(named: "cellBackgroundColor")
        }
    }
    
    // MARK: - Public Methods

    func configure(model: JoinSurfJobsModel) {
        label.configure(with: model.jobsButton)
    }
}
