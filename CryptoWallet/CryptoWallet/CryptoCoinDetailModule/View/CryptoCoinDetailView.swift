//
//  CryptoCoinDetailView.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit

class CryptoCoinDetailView: UIView {

    lazy var coinNameLabel = CryptoCoinLabel(labelType: .name)
    lazy var coinPriceLabel = CryptoCoinLabel(labelType: .priceUsd)
    lazy var coin1HourPercentChangeLabel = CryptoCoinLabel(labelType: .percentChangeUsdLast1Hours)
    lazy var coin24HoursPercentChangeLabel = CryptoCoinLabel(labelType: .percentChangeUsdLast24Hours)

    init() {
        super.init(frame: .zero)

        addSubviews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [coinNameLabel, coinPriceLabel, coin1HourPercentChangeLabel, coin24HoursPercentChangeLabel]
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

                coinPriceLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 20.0),
                coinPriceLabel.centerXAnchor.constraint(equalTo: coinNameLabel.centerXAnchor),
                coinPriceLabel.widthAnchor.constraint(equalTo: coinNameLabel.widthAnchor),
                coinPriceLabel.heightAnchor.constraint(equalTo: coinNameLabel.heightAnchor),

                coin1HourPercentChangeLabel.topAnchor.constraint(equalTo: coinPriceLabel.bottomAnchor, constant: 20.0),
                coin1HourPercentChangeLabel.centerXAnchor.constraint(equalTo: coinPriceLabel.centerXAnchor),
                coin1HourPercentChangeLabel.widthAnchor.constraint(equalTo: coinPriceLabel.widthAnchor),
                coin1HourPercentChangeLabel.heightAnchor.constraint(equalTo: coinPriceLabel.heightAnchor),

                coin24HoursPercentChangeLabel.topAnchor.constraint(equalTo: coin1HourPercentChangeLabel.bottomAnchor, constant: 15.0),
                coin24HoursPercentChangeLabel.centerXAnchor.constraint(equalTo: coinNameLabel.centerXAnchor),
                coin24HoursPercentChangeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
                coin24HoursPercentChangeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
                coin24HoursPercentChangeLabel.heightAnchor.constraint(equalTo: coinNameLabel.heightAnchor)
            ])
        }
}
