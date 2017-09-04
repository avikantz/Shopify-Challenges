//
//  MainTableViewController.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/4/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
	
	@IBOutlet weak var personNameField: UITextField!
	@IBOutlet weak var itemNameField: UITextField!
	
	var isFetched: Bool = false
	
	var orders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
		
		self.title = "Loading..."
		
		let url = URL(string: "https://shopicruit.myshopify.com/admin/orders.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")!
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if (error == nil) {
				do {
					let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
					if let ordersDict = json["orders"] as? [[String: AnyObject]] {
						for orderDict in ordersDict {
							let o = Order(dict: orderDict)
							self.orders.append(o)
						}
						self.isFetched = true
						DispatchQueue.main.async {
							self.title = "Mobile"
							self.tableView.reloadData()
						}
					}
				} catch {
					print("Failed to decode");
				}
			}
		}
		task.resume()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Scroll view delegate
	
	override func scrollViewDidScroll(_ scrollView: UIScrollView) {
		self.resignFirstResponder()
	}

    // MARK: - Table view delegate
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if (!self.isFetched) {
			let alertController = UIAlertController(title: "Waits", message: "Data is being loaded :p", preferredStyle: .alert)
			let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
			alertController.addAction(cancelAction)
			self.present(alertController, animated: true, completion: nil)
			return
		}
		if (indexPath.section == 0) {
			// Orders for person
			if let personName = personNameField.text {
				// Present controller
				if let povc = storyboard?.instantiateViewController(withIdentifier: "PersonOrdersVC") as? PersonOrdersViewController {
					povc.orders = self.orders
					povc.personName = personName
					self.navigationController?.pushViewController(povc, animated: true)
				}
			}
		} else if (indexPath.section == 1) {
			// Number of items sold
			if let itemName = itemNameField.text {
				// Present controller
			}
		}
	}

	override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		return (indexPath.row == 1)
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 44
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
