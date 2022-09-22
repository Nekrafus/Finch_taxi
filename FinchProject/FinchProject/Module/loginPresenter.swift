//
//  loginPresenter.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 03.02.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

protocol loginViewOutput: ViewOutput {  }

final class loginPresenter {
    
    // MARK: - Properties
    
    weak var view: loginViewInput?
    
    var router: loginRouterInput?
    
}


// MARK: - loginViewOutput
extension loginPresenter: loginViewOutput {
    
    func viewIsReady() {  }
    
}
