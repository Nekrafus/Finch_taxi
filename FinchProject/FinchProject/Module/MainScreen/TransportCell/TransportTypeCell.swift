//
//  TransportTypeCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 11.03.2022.
//

import UIKit

class TransportTypeCell: UICollectionViewCell {
    
    static let reuseIdentifier = "TransportTypeCell"
    
    private let classLabel: UILabel = {
        let label = UILabel()
        label.text = "eko"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 12), size: 12)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1300"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 12), size: 12)
        return label
    }()
    
    private let passengerAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "3 chel"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 12), size: 12)
        return label
    }()
    
    private let carImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(classLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(passengerAmountLabel)
        contentView.addSubview(carImageView)
        
        setupClassLabel()
        setupCarImageView()
        setupPriceLabel()
        setupPassengerAmountLabel()
    }
    
    private func setupClassLabel() {
        NSLayoutConstraint.activate([
            classLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            classLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    private func setupCarImageView() {
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 10),
            carImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            carImageView.widthAnchor.constraint(equalToConstant: 30),
            carImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    private func setupPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 10),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    private func setupPassengerAmountLabel() {
        NSLayoutConstraint.activate([
            passengerAmountLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            passengerAmountLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    func fill(price: String) {
        priceLabel.text = price
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

