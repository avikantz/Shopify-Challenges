//
//  LineItem.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/3/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class LineItem: NSObject {

	var id: Int = 0
	var variant_id: Int = 0
	
	var name: String = ""
	var title: String = ""
	var variant_title: String = ""
	
	var quantity: Int = 0
	var fulfillable_quantity: Int = 0
	
	var price: Float = 0.0
	var total_discount: Float = 0.0
	
	var grams: Int = 0
	
	var sku: String = ""
	
	var vendor: String = ""
	var fulfillment_service: String = ""
	
	var product_id: Int = 0
	
	var requires_shipping: Bool = false
	var taxable: Bool = false
	var gift_card: Bool = false
	
	var variant_inventory_management: AnyObject?
	
	var properties: [AnyObject] = []
	
	var product_exists: Bool = true
	
	var fulfillment_status: AnyObject?
	
	var tax_lines: [AnyObject] = []
	
	init(dict: [String: AnyObject]) {
		
		id = (dict["id"] as! NSNumber).intValue
		variant_id = Int(dict["id"] as? String ?? "") ?? 0
		
		name = dict["name"] as? String ?? ""
		title = dict["title"] as? String ?? ""
		variant_title = dict["variant_title"] as? String ?? ""
		
		quantity = (dict["quantity"] as! NSNumber).intValue
		fulfillable_quantity = (dict["fulfillable_quantity"] as! NSNumber).intValue
		
		price = Float(dict["price"] as? String ?? "") ?? 0.0
		total_discount = (dict["total_discount"] as! NSNumber).floatValue
		
		grams = Int(dict["grams"] as? String ?? "") ?? 0
		
		sku = dict["sku"] as? String ?? ""
		
		vendor = dict["vendor"] as? String ?? ""
		fulfillment_service = dict["fulfillment_service"] as? String ?? ""
		
		product_id = Int(dict["product_id"] as? String ?? "") ?? 0
		
		requires_shipping = Bool(dict["requires_shipping"] as? String ?? "") ?? false
		taxable = Bool(dict["taxable"] as? String ?? "") ?? false
		gift_card = Bool(dict["gift_card"] as? String ?? "") ?? false
		
		variant_inventory_management = dict["variant_inventory_management"]
		
		properties = dict["properties"] as? [AnyObject] ?? []
		
		product_exists = Bool(dict["product_exists"] as? String ?? "") ?? false
		
		fulfillment_status = dict["fulfillment_status"]
		
		tax_lines = dict["tax_lines"] as? [AnyObject] ?? []
		
	}
	
}
