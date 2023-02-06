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
        setUpConstraints()
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

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            sortButtonASC.topAnchor.constraint(equalTo: self.topAnchor, constant: 98),
            sortButtonASC.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sortButtonASC.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            sortButtonASC.heightAnchor.constraint(equalToConstant: 50.0),

            sortButtonDESC.topAnchor.constraint(equalTo: sortButtonASC.topAnchor),
            sortButtonDESC.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            sortButtonDESC.widthAnchor.constraint(equalTo: sortButtonASC.widthAnchor),
            sortButtonDESC.heightAnchor.constraint(equalTo: sortButtonASC.heightAnchor),

            cryptoCoinsTableView.topAnchor.constraint(equalTo: sortButtonASC.bottomAnchor),
            cryptoCoinsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cryptoCoinsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cryptoCoinsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
