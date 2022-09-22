//
//  ViewOutput.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 03.02.2022.
//

import Foundation

protocol ViewOutput: AnyObject {
    
    func viewIsReady()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
}


// MARK: - Default Implementation
extension ViewOutput {
    
    func viewIsReady() {  }
    
    func viewWillAppear() {  }
    
    func viewDidAppear() {  }
    
    func viewWillDisappear() {  }
    
    func viewDidDisappear() {  }
    
}
