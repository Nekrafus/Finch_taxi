//
//  loginRouter.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 03.02.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

protocol loginRouterInput {  }

final class loginRouter {
    
    // MARK: - Properties
    
    private unowned let transition: ModuleTransitionHandler
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
    
}


// MARK: - loginRouterInput
extension loginRouter: loginRouterInput {  }
