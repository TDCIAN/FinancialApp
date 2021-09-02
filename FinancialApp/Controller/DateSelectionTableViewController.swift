//
//  DateSelectionTableViewController.swift
//  FinancialApp
//
//  Created by 김정민 on 2021/09/02.
//

import UIKit

class DateSelectionTableViewController: UITableViewController {
    
    var timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted?
    var monthInfos: [MonthInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMonthInfos()
    }
     
    private func setupMonthInfos() {
        if let monthInfos = timeSeriesMonthlyAdjusted?.getMonthInfos() {
            self.monthInfos = monthInfos
        }
    }
    
}

extension DateSelectionTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthInfos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let monthInfo = monthInfos[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! DateSelectionTableViewCell
        cell.configure(with: monthInfo)
        return cell
    }
}

class DateSelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthsAgoLabel: UILabel!
    
    func configure(with monthInfo: MonthInfo) {
        backgroundColor = .red
//        dateLabel.text = monthInfo.date
    }
}
