//
//  CryptoDataTypes.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

/// Describes an API error
///
/// - connectionError: there is an error connecting to the API
/// - unknown: error is unkown
enum CryptoAPIError: Error {
    case connectionError
    case unknown
}

/// Cryptocurrency Exchanges
///
/// - bitfinex: bitfinex.com
/// - bitstamp: bitstamp.net
/// - gdax: gdax.com
/// - gemini: gemini.com
/// - kraken: kraken.com
enum CryptoExchange: String {
    
    case bitfinex
    case bitstamp
    case gdax
    case gemini
    case kraken
    
}

/// Types of fiat currencies
///
/// - cny: Chinese Yuan
/// - eur: Euro
/// - gbp: British Pound
/// - jpy: Japanese Yen
/// - krw: Korean Won
/// - usd: US Dollar
enum FiatSymbol: String {
    
    case cny
    case eur
    case gbp
    case jpy
    case krw
    case usd
    
}
