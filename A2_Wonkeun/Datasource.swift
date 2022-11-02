//
//  Datasource.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-11-01.
//

import Foundation

class Datasource {
    static let shared = Datasource()
    private init() {}
    
    var reservationList:[Reservation] = [
//        Reservation(name: "John Doe", airportDeparture: "Toronto - YYZ", airportArrival: "Edmonton - YEG", date: Calendar.current.date(from: DateComponents(year: 2013, month: 7, day: 4)) ?? Date(), cost: 276.22),
//        Reservation(name: "John Doe", airportDeparture: "Halifax - YHZ", airportArrival: "Toronto - YYZ", date: Calendar.current.date(from: DateComponents(year: 2012, month: 4, day: 12)) ?? Date(), cost: 338.85),
//        Reservation(name: "John Doe", airportDeparture: "Toronto - YYZ", airportArrival: "Quebec City - YQB", date: Calendar.current.date(from: DateComponents(year: 2011, month: 11, day: 2)) ?? Date(), cost: 220.15),
    ]
    var departureAirportList:[String] = ["Toronto - YYZ", "Winnipeg - YWG"]
    var arrivalAirportList:[String] = ["Vancouver - YVR", "Montreal - YUL"]
}
