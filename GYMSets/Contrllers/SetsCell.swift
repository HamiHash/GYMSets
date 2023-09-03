//
//  SetsCell.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 9/1/23.
//

import UIKit

class SetsCell: UICollectionViewListCell {
        // MARK: - Properties
    
        static let reuseIdentifier = "CollectionViewListCell"
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            return label
        }()
        
//        let subtitleLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.font = UIFont.systemFont(ofSize: 14)
//            label.textColor = .gray
//            return label
//        }()
        
        // MARK: - Initialization
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - UI Setup
        
        private func setupUI() {
            contentView.addSubview(titleLabel)
//            contentView.addSubview(subtitleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
                
//                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
//                subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//                subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//                subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            ])
        }
        
        // MARK: - Data Configuration
        
        func configure(title: String) {
            titleLabel.text = title
        }
}

