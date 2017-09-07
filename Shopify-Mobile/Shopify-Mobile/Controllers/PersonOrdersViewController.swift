//
//  PersonOrdersViewController.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/4/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class PersonOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var orders: [Order] = []
	var personName: String = ""
	
	var personsOrders: [Order] = []
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var totalAmountLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.title = "\(personName)'s Orders"
		
		tableView.register(UINib.init(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "ordersCell")
		
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
	
    // MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return personsOrders.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ordersCell", for: indexPath) as! OrdersTableViewCell
		cell.order = personsOrders[indexPath.row]
		return cell
	}
	
	// MARK: - Table view delegate
	
	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 120
	}

}
