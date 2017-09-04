//
//  ItemCountViewController.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/5/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class ItemCountViewController: UIViewController {
	
	var orders: [Order] = []
	var itemName: String = ""
	var lineItems: [LineItem] = []
	
	@IBOutlet weak var unitsLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.title = self.itemName
		
		var count = 0
		for order in orders {
			for lineItem in order.line_items {
				print(lineItem.title)
				if (lineItem.title.compare(itemName) == .orderedSame) {
					count += lineItem.quantity
					lineItems.append(lineItem)
				}
			}
		}
		unitsLabel.text = "\(count) units"
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
