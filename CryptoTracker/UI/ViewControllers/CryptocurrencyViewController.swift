//
//  CryptocurrencyViewController.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import UIKit

class CryptocurrencyViewController: UITableViewController {
    
    lazy var cryptoManager = { return CryptoManager() }()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        cryptoManager.getAllCurrencies { [weak self] in self?.tableView.reloadData() }
    }
    
    private func registerCells() {
        let cryptoCell = UINib(nibName: "CryptocurrencyTableViewCell", bundle: Bundle.main)
        tableView.register(cryptoCell, forCellReuseIdentifier: "cryptoCell")
    }
    
    // MARK:- UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoManager.viewModel.currencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptocurrencyTableViewCell
        cell.configure(with: cryptoManager.viewModel.currencies[indexPath.row] )
        
        return cell
    }
    
}
