//
//  CryptoCoinsViewController.swift
//  CryptoWallet
//
//  Created by Igor on 01.02.2023.
//

import UIKit

private struct Constants {
    static var cryptoCoinCellID: String { "CryptoCoinTableViewCell" }
    static var navBarTitile: String { "CryptoWallet" }
}

class CryptoCoinsViewController: UIViewController {
    var presenter: CryptoCoinsPresenterProtocol!
    private lazy var contentView = CryptoCoinsView()

    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setUpTargets()
    }

    func setupUI() {
        self.view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupTableView()
    }

    private func setUpTargets() {
        contentView.sortButtonDESC.addTarget(self, action: #selector(sortDESC), for: .touchUpInside)
        contentView.sortButtonASC.addTarget(self, action: #selector(sortASC), for: .touchUpInside)
    }

    @objc func sortDESC(_ sender: UIButton!) {
        changeSortButtonsUI(sortButtonFirst: sender, sortButtonSecond: contentView.sortButtonASC)

        contentView.activityIndicator.startAnimating()
        presenter.sortCryptoCoinsByASC()
    }

    @objc func sortASC(_ sender: UIButton!) {
        changeSortButtonsUI(sortButtonFirst: sender, sortButtonSecond: contentView.sortButtonDESC)

        contentView.activityIndicator.startAnimating()
        presenter.sortCryptoCoinsByDESC()
    }

    func changeSortButtonsUI(sortButtonFirst: UIButton, sortButtonSecond: UIButton) {
        if sortButtonSecond.isEnabled == false {
            sortButtonSecond.isEnabled = true
            sortButtonSecond.backgroundColor = .systemBlue
        }
        sortButtonFirst.isEnabled = false
        sortButtonFirst.backgroundColor = .systemGray
    }

    func setupTableView() {
        contentView.cryptoCoinsTableView.delegate = self
        contentView.cryptoCoinsTableView.dataSource = self
        contentView.cryptoCoinsTableView.register(
            CryptoCoinTableViewCell.self,
            forCellReuseIdentifier: Constants.cryptoCoinCellID)
    }

    func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Log out",
            style: .done,
            target: self,
            action: #selector(self.logOut))
        self.navigationItem.title = Constants.navBarTitile
    }

    @objc private func logOut() {
        presenter.tapOnLogout()
    }
}

// MARK: - UITableViewDelegate

extension CryptoCoinsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cryptoCoin = presenter.cryptoCoins?[indexPath.row] else {
            return
        }
        presenter.goToCryptoCoinDetailView(cryptoCoin: cryptoCoin)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - UITableViewDataSource

extension CryptoCoinsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cryptoCoins?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cryptoCoinCellID,
            for: indexPath) as? CryptoCoinTableViewCell
        else {
            return UITableViewCell()
        }
        let cryptoCoin = presenter.cryptoCoins?[indexPath.row]

        cell.setup(with: CryptoCoinTableViewCellModel(
            name: cryptoCoin?.data?.name ?? "[Неизвестно]",
            priceUsd: cryptoCoin?.data?.marketData?.priceUsd ?? 0,
            percentChangeUsdLast24Hours: cryptoCoin?.data?.marketData?.percentChangeUsdLast24Hours ?? 0)
        )

        return cell
    }
}

// MARK: - CryptoCoinsViewProtocol

extension CryptoCoinsViewController: CryptoCoinsViewProtocol {
    func fetchFailure(error: Error) {
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { _ in
            self.presenter.getCryptoCoinsData()
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        self.present(alert, animated: true)
    }

    func fetchSuccess() {
        presenter.getCryptoCoins()
    }

    func updateTable() {
        contentView.activityIndicator.stopAnimating()
        contentView.cryptoCoinsTableView.reloadData()
    }
}
