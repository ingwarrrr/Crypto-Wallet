//
//  AuthorizationView.swift
//  CryptoWallet
//
//  Created by Igor on 31.01.2023.
//

import UIKit

final class AuthorizationView: UIView {
    lazy var userNameTextField = makeUserTextField()
    lazy var passwordTextField = makePasswordTextField()
    lazy var errorLabel = makeErrorLabel()
    lazy var singInButton = makeSingInButton()

    init() {
        super.init(frame: .zero)

        addSubviews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [userNameTextField, passwordTextField, errorLabel, singInButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            userNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userNameTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -90.0),
            userNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            userNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50.0),

            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20.0),
            passwordTextField.centerXAnchor.constraint(equalTo: userNameTextField.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor, multiplier: 1.0),
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),

            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15.0),
            errorLabel.centerXAnchor.constraint(equalTo: userNameTextField.centerXAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            errorLabel.heightAnchor.constraint(equalToConstant: 30.0),

            singInButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 15.0),
            singInButton.centerXAnchor.constraint(equalTo: userNameTextField.centerXAnchor),
            singInButton.widthAnchor.constraint(equalToConstant: 200.0),
            singInButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
