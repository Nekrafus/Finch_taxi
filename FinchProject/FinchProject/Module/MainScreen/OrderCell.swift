//
//  OrderCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 17.03.2022.
//

import UIKit


class OrderCell: UITableViewCell {
    
    static let reuseIdentifier = "OrderCell"
    
    var findTransferButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.titleLabel?.text = "des"
       button.layer.cornerRadius = 15
       button.backgroundColor = .lightGray
       return button
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(findTransferButton)
        setupWhereToGoLabel()
    }
    
    private func setupWhereToGoLabel() {
        NSLayoutConstraint.activate([
            findTransferButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            findTransferButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


