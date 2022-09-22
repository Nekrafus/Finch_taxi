//
//  MainScreenViewController.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 10.03.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

import UIKit

protocol MainScreenViewInput: AnyObject {
    func updateLocations(viewModel: DestinationViewModel?)
}

final class MainScreenViewController: UIViewController {
	
    // MARK: - Public properties
    
	var presenter: MainScreenViewOutput?
    var tableViewManager: MainTableViewManager? = MainTableViewManager()

    private var mainTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.tableHeaderView?.isHidden = true
        return tv
    }()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
        tableViewManager?.setup(tableView: mainTableView)
        presenter?.viewIsReady()
    }
    
    // MARK: - Drawning
    
    private func drawSelf() {
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        setupMainTableView()
    }
    
    private func setupMainTableView() {
        
        mainTableView.sizeToFit()
        
        NSLayoutConstraint.activate([
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            mainTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3)
        ])
    }
    
}


// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    
    func updateLocations(viewModel: DestinationViewModel?) {
        guard let viewModel = viewModel else {
            return
        }

        tableViewManager?.update(with: viewModel)
    }
    
}



