//
//  ViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: RESERVATION_DATA
    var reservationList = [
        Reservation(id: 1, name: "Jenny", airportDeparture: "Toronto - YYZ", airportArrival: "Frankfurt - FRK", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
        Reservation(id: 2, name: "Jenny", airportDeparture: "Toronto - YYZ", airportArrival: "Honululu - HNN", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
        Reservation(id: 3, name: "Jenny", airportDeparture: "Toronto - YYZ", airportArrival: "Los Angeles - LAX", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
        Reservation(id: 4, name: "Jenny", airportDeparture: "Toronto - YYZ", airportArrival: "Barcelona - BAR", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
    ]
    var totalCost:Double = 0;
    
    //MARK: OUTLET
    @IBOutlet weak var reservationTableView: UITableView!
    @IBOutlet weak var totalCostLabel: UILabel!

    
    //MARK: TABLE_VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total number of reservation: \(reservationList.count)")
        return reservationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Building cells...")
        
        let cell = reservationTableView.dequeueReusableCell(withIdentifier: "myReservation", for: indexPath) as! ReservationTableViewCell
        
//        if cell == nil {
//            cell = UITableViewCell(
//                style: UITableViewCell.CellStyle.default, reuseIdentifier: "myReservation"
//                )
//        }
        
        let currReservation:Reservation = reservationList[indexPath.row]
        let dateFormatter = DateFormatter()
        print("Departure: \(currReservation.airportDeparture), Arrival: \(currReservation.airportArrival), Name: \(currReservation.name), Date: \(dateFormatter.string(from: currReservation.date))" )
        cell.lblDeparture.text = currReservation.airportDeparture
        cell.lblArrival.text = currReservation.airportArrival
        cell.lblName.text = currReservation.name
        cell.lblDate.text = dateFormatter.string(from: currReservation.date)
        cell.lblCost.text = "$ " + String(format: "%.2f", currReservation.cost)
        totalCost += currReservation.cost
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reservationTableView.delegate = self
        reservationTableView.dataSource = self
        print("Loading app...")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        totalCostLabel.text = "$ " + String(format: "%.2f", totalCost)
    }
    
    //MARK: EVENT_HANDLER
    @IBAction func btnToMakeReservation(_ sender: Any) {
        guard let makeReservationScreen = storyboard?.instantiateViewController(identifier: "reservation") as? ReservationViewController else {
            print("Cannot find a screen with the id provided")
            return
        }
        show(makeReservationScreen, sender: self)
    }
}

