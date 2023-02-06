//
//  ModuleBuilder.swift
//  CryptoWallet
//
//  Created by Igor on 31.01.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createAuthorizationModule(router: RouterProtocol) -> UIViewController
    func createCryptoCoinsModule(router: RouterProtocol) -> UIViewController
    func createCryptoCoinDetailModule(router: RouterProtocol, cryptoCoin: CryptoCoinModel) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createAuthorizationModule(router: RouterProtocol) -> UIViewController {
        let view = AuthorizationViewController()
        let presenter = AuthorizationPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }

    func createCryptoCoinsModule(router: RouterProtocol) -> UIViewController {
        let view = CryptoCoinsViewController()
        let networkService = NetworkService()
        let presenter = CryptoCoinsPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }

    func createCryptoCoinDetailModule(router: RouterProtocol, cryptoCoin: CryptoCoinModel) -> UIViewController {
        let view = CryptoCoinDetailViewController()
        let presenter = CryptoCoinDetailPresenter(view: view, cryptoCoin: cryptoCoin)
        view.presenter = presenter
        return view
    }
}
