//
//  Expense.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 5/12/2565 BE.
//

import SwiftUI

// MARK: Expense Model and Sample Data
struct Expense: Identifiable{
    var id = UUID().uuidString
    var icon: String
    var title: String
    var subTitle: String
    var amount: String
}

var expenses: [Expense] = [
    
    Expense(icon: "Car", title: "Prasarnmit (SWU)", subTitle: "Car Park Prasarnmit", amount: "$224.13"),
    Expense(icon: "Car", title: "Central RAMA 9", subTitle: "Car Park Central RAMA 9", amount: "$56.04"),
    Expense(icon: "Car", title: "SAMYAN Mitrtown", subTitle: "Car Park SAMYAN Mitrtown", amount: "49.77"),

]

// MARK: Months and Sample Progress for Animating Speedmeter
let months: [String] = ["Jan","Feb","Mar","Apr","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
let progressArray: [CGFloat] = [0.1,0.4,0.9,0.5,0.3,0.8,0.6,0.2,0.89,0.45,0.98,0.32]
