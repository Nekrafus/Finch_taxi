//
//  WhereToGoCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 10.03.2022.
//

import UIKit

class AddressCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AddressCell"
    
     var destinationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .lightGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(destinationButton)
        setupDestinationButton()
    }
    
    private func setupDestinationButton() {
        NSLayoutConstraint.activate([
            destinationButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            destinationButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            destinationButton.widthAnchor.constraint(equalToConstant: 120),
            destinationButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func fill(address: String?) {
        destinationButton.setTitle(address, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

