//
//  AuthorizationPresenter.swift
//  CryptoWallet
//
//  Created by Igor on 31.01.2023.
//

import Foundation

protocol AuthorizationViewProtocol: AnyObject {
    func validationError()
    func validationSuccess()
}

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationViewProtocol, router: RouterProtocol)
    func validateCredentials(login: String, password: String)
    func goToCryptoCoinView()
}

class AuthorizationPresenter: AuthorizationPresenterProtocol {
    weak var view: AuthorizationViewProtocol?
    var router: RouterProtocol?

    required init(view: AuthorizationViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

    func validateCredentials(login: String, password: String) {
        if login == authorizationCorrectData.login && password == authorizationCorrectData.password {
            self.view?.validationSuccess()
        } else {
            self.view?.validationError()
        }
    }

    func goToCryptoCoinView() {
        router?.showCryptoCoins()
    }
}
