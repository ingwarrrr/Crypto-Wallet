//
//  AuthorizationView + Extension.swift
//  CryptoWallet
//
//  Created by Igor on 31.01.2023.
//

import UIKit

extension AuthorizationView {
    func makeUserTextField() -> UITextField {
        let textfield = AuthorizationTextField(fieldType: .username)

        return textfield
    }

    func makePasswordTextField() -> UITextField {
        let textfield = AuthorizationTextField(fieldType: .password)

        return textfield
    }

    func makeErrorLabel() -> UILabel {
        let label = UILabel()
        label.text = "Неверный логин или пароль"
        label.font = UIFont(name: "Helvetica Neue", size: 18.0)
        label.textColor = UIColor.red.withAlphaComponent(0.7)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.isHidden = true

        return label
    }

    func makeSingInButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor

        return button
    }
}
