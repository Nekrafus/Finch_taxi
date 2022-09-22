//
//  WhereToGoCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 10.03.2022.
//

import UIKit


class WhereToGoCell: UITableViewCell {
    
    static let reuseIdentifier = "WhereToGoCell"
    
    private let whereToGoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 33), size: 33)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(whereToGoLabel)
        setupWhereToGoLabel()
    }
    
    private func setupWhereToGoLabel() {
        NSLayoutConstraint.activate([
            whereToGoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            whereToGoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whereToGoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
    
    func fill(text: String?) {
        whereToGoLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


