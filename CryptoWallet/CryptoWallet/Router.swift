//
//  Router.swift
//  CryptoWallet
//
//  Created by Igor on 03.02.2023.
//

import UIKit

private struct Constants {
    static var loginState: String { "_key_Login_State" }
}

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func showAuthorization()
    func showCryptoCoins()
    func showCryptoCoinDetail(cryptoCoin: CryptoCoinModel)
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(
        navigationController: UINavigationController,
        assemblyBuilder: AssemblyBuilderProtocol
    ) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if UserDefaults.standard.bool(forKey: Constants.loginState) == false {
            showAuthorization()
        } else {
            showCryptoCoins()
        }
    }

    func showAuthorization() {
        if UserDefaults.standard.bool(forKey: Constants.loginState) == true {
            UserDefaults.standard.set(false, forKey: Constants.loginState)
        }

        if let navigationController = navigationController {
            guard let authorizationVC = assemblyBuilder?.createAuthorizationModule(router: self) else { return }
            navigationController.viewControllers = [authorizationVC]
        }
    }

    func showCryptoCoins() {
        if UserDefaults.standard.bool(forKey: Constants.loginState) == false {
            UserDefaults.standard.set(true, forKey: Constants.loginState)
        }

        if let navigationController = navigationController {
            guard let cryptoCoinsVC = assemblyBuilder?.createCryptoCoinsModule(router: self) else { return }
            navigationController.viewControllers = [cryptoCoinsVC]
        }
    }

    func showCryptoCoinDetail(cryptoCoin: CryptoCoinModel) {
        if let navigationController = navigationController {
            guard let cryptoCoinVC = assemblyBuilder?.createCryptoCoinDetailModule(
                router: self,
                cryptoCoin: cryptoCoin) else { return }
            navigationController.pushViewController(cryptoCoinVC, animated: true)
        }
    }
}
