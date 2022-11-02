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
    @IBOutlet weak var noReservationMessage: UILabel!
    
    
    //MARK: TABLE_VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datasource.shared.reservationList.count
    }
    
    
    //MARK: TABLEVIEW_FUNCTIONS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Building cells... total cost: \(totalCost)")
        
        let cell = reservationTableView.dequeueReusableCell(withIdentifier: "myReservation", for: indexPath) as! ReservationTableViewCell
        
        let currReservation:Reservation = Datasource.shared.reservationList[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        //Build each table cell
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
        
        //Update back button text
        let backBtn = UIBarButtonItem()
        backBtn.title = "Cancel"
        navigationItem.backBarButtonItem = backBtn
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Show error message if there is no reservation
        if Datasource.shared.reservationList.count == 0 {
            noReservationMessage.text = "You have no travel history yet"
        } else {
            noReservationMessage.text = ""
        }

        //Refresh the total cost and update
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

