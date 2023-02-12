//
//  JoinSurfProvider + Extensions.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import Foundation

extension JoinSurfProvider {
    
    enum StaticStrings {
        static let title = NSLocalizedString("title", comment: "")
        static let descriptionCarusel = NSLocalizedString("descriptionCarusel", comment: "")
        static let descriptionNextCarusel = NSLocalizedString("descriptionNextCarusel", comment: "")
    }
    
    enum ButtonTitles {
        static let sendRequestButton = NSLocalizedString("sendRequestButton", comment: "")
        static let wantToUsButton = NSLocalizedString("wantToUsButton", comment: "")
    }
    
    enum Jobs {
        static let ios = NSLocalizedString("ios", comment: "")
        static let android = NSLocalizedString("android", comment: "")
        static let design = NSLocalizedString("design", comment: "")
        static let flutter = NSLocalizedString("flutter", comment: "")
        static let qa = NSLocalizedString("qa", comment: "")
    }
}
