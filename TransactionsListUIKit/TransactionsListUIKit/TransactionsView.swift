//
//  TransactionsView.swift
//  TransactionsListUIKit
//
//  Created by Alejandro Arce on 23/3/23.
//

import Foundation
import UIKit

class TransactionsView : UIView {
    var listTableView : UITableView = {
        let listTableView = UITableView()
        return listTableView
    }()
    init() {
        super.init(frame: UIScreen.main.bounds)
        config()
    }
    func config() {
        addSubview(listTableView)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
