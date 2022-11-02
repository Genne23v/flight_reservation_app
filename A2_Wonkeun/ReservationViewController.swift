//
//  ReservationViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-30.
//

import UIKit

class ReservationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK: CLASS_VARIABLES
    let TORONTO = "Toronto - YYZ"
    let WINNIPEG = "Winnipeg - YWG"
    let VANCOUVER = "Vancouver - YVR"
    let MONTREAL = "Montreal - YUL"
    let TAX_RATE:Double = 0.13
    let COST_PER_KM:Double = 0.32
    var dateOfFlight:String = ""
    var departureAirport:String = ""
    var arrivalAirport:String = ""
    
    
    //MARK: PICKERVIEW_FUNCTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return Datasource.shared.departureAirportList.count
        } else {
            return Datasource.shared.arrivalAirportList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            departureAirport = Datasource.shared.departureAirportList[row]
            return departureAirport
        } else {
            arrivalAirport = Datasource.shared.arrivalAirportList[row]
            return arrivalAirport
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedIndex = departPortPicker.selectedRow(inComponent: 0)
        if selectedIndex == 0 {
            Datasource.shared.arrivalAirportList = [VANCOUVER, MONTREAL]
        } else {
            Datasource.shared.arrivalAirportList = [TORONTO]
        }
        arrivalPortPicker.reloadAllComponents()
    }

    
    //MARK: OUTLET
    @IBOutlet weak var guestName: UITextField!
    @IBOutlet weak var flightDatePicker: UIDatePicker!
    @IBOutlet weak var departPortPicker: UIPickerView!
    @IBOutlet weak var arrivalPortPicker: UIPickerView!
    @IBOutlet weak var nameErrorMessage: UILabel!
    @IBOutlet weak var dateErrorMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departPortPicker.delegate = self
        departPortPicker.dataSource = self
        arrivalPortPicker.delegate = self
        arrivalPortPicker.dataSource = self
        nameErrorMessage.text = ""
        dateErrorMessage.text = ""
    }
    
    
    //MARK: ACTIONS
    @IBAction func datePickerChanged(_ sender: Any) {
        dateErrorMessage.text = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        //Validate the departure date
        if flightDatePicker.date < Date() {
            dateErrorMessage.text = "Departure date cannot be older than current date"
        }
    }
    
    @IBAction func btnToCompleteReservation(_ sender: Any) {
        //Validate guest name
        nameErrorMessage.text = ""
        let guestName = self.guestName.text
        if guestName == "" {
            nameErrorMessage.text = "Guest name must be provided"
            return
        }
        
        //Calculate the cost of flight
        var cost:Double = 0
        if departureAirport == TORONTO  && arrivalAirport == VANCOUVER {
            cost = COST_PER_KM * 3361
        } else if departureAirport == TORONTO && arrivalAirport == MONTREAL {
            cost = COST_PER_KM * 503
        } else if departureAirport == WINNIPEG {
            cost = COST_PER_KM * 1513
        }
        cost *= (1 + TAX_RATE)
        
        //Create new reservation object and add it to datasource
        let newReservation = Reservation(name: guestName ?? "", airportDeparture: departureAirport, airportArrival: arrivalAirport, date: flightDatePicker.date, cost: cost)
        Datasource.shared.reservationList.insert(newReservation, at: 0)
        
        //Reservation complete message popup
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateOfFlight = dateFormatter.string(from: flightDatePicker.date)
        let popup = UIAlertController(title: "Thank you!", message: "Reservation has been made successfully.\n\n\(departureAirport) to \(arrivalAirport)\non \(dateOfFlight)\nPrice: $\(String(format: "%.2f", cost))", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "OK", style: .default)
        popup.addAction(closeAction)
        present(popup, animated: true, completion: nil)
                
        //Reset all values
        self.guestName.text = ""
        self.flightDatePicker.date = Date()
        Datasource.shared.departureAirportList = [TORONTO, WINNIPEG]
        Datasource.shared.arrivalAirportList = [VANCOUVER, MONTREAL]
        arrivalPortPicker.reloadAllComponents()
        self.departPortPicker.selectRow(0, inComponent: 0, animated: true)
        self.arrivalPortPicker.selectRow(0, inComponent: 0, animated: true)
    }
}
