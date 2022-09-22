//
//  PriceOptionsCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 17.03.2022.
//

import UIKit


class PriceOptionsCell: UITableViewCell {
    
    static let reuseIdentifier = "PriceOptionsCell"
    
    var firstRecomendedPriceButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 15
       button.backgroundColor = .lightGray
        button.setTitle("1300", for: .normal)
       return button
   }()
    
    var secondRecomendedPriceButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 15
       button.backgroundColor = .lightGray
        button.setTitle("1400", for: .normal)
       return button
   }()
    
    var thirdRecomendedPriceButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 15
       button.backgroundColor = .lightGray
        button.setTitle("1500", for: .normal)
       return button
   }()
    
    private let priceTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = NSLocalizedString("yourName", comment: "")
        return textField
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "price"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Bold", size: 25)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(firstRecomendedPriceButton)
        contentView.addSubview(secondRecomendedPriceButton)
        contentView.addSubview(thirdRecomendedPriceButton)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceTextField)
        
        setupFirstRecomendedPriceButton()
        setupSecondRecomendedPriceButton()
        setupThirdRecomendedPriceButton()
        setupPriceLabel()
        setupPriceTextField()
    }
    
    private func setupFirstRecomendedPriceButton() {
        NSLayoutConstraint.activate([
            firstRecomendedPriceButton.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 15),
            firstRecomendedPriceButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    private func setupSecondRecomendedPriceButton() {
        NSLayoutConstraint.activate([
            secondRecomendedPriceButton.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 15),
            secondRecomendedPriceButton.leftAnchor.constraint(equalTo: firstRecomendedPriceButton.rightAnchor, constant: 15)
        ])
    }
    
    private func setupThirdRecomendedPriceButton() {
        NSLayoutConstraint.activate([
            thirdRecomendedPriceButton.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 15),
            thirdRecomendedPriceButton.leftAnchor.constraint(equalTo: secondRecomendedPriceButton.rightAnchor, constant: 15)
        ])
    }
    
    private func setupPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }

    private func setupPriceTextField() {
        NSLayoutConstraint.activate([
            priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
            priceTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    func fill(address: String) {
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


