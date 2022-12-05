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
    
    Expense(icon: "Car", title: "Car Park", subTitle: "Car Park Price", amount: "$200.00"),
    Expense(icon: "Tax", title: "Tax Chart", subTitle: "Tax Service Charge", amount: "$56.04"),
    Expense(icon: "Location", title: "Location Park", subTitle: "Location Park Price", amount: "$32.00"),

]

// MARK: Months and Sample Progress for Animating Speedmeter
let months: [String] = ["Jan","Feb","Mar","Apr","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
let progressArray: [CGFloat] = [0.1,0.4,0.9,0.5,0.3,0.8,0.6,0.2,0.89,0.45,0.98,0.32]
