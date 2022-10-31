//
//  ReservationTableViewCell.swift
//  A2_Wonkeun
//
//  Created by Wonkeun No on 2022-10-30.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {
    
    //MARK: OUTLET
    @IBOutlet weak var lblDeparture: UILabel!
    @IBOutlet weak var lblArrival: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

