//
//  MainScreenInteractor.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 28.03.2022.
//

import UIKit

protocol MainScreenInteractorInput {
    
    var model: DestinationViewModel? { get }
}

final class MainScreenInteractor {
    
    // MARK: - Properties
    
    var model: DestinationViewModel? = DestinationViewModel()
    
    var fromWhereLocations: [String]?
    var whereLocations: [String]?

    weak var presenter: MainScreenInteractorOutput?
    
    
}


// MARK: - MainScreenInteractorInput

extension MainScreenInteractor: MainScreenInteractorInput {
    

    
}
