//
//  ViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: DATA_MEMBER
    var totalCost:Double = 0.0
    
    
    //MARK: OUTLET
    @IBOutlet weak var reservationTableView: UITableView!
    @IBOutlet weak var totalCostLabel: UILabel!

    
    //MARK: TABLE_VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total number of reservation: \(Datasource.shared.reservationList.count)")
        return Datasource.shared.reservationList.count
    }
    
    
    //MARK: TABLEVIEW_FUNCTIONS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Building cells... total cost: \(totalCost)")
        
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
        print("ID: \(currReservation.id), Departure: \(currReservation.airportDeparture), Arrival: \(currReservation.airportArrival), Name: \(currReservation.name), Date: \(dateFormatter.string(from: currReservation.date))" )
        cell.lblDeparture.text = currReservation.airportDeparture
        cell.lblArrival.text = currReservation.airportArrival
        cell.lblName.text = currReservation.name
        cell.lblDate.text = dateFormatter.string(from: currReservation.date)
        cell.lblCost.text = "$ " + String(format: "%.2f", currReservation.cost)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //MARK: VIEW_LIFECYCLE_HANDLERS
    override func viewDidLoad() {
        super.viewDidLoad()
        reservationTableView.delegate = self
        reservationTableView.dataSource = self
        print("Loading app...")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        totalCost = 0
        for each in Datasource.shared.reservationList {
            totalCost += each.cost
        }
        self.reservationTableView.reloadData()
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

