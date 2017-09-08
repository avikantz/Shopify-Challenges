//
//  ItemCountViewController.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/5/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class ItemCountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	var orders: [Order] = []
	var itemName: String = ""
	var lineItems: [LineItem] = []
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var unitsLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.title = self.itemName
		
		tableView.register(UINib.init(nibName: "LineItemTableViewCell", bundle: nil), forCellReuseIdentifier: "lineItemCell")
		
		var count = 0
		for order in orders {
			for lineItem in order.line_items {
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
	
	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return lineItems.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "lineItemCell", for: indexPath) as! LineItemTableViewCell
		cell.lineItem = lineItems[indexPath.row]
		return cell
	}
	
	// MARK: - Table view delegate
	
	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 144
	}

}
