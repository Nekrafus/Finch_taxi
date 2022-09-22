//
//  TransportCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 11.03.2022.
//

import UIKit


class TransportCell: UITableViewCell {
    
    
    static let reuseIdentifier = "TransportCell"
    
    var transportTypeCollectionView: UICollectionView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCollectionView()
        guard let transportTypeCollectionView = transportTypeCollectionView else {
            return
        }
        reset()
        contentView.addSubview(transportTypeCollectionView)
        setupTransportCollectionView()
    }
    
    private func createCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 70, height: 100)

        
        transportTypeCollectionView = UICollectionView(frame: self.bounds , collectionViewLayout: layout)
        transportTypeCollectionView.showsHorizontalScrollIndicator = false
        transportTypeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        transportTypeCollectionView?.register(TransportTypeCell.self, forCellWithReuseIdentifier: TransportTypeCell.reuseIdentifier)
    }
    
    func reset() {
        transportTypeCollectionView.dataSource = self
        transportTypeCollectionView.delegate = self
        transportTypeCollectionView.reloadData()
    }
    
    private func setupTransportCollectionView() {
        NSLayoutConstraint.activate([
            transportTypeCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            transportTypeCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            transportTypeCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            transportTypeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TransportCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransportTypeCell.reuseIdentifier, for: indexPath) as? TransportTypeCell else { return UICollectionViewCell() }
    
    return cell
}
    

}

