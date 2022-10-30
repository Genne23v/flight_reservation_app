//
//  Reservation.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-30.
//

import Foundation

class Reservation {
    var id: Int
    var name: String
    var airportDeparture: String
    var airportArrival: String
    var date: Date
    var cost: Double
    
    init(id: Int, name: String, airportDeparture: String, airportArrival: String, date: Date, cost: Double){
        self.id = id
        self.name = name
        self.airportDeparture = airportDeparture
        self.airportArrival = airportArrival
        self.date = date
        self.cost = cost
    }
}
