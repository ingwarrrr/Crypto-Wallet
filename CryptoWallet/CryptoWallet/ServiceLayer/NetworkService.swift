//
//  NetworkServiceProtocol.swift
//  CryptoWallet
//
//  Created by Igor on 02.02.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCryptoCoin(name: String, completion: @escaping (Result<CryptoCoinModel, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getCryptoCoin(name: String, completion: @escaping (Result<CryptoCoinModel, Error>) -> Void) {
        let urlString = "https://data.messari.io/api/v1/assets/\(name)/metrics"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let cryptoCoin = try JSONDecoder().decode(CryptoCoinModel.self, from: data!)
                completion(.success(cryptoCoin))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
