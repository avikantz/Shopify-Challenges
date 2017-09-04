//
//  PersonOrdersViewController.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/4/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class PersonOrdersViewController: UIViewController {
	
	var orders: [Order] = []
	var personName: String = ""
	
	var personsOrders: [Order] = []
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var totalAmountLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.title = "\(personName)'s Orders"
		
		let words = self.personName.components(separatedBy: " ")
		let firstName = words.first!
		let lastName = words.last!
		
		for order in orders {
			if (order.customer?.first_name.compare(firstName) == .orderedSame && order.customer?.last_name.compare(lastName) == .orderedSame) {
				personsOrders.append(order)
			}
		}
		
//		print(personsOrders)
		
		var total: Float = 0.0
		for order in personsOrders {
			total += order.total_price
		}
		self.totalAmountLabel.text = String.init(format: "CAD %.2f", total)
		
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
