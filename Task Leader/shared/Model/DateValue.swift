//
//  DateValue.swift
//  Task Leader
//
//  Created by macbook on 29/09/2022.
//

import SwiftUI

//Date Value Model..
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
