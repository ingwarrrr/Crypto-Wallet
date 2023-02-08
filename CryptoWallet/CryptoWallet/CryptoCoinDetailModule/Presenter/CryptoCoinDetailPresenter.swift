//
//  CryptoCoinDetailPresenter.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import Foundation

protocol CryptoCoinDetailViewProtocol: AnyObject {
    func setCryptoCoin(cryptoCoin: CryptoCoinDetailViewModel)
}

protocol CryptoCoinPresenterProtocol: AnyObject {
    init(view: CryptoCoinDetailViewProtocol, cryptoCoin: CryptoCoinModel?)
    func setCryptoCoin()
    var cryptoCoin: CryptoCoinModel? { get set }
}

class CryptoCoinDetailPresenter: CryptoCoinPresenterProtocol {
    weak var view: CryptoCoinDetailViewProtocol?
    var cryptoCoin: CryptoCoinModel?

    required init(view: CryptoCoinDetailViewProtocol, cryptoCoin: CryptoCoinModel?) {
        self.view = view
        self.cryptoCoin = cryptoCoin
    }

    public func setCryptoCoin() {
        let percent1HourChange = cryptoCoin?.data?.marketData?.percentChangeUsdLast1Hour
        let percent24HourChange = cryptoCoin?.data?.marketData?.percentChangeUsdLast24Hours

        let formattedCoin = CryptoCoinDetailViewModel(
            name: cryptoCoin?.data?.name ?? "[Неизвестно]",
            priceUsd: String(format: "%.2f $", cryptoCoin?.data?.marketData?.priceUsd ?? 0),
            percentChange1Hours: String(format: "%.3f %%", percent1HourChange ?? 0),
            percentChange24Hours: String(format: "%.3f %%", percent24HourChange ?? 0))

        self.view?.setCryptoCoin(cryptoCoin: formattedCoin)
    }
}
