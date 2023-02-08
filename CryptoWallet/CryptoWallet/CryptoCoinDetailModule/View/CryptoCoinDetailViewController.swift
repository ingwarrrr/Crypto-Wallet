//
//  CryptoCoinDetailViewController.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit

class CryptoCoinDetailViewController: UIViewController {
    var presenter: CryptoCoinPresenterProtocol!
    private lazy var contentView = CryptoCoinDetailView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        presenter.setCryptoCoin()
    }
}

extension CryptoCoinDetailViewController: CryptoCoinDetailViewProtocol {
    func setCryptoCoin(cryptoCoin: CryptoCoinDetailViewModel) {
        contentView.coinNameLabel.text?.append(cryptoCoin.name)
        contentView.priceUsdLabel.text?.append(cryptoCoin.priceUsd)
        contentView.percentChange1HLabel.text?.append(cryptoCoin.percentChange1Hours)
        contentView.percentChange24HLabel.text?.append(cryptoCoin.percentChange24Hours)
    }
}
