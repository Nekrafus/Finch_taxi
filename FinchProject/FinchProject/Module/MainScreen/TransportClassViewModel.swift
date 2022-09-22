//
//  TransportClassViewModel.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 28.03.2022.
//

import Foundation

struct TransportTypeViewModel {
    
    var name: String?
    var surname: String?
    var phoneNumber: String
    
    let settings = [NSLocalizedString("myProfile", comment: ""),
                    NSLocalizedString("rules", comment: ""),
                    NSLocalizedString("FAQ", comment: ""),
                    NSLocalizedString("settings", comment: "")]
}
