//
//  JoinSurfProvider.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import Foundation

protocol JoinSurfProviderProtocol {
    func getJobs() -> JoinSurfBackendModel
}

final class JoinSurfProvider: JoinSurfProviderProtocol {
    
    func getJobs() -> JoinSurfBackendModel {
        
        return JoinSurfBackendModel( title: StaticStrings.title,
                                     descriptionCarusel: StaticStrings.descriptionCarusel,
                                     descriptionNextCarusel: StaticStrings.descriptionNextCarusel,
                                     sendRequestButton: ButtonTitles.sendRequestButton,
                                     wantToUsButton: ButtonTitles.wantToUsButton,
                                     jobsArray: [ Jobs.ios,
                                                  Jobs.android,
                                                  Jobs.design,
                                                  Jobs.flutter,
                                                  Jobs.qa
                                                ]
        )
    }
}
