//
//  CryptocurrencyTableViewCell.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import UIKit

/// A cell used to display information about a cryptocurrency
class CryptocurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencySymbolLabel  : UILabel!
    @IBOutlet weak var currencyNameLabel    : UILabel!
    @IBOutlet weak var currentPriceLabel    : UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }
    
    /// Configures the cells contents
    ///
    /// - Parameter currency: the cryptocurrency object used to populate the cell's labels
    func configure(with currency: Cryptocurrency) {
        currencySymbolLabel.text = currency.symbol.uppercased()
        currencyNameLabel.text = currency.name
        getCurrentPrice(for: currency)
    }
    
    /// Makes an api request to get the current price for a given cryptocurrency
    ///
    /// - Parameter currency: the cryptocurrency to get the price for
    private func getCurrentPrice(for currency: Cryptocurrency) {
        
        CryptoGetCurrencyPriceAPIRequest(currency: currency,
                                         exchange: .bitfinex,
                                         fiatSymbol: .usd)
            .makeRequestAndMap()
            .onSuccess { [weak self] price in
                self?.currentPriceLabel.text = "$\(price)"
            }
            .onFailure { [weak self] error in
                self?.currentPriceLabel.text = "Unavailable"
        }
    }
    
    /// Resets the cell's labels for cell reuse
    private func resetCell() {
        currencySymbolLabel.text = nil
        currencyNameLabel.text = nil
        currentPriceLabel.text = nil
    }
    
}
