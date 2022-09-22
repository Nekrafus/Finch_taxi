//
//  MainScreenAssembly.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 10.03.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

final class MainScreenAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        let view = MainScreenViewController()
        let router = MainScreenRouter(transition: view)
        let presenter = MainScreenPresenter()
        let tableManager = MainTableViewManager()
        let interactor = MainScreenInteractor()
        
        view.tableViewManager = tableManager
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }

}


// MARK: - Model
extension MainScreenAssembly {
    
    struct Model: TransitionModel {  }
    
}
