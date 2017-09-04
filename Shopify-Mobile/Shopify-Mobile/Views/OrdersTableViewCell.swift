//
//  OrdersTableViewCell.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/4/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
	
	@IBOutlet weak var orderIDLabel: UILabel!
	@IBOutlet weak var orderNumberLabel: UILabel!
	@IBOutlet weak var totalPriceLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var fullNameLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
