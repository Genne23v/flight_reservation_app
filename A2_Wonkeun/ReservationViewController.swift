//
//  ReservationViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-30.
//

import UIKit

class ReservationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK: DATA_SOURCE
    let TORONTO = "Toronto - YYZ"
    let WINNIPEG = "Winnipeg - YWG"
    let VANCOUVER = "Vancouver - YVR"
    let MONTREAL = "Montreal - YUL"
    var dateOfFlight:String = ""
    var departureAirport:String = ""
    var arrivalAirport:String = ""
    let TAX_RATE:Double = 0.13
    
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
            if departureAirport == TORONTO {
                Datasource.shared.arrivalAirportList = [MONTREAL, VANCOUVER]
            } else {
                Datasource.shared.arrivalAirportList = [TORONTO]
            }
            return departureAirport
        } else {
            arrivalAirport = Datasource.shared.arrivalAirportList[row]
            return arrivalAirport
        }
        
    }

    //MARK: OUTLET
    @IBOutlet weak var guestName: UITextField!
    @IBOutlet weak var flightDatePicker: UIDatePicker!
    @IBOutlet weak var departPortPicker: UIPickerView!
    @IBOutlet weak var arrivalPortPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departPortPicker.delegate = self
        departPortPicker.dataSource = self
        arrivalPortPicker.delegate = self
        arrivalPortPicker.dataSource = self
    }
    
    
    //MARK: ACTIONS
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        dateOfFlight = dateFormatter.string(from: flightDatePicker.date)
        print(dateOfFlight)
    }
    
    @IBAction func btnToCompleteReservation(_ sender: Any) {
        let guestName = self.guestName.text
        let selectedIndex = self.departPortPicker.selectedRow(inComponent: 0)
        
        //Calculate the cost 0.32 per km. 13% tax
        let newReservation = Reservation(name: guestName ?? "", airportDeparture: departureAirport, airportArrival: arrivalAirport, date: Date(), cost: 110)
        //Add it to static object list
        
//        if let navigationController = self.window?.rootViewController as? UINavigationController {
//            self.navigationController?.popToRootViewController(animated: true)
//        }
        
        print("\(String(describing: guestName)), \(selectedIndex), ")
    }
}
