//
//  CryptoCoinModel.swift
//  CryptoWallet
//
//  Created by Igor on 04.02.2023.
//

import Foundation

// MARK: - CryptoCoinModel
class CryptoCoinModel: Codable {
    let data: DataClass?

    init(data: DataClass?) {
        self.data = data
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let name: String?
    let marketData: MarketData?

    enum CodingKeys: String, CodingKey {
        case name
        case marketData = "market_data"
    }

    init(
        name: String?,
        marketData: MarketData?
    ) {
        self.name = name
        self.marketData = marketData
    }
}

// MARK: - MarketData
class MarketData: Codable {
    let priceUsd: Double?
    let percentChangeUsdLast1Hour: Double?
    let percentChangeUsdLast24Hours: Double?

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case percentChangeUsdLast1Hour = "percent_change_usd_last_1_hour"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
    }

    init(
        priceUsd: Double?,
        percentChangeUsdLast1Hour: Double?,
        percentChangeUsdLast24Hours: Double?
    ) {
        self.priceUsd = priceUsd
        self.percentChangeUsdLast1Hour = percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = percentChangeUsdLast24Hours
    }
}
