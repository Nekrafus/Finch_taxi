//
//  MainTableManager.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 28.03.2022.
//

import UIKit

protocol MainTableViewManagerDelegate: AnyObject {
    func showEditProfileViewController()
}

protocol MainTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with viewModel: DestinationViewModel)
}

final class MainTableViewManager: NSObject {
    
    // MARK: - Properties
    
    weak var delegate: MainTableViewManagerDelegate?
    
    private weak var tableView: UITableView?
    
    private var viewModel: DestinationViewModel?
    
}


// MARK: - ProfileTableViewManagerInput

extension MainTableViewManager: MainTableViewManagerInput {
    
    func setup(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WhereToGoCell.self, forCellReuseIdentifier: WhereToGoCell.reuseIdentifier)
        tableView.register(DestinationCollectionCell.self, forCellReuseIdentifier: DestinationCollectionCell.reuseIdentifier)
        tableView.register(FindTransferCell.self, forCellReuseIdentifier: FindTransferCell.reuseIdentifier)
        tableView.register(TransportCell.self, forCellReuseIdentifier: TransportCell.reuseIdentifier)
        tableView.register(DateAndTimeCell.self, forCellReuseIdentifier: DateAndTimeCell.reuseIdentifier)
        tableView.register(PriceOptionsCell.self, forCellReuseIdentifier: PriceOptionsCell.reuseIdentifier)
        tableView.register(SimpleOptionCell.self, forCellReuseIdentifier: SimpleOptionCell.reuseIdentifier)
        tableView.register(ReverseTransferCell.self, forCellReuseIdentifier: ReverseTransferCell.reuseIdentifier)
        tableView.register(ChildSitCell.self, forCellReuseIdentifier: ChildSitCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 70
        self.tableView = tableView
    }
    
    func update(with viewModel: DestinationViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
}


// MARK: - UITableViewDataSource

extension MainTableViewManager: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.cellNumber ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: WhereToGoCell.reuseIdentifier, for: indexPath) as! WhereToGoCell
            cell.fill(text: viewModel?.whereToGoText)
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DestinationCollectionCell.reuseIdentifier, for: indexPath) as! DestinationCollectionCell
            let addresses = viewModel?.startPoints
            let buttonTitle = viewModel?.fromWhereText
            cell.fill(addresses: addresses, buttonTitle: buttonTitle)
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DestinationCollectionCell.reuseIdentifier, for: indexPath) as! DestinationCollectionCell
            let addresses = viewModel?.arrivalPlaces
            let buttonTitle = viewModel?.whereText
            cell.fill(addresses: addresses, buttonTitle: buttonTitle)
            return cell
            
        }   else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FindTransferCell.reuseIdentifier, for: indexPath) as! FindTransferCell
            cell.fill(text: viewModel?.findTransferText)
            return cell
            
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PriceOptionsCell.reuseIdentifier, for: indexPath) as! PriceOptionsCell
            return cell
            
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TransportCell.reuseIdentifier, for: indexPath) as! TransportCell
            return cell
            
        } else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DateAndTimeCell.reuseIdentifier, for: indexPath) as! DateAndTimeCell
            return cell
            
        } else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReverseTransferCell.reuseIdentifier, for: indexPath) as! ReverseTransferCell
            return cell
            
        } else if indexPath.row == 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SimpleOptionCell.reuseIdentifier, for: indexPath) as! SimpleOptionCell
            return cell
            
        } else if indexPath.row == 11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SimpleOptionCell.reuseIdentifier, for: indexPath) as! SimpleOptionCell
            return cell
            
        } else if indexPath.row == 12 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChildSitCell.reuseIdentifier, for: indexPath) as! ChildSitCell
            return cell

        } else {
            
            return UITableViewCell()
            
        }
    }
}


// MARK: - UITableViewDelegate

extension MainTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.showEditProfileViewController()
        }
    }
    
}

