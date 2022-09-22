//
//  ChildSitCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 17.03.2022.
//

import UIKit


class ChildSitCell: UITableViewCell {
    
    
    static let reuseIdentifier = "ChildSitCell"
    
    var childSitCollectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCollectionView()
        guard let childSitCollectionView = childSitCollectionView else {
            return
        }
        reset()
        contentView.addSubview(childSitCollectionView)
        setupChildSitCollectionView()
    }
    
    private func createCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 70, height: 100)

        
        childSitCollectionView = UICollectionView(frame: self.bounds , collectionViewLayout: layout)
        childSitCollectionView.showsHorizontalScrollIndicator = false
        childSitCollectionView.translatesAutoresizingMaskIntoConstraints = false
        childSitCollectionView?.register(ChildSitCollectioncell.self, forCellWithReuseIdentifier: ChildSitCollectioncell.reuseIdentifier)
    }
    
    func reset() {
        childSitCollectionView.dataSource = self
        childSitCollectionView.delegate = self
        childSitCollectionView.reloadData()
    }
    
    private func setupChildSitCollectionView() {
        NSLayoutConstraint.activate([
            childSitCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            childSitCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            childSitCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            childSitCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChildSitCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildSitCollectioncell.reuseIdentifier, for: indexPath) as? ChildSitCollectioncell else { return UICollectionViewCell() }
    
    return cell
}
}

