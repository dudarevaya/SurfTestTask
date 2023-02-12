//
//  JoinSurfViewController.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

protocol JoinSurfViewControllerInput: AnyObject {
    func reloadJobsCollectionView(with jobs: [JoinSurfJobsModel])
    func configure(model: JoinSurfModel)
}

final class JoinSurfViewController: UIViewController {
    
    // MARK: - Public Properties

    var output: JoinSurfViewControllerOutput?
    let contentView = JoinSurfView()
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let wantToUsWidth: CGFloat = 100
        static let wantToUsHeight: CGFloat = 20
        static let wantToUsBottom: CGFloat = -78
        static let wantToUsLeading: CGFloat = 20
        
        static let sendRequestWidth: CGFloat = 219
        static let sendRequestHeight: CGFloat = 60
        static let sendRequestBottom: CGFloat = -58
        static let sendRequestTrailing: CGFloat = -20
    }
    
    // MARK: - Buttons
    
    private let sendRequestButton: ButtonView = {
        let button = ButtonView()
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private let wantToUsButton = ButtonView()
    
    // MARK: - Alert
    
    var alert: UIAlertController = {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let close = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(close)
        return alert
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.getCommonInfo()
        contentView.setAnimation()
    }
    
    // MARK: - Private methods
    
    private func initialSetup() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        
        view.addSubviews([wantToUsButton,
                          sendRequestButton])
    }
    
    private func makeConstraints() {
        wantToUsButton.translatesAutoresizingMaskIntoConstraints = false
        wantToUsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.wantToUsBottom).isActive = true
        wantToUsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.wantToUsLeading).isActive = true
        wantToUsButton.widthAnchor.constraint(equalToConstant: Constants.wantToUsWidth).isActive = true
        wantToUsButton.heightAnchor.constraint(equalToConstant: Constants.wantToUsHeight).isActive = true

        sendRequestButton.translatesAutoresizingMaskIntoConstraints = false
        sendRequestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.sendRequestBottom).isActive = true
        sendRequestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.sendRequestTrailing).isActive = true
        sendRequestButton.widthAnchor.constraint(equalToConstant: Constants.sendRequestWidth).isActive = true
        sendRequestButton.heightAnchor.constraint(equalToConstant: Constants.sendRequestHeight).isActive = true
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - JoinSurfViewControllerInput

extension JoinSurfViewController: JoinSurfViewControllerInput {
    
    func configure(model: JoinSurfModel) {
        contentView.configure(model: model)
        sendRequestButton.configure(with: model.sendRequestButton)
        wantToUsButton.configure(with: model.wantToUsButton)
    }
    
    func reloadJobsCollectionView(with jobs: [JoinSurfJobsModel]) {
        contentView.addJobs(jobs: jobs)
    }
}
