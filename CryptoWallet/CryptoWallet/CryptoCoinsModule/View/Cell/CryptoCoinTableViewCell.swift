//
//  CryptoCoinTableViewCell.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit
import Foundation

struct CryptoCoinTableViewCellModel {
    let name: String
    let priceUsd: Double
    let percentChange24Hours: Double
}

class CryptoCoinTableViewCell: UITableViewCell {

    var model: CryptoCoinTableViewCellModel?

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let priceUsdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let percentChangeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true

        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        setupConstaints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
        setupConstaints()
    }

    func setup(with model: CryptoCoinTableViewCellModel) {
        self.model = model

        self.nameLabel.text = model.name
        self.percentChangeLabel.text = String(format: "%.3f %%", model.percentChange24Hours)
        self.percentChangeLabel.textColor = (model.percentChange24Hours < 0) ? UIColor.systemRed : UIColor.systemGreen
        self.priceUsdLabel.text = String(format: "%.2f $", model.priceUsd)
        self.priceUsdLabel.textColor = (model.priceUsd <= 0) ? UIColor.gray : UIColor.systemGreen
    }

    func setupUI() {
        containerView.addSubview(nameLabel)
        containerView.addSubview(percentChangeLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(priceUsdLabel)
    }

    func setupConstaints() {
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            containerView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),

            percentChangeLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 6),
            percentChangeLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            percentChangeLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),

            priceUsdLabel.widthAnchor.constraint(equalToConstant: 120),
            priceUsdLabel.heightAnchor.constraint(equalToConstant: 20),
            priceUsdLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            priceUsdLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.nameLabel.text = nil
        self.percentChangeLabel.text = nil
        self.priceUsdLabel.text = nil
    }
}
