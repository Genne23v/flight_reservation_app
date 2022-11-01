//
//  ViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: DATA_MEMBER
//    var reservationList = [
//        Reservation(name: "John Doe", airportDeparture: "Toronto - YYZ", airportArrival: "Quebec City - YQB", date: Calendar.current.date(from: DateComponents(year: 2011, month: 11, day: 2)) ?? Date(), cost: 220.15),
//        Reservation(name: "John Doe", airportDeparture: "Halifax - YHZ", airportArrival: "Toronto - YYZ", date: Calendar.current.date(from: DateComponents(year: 2012, month: 4, day: 12)) ?? Date(), cost: 338.85),
//        Reservation(name: "John Doe", airportDeparture: "Toronto - YYZ", airportArrival: "Edmonton - YEG", date: Calendar.current.date(from: DateComponents(year: 2013, month: 7, day: 4)) ?? Date(), cost: 276.22),
//    ]
    var totalCost:Double = 0;
    
    //MARK: OUTLET
    @IBOutlet weak var reservationTableView: UITableView!
    @IBOutlet weak var totalCostLabel: UILabel!

    
    //MARK: TABLE_VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total number of reservation: \(Datasource.shared.reservationList.count)")
        return Datasource.shared.reservationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Building cells...")
        
        let cell = reservationTableView.dequeueReusableCell(withIdentifier: "myReservation", for: indexPath) as! ReservationTableViewCell
        
        //HANDLE NO RESERVATION - No reservation in user history
//        if cell == nil {
//            cell = UITableViewCell(
//                style: UITableViewCell.CellStyle.default, reuseIdentifier: "myReservation"
//                )
//        }
        
        let currReservation:Reservation = Datasource.shared.reservationList[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
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

