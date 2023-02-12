//
//  JoinSurfAssembly.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import UIKit

protocol JoinSurfAssemblyProtocol: AnyObject {
    static func buildModule() -> UIViewController
}

final class JoinSurfAssembly: JoinSurfAssemblyProtocol {
    
    // MARK: - Static method to build JoinSurf VIPER Module

    static func buildModule() -> UIViewController {
        let viewController = JoinSurfViewController()
        let provider = JoinSurfProvider()
        let interactor = JoinSirfInteractor(provider: provider)
        let presenter = JoinSurfPresenter(view: viewController,
                                          interactor: interactor
        )
        
        viewController.output = presenter
        
        return viewController
    }
}
