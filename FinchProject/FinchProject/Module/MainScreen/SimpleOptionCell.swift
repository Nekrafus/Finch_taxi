//
//  SimpleOptionCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 17.03.2022.
//

import UIKit


class SimpleOptionCell: UITableViewCell {
    
    static let reuseIdentifier = "SimpleOptionCell"
    
    private let optionTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = NSLocalizedString("yourName", comment: "")
        return textField
    }()
    
    private let optionLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("editProfile", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Bold", size: 25)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(optionLabel)
        contentView.addSubview(optionTextField)
        
        setupOptionLabel()
        setupOptionTextField()
    }
    
    private func setupOptionLabel() {
        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            optionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }

    private func setupOptionTextField() {
        NSLayoutConstraint.activate([
            optionTextField.topAnchor.constraint(equalTo: optionLabel.bottomAnchor, constant: 15),
            optionTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
    
    func fill(address: String) {
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
