//
//  MainScreenRouter.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 10.03.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

protocol MainScreenRouterInput {  }

final class MainScreenRouter {
    
    // MARK: - Properties
    
    private unowned let transition: ModuleTransitionHandler
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
    
}


// MARK: - MainScreenRouterInput
extension MainScreenRouter: MainScreenRouterInput {  }
