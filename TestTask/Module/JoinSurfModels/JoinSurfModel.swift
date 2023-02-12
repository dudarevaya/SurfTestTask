//
//  JoinSurfModel.swift
//  TestTask
//
//  Created by Yana Dudareva on 11.02.2023.
//

import Foundation

struct JoinSurfModel {
    let titleLabel: TextViewModel
    let descriptionCaruselLabel: TextViewModel
    let descriptionNextCaruselLabel: TextViewModel
    let sendRequestButton: ButtonViewModel
    let wantToUsButton: ButtonViewModel
    let jobsModel: [JoinSurfJobsModel]
}

struct JoinSurfJobsModel {
    let jobsButton: TextViewModel
}
