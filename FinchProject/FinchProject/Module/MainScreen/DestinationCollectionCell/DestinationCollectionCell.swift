//
//  Test.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 09.03.2022.
//

import UIKit


class DestinationCollectionCell: UITableViewCell {
    
    
    static let reuseIdentifier = "DestinationCollectionCell"
    
    var userAddresses: [String]?
    var addressCollectionView: UICollectionView!
    
    var chooseLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("fromWhere", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCollectionView()
        guard let addressCollectionView = addressCollectionView else {
            return
        }
        reset()
        contentView.addSubview(addressCollectionView)
        contentView.addSubview(chooseLocationButton)
        
        setupAddressCollectionView()
        setupChooseLocationButton()
    }
    
    private func createCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 120, height: 40)
        
        
        addressCollectionView = UICollectionView(frame: self.bounds , collectionViewLayout: layout)
        addressCollectionView.showsHorizontalScrollIndicator = false
        addressCollectionView.translatesAutoresizingMaskIntoConstraints = false
        addressCollectionView?.register(AddressCell.self, forCellWithReuseIdentifier: AddressCell.reuseIdentifier)
    }
    
    func reset() {
        addressCollectionView.dataSource = self
        addressCollectionView.delegate = self
        addressCollectionView.reloadData()
    }
    
    private func setupChooseLocationButton() {
        NSLayoutConstraint.activate([
            chooseLocationButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            chooseLocationButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            chooseLocationButton.widthAnchor.constraint(equalToConstant: 80),
            chooseLocationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
    private func setupAddressCollectionView() {
        NSLayoutConstraint.activate([
            addressCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            addressCollectionView.leftAnchor.constraint(equalTo: chooseLocationButton.rightAnchor, constant: 20),
            addressCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            addressCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func fill(addresses: [String]?, buttonTitle: String? ) {
        chooseLocationButton.setTitle(buttonTitle, for: .normal)
        userAddresses = addresses
        addressCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DestinationCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userAddresses?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddressCell.reuseIdentifier, for: indexPath) as? AddressCell else { return UICollectionViewCell() }
        let address = userAddresses?[indexPath.row]
        cell.fill(address: address)
        return cell
        
        
    }
    
    
}
