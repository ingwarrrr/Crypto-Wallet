//
//  CryptoCoinsPresenter.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import Foundation

protocol CryptoCoinsViewProtocol: AnyObject {
    func fetchSuccess()
    func fetchFailure(error: Error)
    func updateTable()
}

protocol CryptoCoinsPresenterProtocol: AnyObject {
    var cryptoCoins: [CryptoCoinModel]? { get set }
    init(view: CryptoCoinsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getCryptoCoinsData()
    func getCryptoCoins()
    func sortCryptoCoinsByASC()
    func sortCryptoCoinsByDESC()
    func goToCryptoCoinDetailView(cryptoCoin: CryptoCoinModel)
    func tapOnLogout()
}

enum CryptoCoinNames: Int, CaseIterable {
    case btc = 0
    case eth
    case tron
    case polkadot
    case dogecoin
    case tether
    case stellar
    case cardano
    case xrp

    var index: Int {
        return rawValue
    }

    var value: String {
        return String(describing: self)
    }
}

class CryptoCoinsPresenter: CryptoCoinsPresenterProtocol {
    private var cryptoData: [CryptoCoinModel]? = Array(repeating: CryptoCoinModel(data: nil), count: CryptoCoinNames.allCases.count)
    var cryptoCoins: [CryptoCoinModel]? {
        didSet {
            view?.updateTable()
        }
    }
    weak var view: CryptoCoinsViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol

    required init(view: CryptoCoinsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
        getCryptoCoinsData()
    }

    func getCryptoCoinsData() {
        let group = DispatchGroup()

        for name in CryptoCoinNames.allCases {
            group.enter()
            networkService.getCryptoCoin(name: name.value) { [weak self] result in
                defer {
                    group.leave()
                }
                guard let self = self else { return }

                DispatchQueue.main.async {
                    switch result {
                    case .success(let cryptoCoin):
                        self.cryptoData?[name.index] = cryptoCoin
                    case .failure(let error):
                        self.view?.fetchFailure(error: error)
                    }
                }
            }
        }

        group.notify(queue: .main) {
            self.view?.fetchSuccess()
        }
    }

    func getCryptoCoins() {
        cryptoCoins = cryptoData?.filter({ cryptoCoin in
            cryptoCoin.data != nil
        })
    }

    func sortCryptoCoinsByASC() {
        cryptoCoins = cryptoCoins?.sorted {
            $0.data?.marketData?.priceUsd ?? 0 > $1.data?.marketData?.priceUsd ?? 0
        }
    }

    func sortCryptoCoinsByDESC() {
        cryptoCoins = cryptoCoins?.sorted {
            $0.data?.marketData?.priceUsd ?? 0 < $1.data?.marketData?.priceUsd ?? 0
        }
    }

    func goToCryptoCoinDetailView(cryptoCoin: CryptoCoinModel) {
        router?.showCryptoCoinDetail(cryptoCoin: cryptoCoin)
    }

    func tapOnLogout() {
        router?.showAuthorization()
    }
}
