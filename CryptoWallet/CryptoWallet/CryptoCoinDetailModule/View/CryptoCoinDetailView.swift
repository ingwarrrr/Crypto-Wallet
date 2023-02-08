//
//  CryptoCoinDetailView.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit

class CryptoCoinDetailView: UIView {

    lazy var coinNameLabel = CryptoCoinLabel(labelType: .name)
    lazy var priceUsdLabel = CryptoCoinLabel(labelType: .priceUsd)
    lazy var                 percentChange1HLabel = CryptoCoinLabel(labelType: .percentChangeUsdLast1Hours)
    lazy var                 percentChange24HLabel = CryptoCoinLabel(labelType: .percentChangeUsdLast24Hours)

    init() {
        super.init(frame: .zero)

        addSubviews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [coinNameLabel, priceUsdLabel, percentChange1HLabel, percentChange24HLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            coinNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            coinNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -90.0),
            coinNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            coinNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            coinNameLabel.heightAnchor.constraint(equalToConstant: 50.0),

            priceUsdLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 20.0),
            priceUsdLabel.centerXAnchor.constraint(equalTo: coinNameLabel.centerXAnchor),
            priceUsdLabel.widthAnchor.constraint(equalTo: coinNameLabel.widthAnchor),
            priceUsdLabel.heightAnchor.constraint(equalTo: coinNameLabel.heightAnchor),

            percentChange1HLabel.topAnchor.constraint(equalTo: priceUsdLabel.bottomAnchor, constant: 20.0),
            percentChange1HLabel.centerXAnchor.constraint(equalTo: priceUsdLabel.centerXAnchor),
            percentChange1HLabel.widthAnchor.constraint(equalTo: priceUsdLabel.widthAnchor),
            percentChange1HLabel.heightAnchor.constraint(equalTo: priceUsdLabel.heightAnchor),

            percentChange24HLabel.topAnchor.constraint(equalTo: percentChange1HLabel.bottomAnchor, constant: 15.0),
            percentChange24HLabel.centerXAnchor.constraint(equalTo: coinNameLabel.centerXAnchor),
            percentChange24HLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            percentChange24HLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            percentChange24HLabel.heightAnchor.constraint(equalTo: coinNameLabel.heightAnchor)
        ])
    }
}
