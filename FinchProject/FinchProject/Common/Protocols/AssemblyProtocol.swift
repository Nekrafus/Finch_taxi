//
//  AssemblyProtocol.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 03.02.2022.
//

import UIKit

typealias Module = UIViewController

protocol Assembly {
    static func assembleModule() -> Module
    static func assembleModule(with model: TransitionModel) -> Module
}

extension Assembly {
    
    static func assembleModule() -> Module {
        fatalError("Implement assembleModule() in ModuleAssembly")
    }
    
    static func assembleModule(with model: TransitionModel) -> Module {
        fatalError("Implement assembleModule(with model: TransitionModel) in ModuleAssembly")
    }
    
}
