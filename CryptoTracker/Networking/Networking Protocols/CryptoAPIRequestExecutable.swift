//
//  CryptoAPIRequestExecutable.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import Alamofire
import BrightFutures

typealias JSON            = Any
typealias JSONAPIFuture   = Future<JSON, CryptoAPIError>
typealias JSONAPIPromise  = Promise<JSON, CryptoAPIError>

/// A protocol used for creating and making api requests
protocol CryptoAPIRequestExecutable {
    
    var relativePath    : String { get }
    var absolutePath    : String { get }
    var method          : HTTPMethod { get }
    var parameters      : Parameters? { get }
    var encoding        : JSONEncoding { get }
    var headers         : HTTPHeaders? { get }
    
    func makeRequest() -> JSONAPIFuture
    
}

// A default implementation of the protocol used to provide commonly used values for making api requests
extension CryptoAPIRequestExecutable {
    
    private var baseURL : String { return "https://api.cryptowat.ch" }
    
    var absolutePath    : String { return baseURL + relativePath }
    var encoding        : JSONEncoding { return .default }
    var parameters      : Parameters? { return nil }
    var headers         : HTTPHeaders? { return nil }
    
    func makeRequest() -> JSONAPIFuture {
        
        let promise = JSONAPIPromise()

        Alamofire.request(absolutePath,
                          method: method,
                          parameters: parameters,
                          encoding: encoding,
                          headers: headers)
            .responseJSON { (response) in

                guard let json = response.result.value else { return promise.failure(.connectionError) }
                return promise.success(json)
        }

        return promise.future
    }
    
}
