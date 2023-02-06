//
//  AuthorizationTextField.swift
//  CryptoWallet
//
//  Created by Igor on 01.02.2023.
//

import UIKit

class AuthorizationTextField: UITextField {

    enum CustomTextFieldType {
            case username
            case password
        }

        private let authFieldType: CustomTextFieldType

        init(fieldType: CustomTextFieldType) {
            self.authFieldType = fieldType
            super.init(frame: .zero)

            self.backgroundColor = .secondarySystemBackground
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 10

            self.returnKeyType = .done
            self.autocorrectionType = .no
            self.autocapitalizationType = .none

            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))

            switch fieldType {
            case .username:
                self.placeholder = "Логин"
            case .password:
                self.placeholder = "Пароль"
                self.isSecureTextEntry = true
            }
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
