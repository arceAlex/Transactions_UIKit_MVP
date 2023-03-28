//
//  ViewController.swift
//  TransactionsListUIKit
//
//  Created by Alejandro Arce on 23/3/23.
//

import UIKit

class TransactionsVC: UIViewController {
    let transactionsPresenter = TransactionsPresenter()
    var transactionsArray = [TransactionModelTransformed]()
    var transactionsView = TransactionsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        transactionsView.listTableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: "cell")
        transactionsView.listTableView.dataSource = self
        transactionsPresenter.delegate = self
        view.addSubview(transactionsView)
        self.title = "Transactions"
        getSafeArea()
        Task {
            await transactionsPresenter.getTransactions()
        }
    }
    func getSafeArea() {
        transactionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transactionsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            transactionsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            transactionsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transactionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension TransactionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionTableViewCell
        cell.dateLabel.text = transactionsArray[indexPath.row].date.formatted(date: .numeric, time: .omitted)
        cell.amountLabel.text = "\(String(transactionsArray[indexPath.row].totalAmount)) €"
        if transactionsArray[indexPath.row].amount > 0 {
            cell.badge.tintColor = .green
        } else {
            cell.badge.tintColor = .red
        }
        return cell
    }
}
extension TransactionsVC : TransactionsPresenterDelegate {
    func sendTransactions(transactions: [TransactionModelTransformed]) {
        transactionsArray = transactions
        DispatchQueue.main.async {
            self.transactionsView.listTableView.reloadData()
        }
    }
}
