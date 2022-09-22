//
//  loginAssembly.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 03.02.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

final class loginAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        let view = loginViewController()
        let router = loginRouter(transition: view)
        let presenter = loginPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        return view
    }

}


// MARK: - Model
extension loginAssembly {
    
    struct Model: TransitionModel {  }
    
}
