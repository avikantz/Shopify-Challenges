//
//  Customer.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/3/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class Customer: NSObject {
	
	var id: Int = 0
	
	var first_name: String = ""
	var last_name: String = ""
	
	var email: String = ""
	
	var accepts_marketing: Bool = false
	
	var created_at: Date?
	var updated_at: Date?
	
	var orders_count: Int = 0
	
	var state: String = "disabled"

	var total_spent: Float = 0.0
	
	var last_order_id: Int = 0
	var last_order_name: String = "#"
	
	var note: String?
	
	var verified_email: Bool = false
	
	var multipass_identifier: String?
	
	var tax_exempt: Bool = false
	
	var phone: String?
	
	var tags: String = ""
	
	var default_address: Address?
	
	init(dict: [String: AnyObject]) {
		
		id = Int(dict["id"] as? String ?? "") ?? 0
		
		first_name = dict["first_name"] as? String ?? ""
		last_name = dict["last_name"] as? String ?? ""
		
		email = dict["email"] as? String ?? ""
		
		accepts_marketing = Bool(dict["accepts_marketing"] as? String ?? "") ?? false
		
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd'T'hh:MM:sszzz"
		
		created_at = formatter.date(from: (dict["created_at"] as? String ?? ""))
		updated_at = formatter.date(from: (dict["updated_at"] as? String ?? ""))
		
		orders_count = Int(dict["orders_count"] as? String ?? "") ?? 0
		
		state = dict["state"] as? String ?? ""
		
		total_spent = Float(dict["total_spent"] as? String ?? "") ?? 0
		
		last_order_id = Int(dict["last_order_id"] as? String ?? "") ?? 0
		last_order_name = dict["last_order_name"] as? String ?? ""
		
		note = dict["note"] as? String ?? ""
		
		verified_email = Bool(dict["verified_email"] as? String ?? "") ?? false
		
		multipass_identifier = dict["multipass_identifier"] as? String
		
		tax_exempt = Bool(dict["tax_exempt"] as? String ?? "") ?? false
		
		phone = dict["phone"] as? String ?? ""
		
		tags = dict["tags"] as? String ?? ""
		
		default_address = Address(dict: (dict["default_address"] as? [String: AnyObject] ?? [:]))
		
	}

}
