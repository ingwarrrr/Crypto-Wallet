//
//  CryptoCoinLabel.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit

class CryptoCoinLabel: UILabel {

    enum CustomLabelType {
            case name
            case priceUsd
            case percentChangeUsdLast1Hours
            case percentChangeUsdLast24Hours
            case normal
        }

        private let labelType: CustomLabelType

        init(labelType: CustomLabelType) {
            self.labelType = labelType
            super.init(frame: .zero)

            self.layer.cornerRadius = 10
            self.numberOfLines = 0
            self.textAlignment = .center
            self.backgroundColor = .secondarySystemBackground
            self.layer.masksToBounds = true

            switch labelType {
            case .name:
                self.text = "Название: "
            case .priceUsd:
                self.text = "Стоимость: "
            case .percentChangeUsdLast1Hours:
                self.text = "Изменение за 1 час: "
            case .percentChangeUsdLast24Hours:
                self.text = "Изменение за 24 часа: "
            case .normal:
                self.text = ""
            }
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
