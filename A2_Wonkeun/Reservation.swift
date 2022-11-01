//
//  Reservation.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-30.
//

import Foundation

class Reservation {
    static var id: Int = 0
    var name: String
    var airportDeparture: String
    var airportArrival: String
    var date: Date
    var cost: Double
    
    init(name: String, airportDeparture: String, airportArrival: String, date: Date, cost: Double){
        Reservation.id += 1
        self.name = name
        self.airportDeparture = airportDeparture
        self.airportArrival = airportArrival
        self.date = date
        self.cost = cost
    }
}
