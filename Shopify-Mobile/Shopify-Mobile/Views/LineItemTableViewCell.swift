//
//  LineItemTableViewCell.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/7/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class LineItemTableViewCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var quantityLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var vendorLabel: UILabel!
	@IBOutlet weak var variantTitleLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	
	var lineItem: LineItem? {
		didSet {
			titleLabel.text = lineItem?.title
			quantityLabel.text = "\(lineItem?.quantity ?? 0)"
			priceLabel.text = "\(lineItem?.price ?? 0)"
			vendorLabel.text = lineItem?.vendor
			variantTitleLabel.text = lineItem?.variant_title
			idLabel.text = "\(lineItem?.id ?? 0) / \(lineItem?.variant_id ?? 0)"
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
