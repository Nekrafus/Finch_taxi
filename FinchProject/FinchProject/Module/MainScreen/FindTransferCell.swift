//
//  FindTransferCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 10.03.2022.
//

import UIKit


class FindTransferCell: UITableViewCell {
    
    static let reuseIdentifier = "FindTransferCell"
    
    var findTransferButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 20
       button.backgroundColor = .lightGray
       return button
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(findTransferButton)
        setupFindTransferButton()
    }
    
    private func setupFindTransferButton() {
        NSLayoutConstraint.activate([
            findTransferButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            findTransferButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            findTransferButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            findTransferButton.heightAnchor.constraint(equalToConstant: 40),
            findTransferButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func fill(text: String?) {
        findTransferButton.setTitle(text, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


