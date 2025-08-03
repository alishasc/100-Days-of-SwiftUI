//
//  Address.swift
//  CupcakeCorner
//
//  Created by Alisha Carrington on 02/08/2025.
//

import Foundation

struct Address: Identifiable, Codable {
    var id = UUID()
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}
