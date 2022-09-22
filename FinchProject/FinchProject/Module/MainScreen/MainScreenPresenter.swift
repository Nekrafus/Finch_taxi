//
//  MainScreenPresenter.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 10.03.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

protocol MainScreenViewOutput: ViewOutput {  }

protocol MainScreenInteractorOutput: AnyObject {

}

final class MainScreenPresenter {
    
    // MARK: - Properties
    
    weak var view: MainScreenViewInput?
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?
    
    func updateTableView() {
        view?.updateLocations(viewModel: interactor?.model)
    }
    
}


// MARK: - MainScreenViewOutput

extension MainScreenPresenter: MainScreenViewOutput {
    
    func viewIsReady() {
        updateTableView()
    }
    
    
}


// MARK: - MainScreenViewOutput

extension MainScreenPresenter: MainScreenInteractorOutput {
    
}
