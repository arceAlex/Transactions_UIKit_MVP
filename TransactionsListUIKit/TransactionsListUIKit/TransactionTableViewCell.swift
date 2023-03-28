//
//  TransactionTableViewCell.swift
//  TransactionsListUIKit
//
//  Created by Alejandro Arce on 23/3/23.
//

import Foundation
import UIKit

class TransactionTableViewCell: UITableViewCell {
    lazy var dateLabel : UILabel = {
        let dateLabel = UILabel(frame: CGRect(x: 20, y: 7.5, width: 100, height: 30))
        dateLabel.textColor = .black
        dateLabel.font = dateLabel.font.withSize(20)
        return dateLabel
    }()
    lazy var amountLabel : UILabel = {
        let amountLabel = UILabel(frame: CGRect(x: 160, y: 7.5, width: 100, height: 30))
        amountLabel.textColor = .black
        amountLabel.font = dateLabel.font.withSize(20)
        return amountLabel
    }()
    lazy var badge : UIImageView = {
        var badge = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width - 40, y: 10, width: 20, height: 20))
        badge.image = UIImage(systemName: "circle.fill")
        return badge
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dateLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(badge)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
