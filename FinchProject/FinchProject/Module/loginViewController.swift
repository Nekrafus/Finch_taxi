//
//  loginViewController.swift
//  FinchProject
//
//  Created Vladimir Pulkhrov on 03.02.2022.
//  Copyright © 2022 FINCH. All rights reserved.
//

import UIKit
import MapKit

protocol loginViewInput: AnyObject {  }

final class loginViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: loginViewOutput?
    var place: String? = ""
    var locations: [MKMapItem]?
    
    let searchRequest = MKLocalSearch.Request()
    
    private var resultsTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.tableHeaderView?.isHidden = true
        tv.register(LocationCell.self, forCellReuseIdentifier: LocationCell.reuseIdentifier)
        return tv
    }()
    
    private let leaveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Отменить", comment: ""), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        // button.addTarget(self, action: #selector(exitProfileTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private let showOnMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Показать на карте", comment: ""), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    private let placeTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите адрес"
        textField.addTarget(self, action: #selector(getDirections), for: .allEditingEvents)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        view.backgroundColor = .white
        drawSelf()
    }
    
    private func drawSelf() {
        view.backgroundColor = .white
        view.addSubview(resultsTableView)
        view.addSubview(leaveButton)
        view.addSubview(showOnMapButton)
        view.addSubview(placeTextField)
        
        setupMainTableView()
        setupLeaveButton()
        setupPlaceTextField()
        setupShowOnMapButton()
        
    }
    
    private func setupMainTableView() {
        NSLayoutConstraint.activate([
            resultsTableView.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 20),
            resultsTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            resultsTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            resultsTableView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupLeaveButton() {
        NSLayoutConstraint.activate([
            leaveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            leaveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    private func setupPlaceTextField() {
        NSLayoutConstraint.activate([
            placeTextField.topAnchor.constraint(equalTo: leaveButton.bottomAnchor, constant: 30),
            placeTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            placeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    private func setupShowOnMapButton() {
        NSLayoutConstraint.activate([
            showOnMapButton.topAnchor.constraint(equalTo: resultsTableView.bottomAnchor, constant: 30),
            showOnMapButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
    }
    
    @objc func getDirections() {
        searchRequest.naturalLanguageQuery = placeTextField.text
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }

            self.locations = response.mapItems
            self.resultsTableView.reloadData()
        }
    }
}

extension loginViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.reuseIdentifier, for: indexPath) as! LocationCell
        
        cell.fill(address: locations?[indexPath.row])
        
        return cell
    }
    
}

class LocationCell: UITableViewCell {
    
    static let reuseIdentifier = "AddressCell"
    
    private let whereToGoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Bold", size: 35)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(whereToGoLabel)
        setupWhereToGoLabel()
    }
    
    private func setupWhereToGoLabel() {
        NSLayoutConstraint.activate([
            whereToGoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            whereToGoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
    }
    
    func fill(address: MKMapItem?) {
        guard let address = address else {
            return
        }
        whereToGoLabel.text = address.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - loginViewInput
extension loginViewController: loginViewInput {
    
}




