//
//  TransactionsApi.swift
//  TransactionsListUIKit
//
//  Created by Alejandro Arce on 23/3/23.
//

import Foundation

class TransactionsApi {
    static func fetchTransactions() async throws -> [TransactionModel]{
        let url = URL(string: "https://code-challenge-e9f47.web.app/transactions.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([TransactionModel].self, from: data)
    }
}
