//
//  CalculatorTableViewController.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/09/02.
//

import UIKit

class CalculatorTableViewController: UITableViewController {
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var currencyLabels: [UILabel]!
    @IBOutlet weak var investmentAmountCurrencyLabel: UILabel!
    var asset: Asset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        symbolLabel.text = asset?.searchResult.symbol
        nameLabel.text = asset?.searchResult.name
        investmentAmountCurrencyLabel.text = asset?.searchResult.currency
        currencyLabels.forEach { label in
            label.text = asset?.searchResult.currency.addBrackets()
        }
    }
}
