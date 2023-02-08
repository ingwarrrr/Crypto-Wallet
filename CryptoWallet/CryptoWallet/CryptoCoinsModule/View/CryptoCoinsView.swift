//
//  CryptoCoinsView.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import UIKit

class CryptoCoinsView: UIView {
    lazy var sortButtonASC = makeSortButton(title: "По возрастанию")
    lazy var sortButtonDESC = makeSortButton(title: "По убыванию")
    lazy var activityIndicator = makeActivityIndicator()
    lazy var cryptoCoinsTableView = makeCtyproCoinsTableView()

    init() {
        super.init(frame: .zero)

        addSubviews()
        activityIndicator.startAnimating()
        cryptoCoinsTableView.backgroundView = activityIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [sortButtonASC, sortButtonDESC, cryptoCoinsTableView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
}
