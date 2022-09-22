//
//  ChildSitOptionCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 17.03.2022.
//

import UIKit

class ChildSitCollectioncell: UICollectionViewCell {
    
    static let reuseIdentifier = "ChildSitCollectioncell"
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 12), size: 12)
        return label
    }()
    
    private let chairAmountLabel: UILabel = {
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
    
    var increaseChairAmountButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 15
       button.backgroundColor = .lightGray
       return button
   }()
    
    var decreaseChairAmountButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 15
       button.backgroundColor = .lightGray
       return button
   }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(ageLabel)
        contentView.addSubview(increaseChairAmountButton)
        contentView.addSubview(decreaseChairAmountButton)
        contentView.addSubview(carImageView)
        contentView.addSubview(chairAmountLabel)
        
        setupAgeLabel()
        setupCarImageView()
        setupChairAmountLabel()
        setupIncreaseChairAmountButton()
        setupDecreaseChairAmountButton()
    }
    
    private func setupAgeLabel() {
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            ageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    private func setupCarImageView() {
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            carImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            carImageView.widthAnchor.constraint(equalToConstant: 30),
            carImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    private func setupChairAmountLabel() {
        NSLayoutConstraint.activate([
            chairAmountLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 10),
            chairAmountLabel.leftAnchor.constraint(equalTo: decreaseChairAmountButton.rightAnchor, constant: 0)
        ])
    }
    
    private func setupIncreaseChairAmountButton() {
        NSLayoutConstraint.activate([
            increaseChairAmountButton.topAnchor.constraint(equalTo: carImageView.topAnchor, constant: 10),
            increaseChairAmountButton.leftAnchor.constraint(equalTo: chairAmountLabel.rightAnchor, constant: 0)
        ])
    }
    
    private func setupDecreaseChairAmountButton() {
        NSLayoutConstraint.activate([
            decreaseChairAmountButton.topAnchor.constraint(equalTo: carImageView.topAnchor, constant: 10),
            decreaseChairAmountButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    func fill(price: String) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


