//
//  ReservationViewController.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-30.
//

import UIKit

class ReservationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let departureAirportList = ["Toronto - YYZ", "Winnipeg - YWG"]
    let arrivalAirportList = ["Vancouver - YVR", "Montreal - YUL", "Toronto - YYZ"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return departureAirportList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departureAirportList.count
    }

    //MARK: OUTLET
    @IBOutlet weak var guestName: UITextField!
    @IBOutlet var flightDatePicker: UIView!
    @IBOutlet weak var departPortPicker: UIPickerView!
    @IBOutlet weak var arrivalPortPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btnToCompleteReservation(_ sender: Any) {
        
//        if let navigationController = self.window?.rootViewController as? UINavigationController {
//            self.navigationController?.popToRootViewController(animated: true)
//        }
    }
}
