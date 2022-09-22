//
//  DateAndTimeCell.swift
//  FinchProject
//
//  Created by Vladimir Pulkhrov on 11.03.2022.
//

import UIKit


class DateAndTimeCell: UITableViewCell {
    
    static let reuseIdentifier = "DateAndTimeCell"
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "date?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 17), size: 17)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "time?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 17), size: 17)
        return label
    }()
    
    private let dateImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let timeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var timeButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.titleLabel?.text = "test"
       button.backgroundColor = .lightGray
       return button
   }()
    
    var dateButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitleColor(UIColor.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.titleLabel?.text = "test"
       button.backgroundColor = .lightGray
       return button
   }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(dateImageView)
        contentView.addSubview(timeImageView)
        contentView.addSubview(dateButton)
        contentView.addSubview(timeButton)
        
        setupDateLabel()
        setupTimeLabel()
        setupDateImageView()
        setupTimeImageView()
        setupDateButton()
        setupTimeButton()
    }
    
    private func setupDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.leftAnchor.constraint(equalTo: dateImageView.rightAnchor, constant: 15),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
    }
    
    private func setupTimeLabel() {
        NSLayoutConstraint.activate([
            timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
    }
    
    private func setupDateImageView() {
        NSLayoutConstraint.activate([
            dateImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            dateImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            dateImageView.widthAnchor.constraint(equalToConstant: 30),
            dateImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupTimeImageView() {
        NSLayoutConstraint.activate([
            timeImageView.rightAnchor.constraint(equalTo: timeLabel.leftAnchor, constant: -15),
            timeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            timeImageView.widthAnchor.constraint(equalToConstant: 30),
            timeImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupDateButton() {
        NSLayoutConstraint.activate([
            dateButton.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            dateButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15)
        ])
    }
    
    private func setupTimeButton() {
        NSLayoutConstraint.activate([
            timeButton.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 0),
            timeButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



