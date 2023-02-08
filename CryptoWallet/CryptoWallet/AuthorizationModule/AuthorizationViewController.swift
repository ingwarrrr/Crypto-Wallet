//
//  ViewController.swift
//  CryptoWallet
//
//  Created by Igor on 25.01.2023.
//

import UIKit

class AuthorizationViewController: UIViewController {
    var presenter: AuthorizationPresenterProtocol!
    private lazy var contentView = AuthorizationView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setUpTargets()
    }

    private func setUpTargets() {
        contentView.singInButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }

    @objc func singInButtonTapped(_ sender: UIButton!) {
        let login = contentView.userNameTextField.text ?? ""
        let password = contentView.passwordTextField.text ?? ""
        self.presenter.validateCredentials(login: login, password: password)
    }
}

extension AuthorizationViewController: AuthorizationViewProtocol {
    func validationSuccess() {
        contentView.errorLabel.isHidden = true
        presenter.goToCryptoCoinView()
    }

    func validationError() {
        contentView.errorLabel.isHidden = false
    }
}
