//
//  ViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var reservationList = [
        Reservation(id: 1, name: "Jenny", airportDeparture: "YYZ", airportArrival: "FRK", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
        Reservation(id: 2, name: "Jenny", airportDeparture: "YYZ", airportArrival: "HNN", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
        Reservation(id: 3, name: "Jenny", airportDeparture: "YYZ", airportArrival: "LAX", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
        Reservation(id: 4, name: "Jenny", airportDeparture: "YYZ", airportArrival: "BAR", date: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 2)) ?? Date(), cost: 420.15),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = reservationsTableView.dequeueReusableCell(withIdentifier: "myReservation")
        
        if cell == nil {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default, reuseIdentifier: "myReservation"
                )
        }
        
        reservationList[indexPath.row]
        
        return cell!
    }
    
    
    //MARK: OUTLET
    @IBOutlet weak var reservationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reservationsTableView.delegate = self
        self.reservationsTableView.dataSource = self
    }
}

