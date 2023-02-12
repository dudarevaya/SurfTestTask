//
//  JoinSurfInteractor.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import Foundation

protocol JoinSirfInteractorProtocol: AnyObject {
    func getJobs() -> JoinSurfBackendModel
}

final class JoinSirfInteractor {
    
    // MARK: - Private Properties
    
    private var provider: JoinSurfProviderProtocol
    
    init(provider: JoinSurfProviderProtocol) {
        self.provider = provider
    }
}

// MARK: - ProductsScreenInteractorProtocol

extension JoinSirfInteractor: JoinSirfInteractorProtocol {
    func getJobs() -> JoinSurfBackendModel {
        return provider.getJobs()
    }
}
