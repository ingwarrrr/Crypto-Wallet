//
//  CryptoCoinsView + Extension.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit

extension CryptoCoinsView {

    func makeSortButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor

        return button
    }

    func makeCtyproCoinsTableView() -> UITableView {
        let tableView = UITableView()

        return tableView
    }

    func makeActivityIndicator() -> UIActivityIndicatorView {
        let acryvityIndicator = UIActivityIndicatorView(style: .large)
        acryvityIndicator.color = .systemGray
        acryvityIndicator.hidesWhenStopped = true

        return acryvityIndicator
    }
}
