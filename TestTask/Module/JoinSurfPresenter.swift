//
//  JoinSurfPresenter.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import UIKit

protocol JoinSurfViewControllerOutput: AnyObject {
    func getCommonInfo()
}

protocol JoinSurfInteractorOutput: AnyObject {
    func showJobs()
}

final class JoinSurfPresenter {
    
    // MARK: - External dependencies
    
    private weak var view: JoinSurfViewControllerInput?
    private let interactor: JoinSirfInteractorProtocol
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let cornerRadius: CGFloat = 30
        
        enum Colors {
            static let accentColor: String = "AccentColor"
            static let textColor: String = "textColor"
        }
        
        enum Fonts {
            static let sfProRegular: String = "SF Pro Display Regular"
            static let sfProBold: String = "SF Pro Display Bold"
            
            static let defaultSize: CGFloat = 14
            static let sendRequestSize: CGFloat = 16
            static let titleSize: CGFloat = 24
        }
    }
    
    // MARK: - Initialization
    
    init(
        view: JoinSurfViewControllerInput,
        interactor: JoinSirfInteractorProtocol
    ) {
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Private Methods
    
    fileprivate func setJobsViewModel(_ jobModel: JoinSurfBackendModel) -> JoinSurfModel {
        var viewModel: [JoinSurfJobsModel] = []
        
        jobModel.jobsArray.forEach {
            viewModel.append(JoinSurfJobsModel(
                jobsButton: TextViewModel(
                    text: $0,
                    textColor: UIColor(named: Constants.Colors.accentColor),
                    font: UIFont(name: Constants.Fonts.sfProRegular,
                                 size: Constants.Fonts.defaultSize)
                )
            )
            )
        }
        
        let titleLabel = TextViewModel(
            text: jobModel.title,
            textColor: UIColor(named: Constants.Colors.accentColor),
            font: UIFont(name: Constants.Fonts.sfProBold,
                         size: Constants.Fonts.titleSize)
        )
        
        let descriptionCaruselLabel = TextViewModel(
            text: jobModel.descriptionCarusel,
            textColor: UIColor(named: Constants.Colors.textColor),
            font: UIFont(name: Constants.Fonts.sfProRegular,
                         size: Constants.Fonts.defaultSize),
            numberOfLines: 0
        )
        
        let descriptionNextCaruselLabel = TextViewModel(
            text: jobModel.descriptionNextCarusel,
            textColor: UIColor(named: Constants.Colors.textColor),
            font: UIFont(name: Constants.Fonts.sfProRegular,
                         size: Constants.Fonts.defaultSize),
            numberOfLines: 0
        )
        
        let sendRequestButton = ButtonViewModel(
            controlState: .normal,
            title: jobModel.sendRequestButton,
            titleColor: .white,
            font: UIFont(name: Constants.Fonts.sfProRegular,
                         size: Constants.Fonts.sendRequestSize),
            cornerRadius: Constants.cornerRadius,
            backgroundColor: UIColor(named: Constants.Colors.accentColor)
        )
        
        let wantToUsButton = ButtonViewModel(
            controlState: .normal,
            title: jobModel.wantToUsButton,
            titleColor: UIColor(named: Constants.Colors.textColor),
            font: UIFont(name: Constants.Fonts.sfProRegular,
                         size: Constants.Fonts.defaultSize),
            backgroundColor: .clear
        )
        
        return JoinSurfModel(
            titleLabel: titleLabel,
            descriptionCaruselLabel: descriptionCaruselLabel,
            descriptionNextCaruselLabel: descriptionNextCaruselLabel,
            sendRequestButton: sendRequestButton,
            wantToUsButton: wantToUsButton,
            jobsModel: viewModel
        )
    }
}

// MARK: - JoinSurfViewControllerOutput

extension JoinSurfPresenter: JoinSurfViewControllerOutput {
    
    func getCommonInfo() {
        let info = interactor.getJobs()
        let viewModel = setJobsViewModel(info)
        view?.configure(model: viewModel)
        showJobs()
    }
}

// MARK: - JoinSurfInteractorOutput

extension JoinSurfPresenter: JoinSurfInteractorOutput {
    
    func showJobs() {
        let jobs = interactor.getJobs()
        let viewModel = setJobsViewModel(jobs)
        view?.reloadJobsCollectionView(with: viewModel.jobsModel)
    }
}
