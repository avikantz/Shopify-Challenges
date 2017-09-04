//
//  Order.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/3/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class Order: NSObject {

	var id: String = ""
	var email: String = ""
	
	var closed_at: Date?
	var created_at: Date?
	var updated_at: Date?
	
	var number: String = ""
	var note: String = ""
	
	var token: String = ""
	var gateway: String = ""
	
	var test: Bool = false
	
	var total_price: Float = 0.0
	var subtotal_price: Float = 0.0
	
	var total_weight: Float = 0.0
	
	var total_tax: Float = 0.0
	var taxes_included: Bool = false
	
	var currency: String = "CAD"
	
	var financial_status: String = ""
	
	var confirmed: Bool = false
	
	var total_discounts: Float = 0.0
	var total_line_items_price: Float = 0.0
	
	var cart_token: String?
	
	var buyer_accepts_marketing: Bool = false
	
	var name: String = "#"
	
	var referring_site: String?
	var landing_site: String?
	
	var cancelled_at: Date?
	var cancel_reason: String?
	
	var total_price_usd: Float = 0
	
	var reference: String?
	
	var user_id: String = ""
	
	var location_id: String?
	var source_identifier: String?
	var source_url: String?
	
	var processed_at: Date?
	
	var device_id: String?
	
	var phone: String?
	var customer_locale: String?
	
	var app_id: Int = 0
	
	var browser_ip: String?
	var landing_site_ref: String?
	
	var order_number: Int = 0
	
	var discount_codes: [AnyObject] = []
	var note_attributes: [AnyObject] = []
	
	var payment_gateway_names: [String] = []
	
	var processing_method: String = ""
	
	var checkout_id: String?
	var checkout_token: String?
	
	var source_name: String = ""
	
	var fulfillment_status: String?
	
	var tax_lines: [AnyObject] = []
	
	var tags: String = ""
	
	var contact_email: String = ""
	
	var order_status_url: String?
	
	var line_items: [LineItem] = []
	
	var shipping_lines: [AnyObject] = []
	
	var billing_address: Address?
	var shipping_address: Address?
	
	var fulfillments: [AnyObject] = []
	var refunds: [AnyObject] = []
	
	var customer: Customer?
	
	init(dict: [String: AnyObject]) {
		
		id = "\(dict["id"]!)"
		name = dict["name"] as? String ?? ""
		
		email = dict["email"] as? String ?? ""
		
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd'T'hh:MM:sszzz"
		
		closed_at = formatter.date(from: (dict["closed_at"] as? String ?? ""))
		created_at = formatter.date(from: (dict["created_at"] as? String ?? ""))
		updated_at = formatter.date(from: (dict["updated_at"] as? String ?? ""))
		cancelled_at = formatter.date(from: (dict["cancelled_at"] as? String ?? ""))
		processed_at = formatter.date(from: (dict["processed_at"] as? String ?? ""))
		
		number = "\(dict["number"]!)"
		
		note = dict["note"] as? String ?? ""
		
		token = dict["token"] as? String ?? ""
		gateway = dict["gateway"] as? String ?? ""
		
		test = Bool(dict["test"] as? String ?? "") ?? false
		
		total_price = (dict["total_price"] as! NSNumber).floatValue
		subtotal_price = (dict["subtotal_price"] as! NSNumber).floatValue
		
		total_weight = (dict["total_weight"] as! NSNumber).floatValue
		
		total_tax = (dict["total_tax"] as! NSNumber).floatValue
		taxes_included = Bool(dict["taxes_included"] as? String ?? "") ?? false
		
		currency = dict["currency"] as? String ?? ""
		
		financial_status = dict["financial_status"] as? String ?? ""
		
		confirmed = Bool(dict["confirmed"] as? String ?? "") ?? false
		
		total_discounts = (dict["total_discounts"] as! NSNumber).floatValue
		total_line_items_price = (dict["total_line_items_price"] as! NSNumber).floatValue
		
		cart_token = dict["cart_token"] as? String ?? ""
		
		buyer_accepts_marketing = Bool(dict["buyer_accepts_marketing"] as? String ?? "") ?? false
		
		name = dict["name"] as? String ?? ""
		
		referring_site = dict["referring_site"] as? String ?? ""
		landing_site = dict["landing_site"] as? String ?? ""
		
		cancel_reason = dict["cancel_reason"] as? String ?? ""
		
		total_price_usd = (dict["total_price_usd"] as! NSNumber).floatValue
		
		checkout_token = dict["checkout_token"] as? String ?? ""
		checkout_id = dict["checkout_id"] as? String ?? ""
		
		reference = dict["reference"] as? String ?? ""
		
		user_id = dict["user_id"] as? String ?? ""
		location_id = dict["location_id"] as? String ?? ""
		
		source_identifier = dict["source_identifier"] as? String ?? ""
		source_name = dict["source_name"] as? String ?? ""
		source_url = dict["source_url"] as? String ?? ""
		
		device_id = dict["device_id"] as? String ?? ""
		phone = dict["phone"] as? String ?? ""
		customer_locale = dict["customer_locale"] as? String ?? ""
		
		app_id = (dict["app_id"] as! NSNumber).intValue
		
		browser_ip = dict["browser_ip"] as? String ?? ""
		landing_site_ref = dict["landing_site_ref"] as? String ?? ""
		order_number = (dict["order_number"] as! NSNumber).intValue
		
		discount_codes = dict["discount_codes"] as? [AnyObject] ?? []
		note_attributes = dict["note_attributes"] as? [AnyObject] ?? []
		
		payment_gateway_names = dict["payment_gateway_names"] as? [String] ?? []
		
		processing_method = dict["processing_method"] as? String ?? ""
		
		fulfillment_status = dict["fulfillment_status"] as? String ?? ""
		
		tax_lines = dict["tax_lines"] as? [AnyObject] ?? []
		
		contact_email = dict["contact_email"] as? String ?? ""
		
		order_status_url = dict["order_status_url"] as? String ?? ""
		
		if let line_itemsx = dict["line_items"] as? [[String: AnyObject]] {
			line_items = []
			for dict in line_itemsx {
				line_items.append(LineItem(dict: dict))
			}
		}
		
		shipping_lines = dict["shipping_lines"] as? [AnyObject] ?? []
		
		billing_address = Address(dict: (dict["billing_address"] as? [String: AnyObject] ?? [:]))
		
		shipping_address = Address(dict: (dict["shipping_address"] as? [String: AnyObject] ?? [:]))
		
		fulfillments = dict["fulfillments"] as? [AnyObject] ?? []
		
		refunds = dict["refunds"] as? [AnyObject] ?? []
		
		customer = Customer(dict: (dict["customer"] as? [String: AnyObject] ?? [:]))
		
	}
	
}
