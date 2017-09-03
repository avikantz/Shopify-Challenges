//
//  Address.swift
//  Shopify-Mobile
//
//  Created by Avikant Saini on 9/3/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import UIKit

class Address: NSObject {
	
	var first_name: String = ""
	var last_name: String = ""
	var name: String = ""
	
	var address1: String = ""
	var address2: String?
	var company: String?
	var phone: String = ""
	var city: String = ""
	var zip: String = ""
	var province: String = ""
	var country: String = ""
	
	var latitude: Float = 0.0
	var longitude: Float = 0.0
	
	var country_code: String = ""
	var province_code: String = ""
	
	init(dict: [String: AnyObject]) {
		
		first_name = dict["first_name"] as? String ?? ""
		last_name = dict["last_name"] as? String ?? ""
		name = dict["name"] as? String ?? ""
		
		address1 = dict["address1"] as? String ?? ""
		address2 = dict["address2"] as? String ?? ""
		company = dict["company"] as? String ?? ""
		phone = dict["phone"] as? String ?? ""
		city = dict["city"] as? String ?? ""
		zip = dict["zip"] as? String ?? ""
		province = dict["province"] as? String ?? ""
		country = dict["country"] as? String ?? ""
		
		latitude = Float(dict["latitude"] as? String ?? "") ?? 0
		longitude = Float(dict["longitude"] as? String ?? "") ?? 0
		
		country_code = dict["country_code"] as? String ?? ""
		province_code = dict["province_code"] as? String ?? ""
		
	}

}
