import requests
import sys
import types
import json

base_url = "https://backend-challenge-winter-2017.herokuapp.com/customers.json?page="

# Get all customer and validation data
page = 1

validations_fetched = False

validations = {}
customers = []
invalid_customers = []

while True:
	url = base_url + str(page)
	data = requests.get(url).json()

	if (validations_fetched == False):
		validations_array = data["validations"]
		for vobj in validations_array:
			for vkey in vobj:
				validations[vkey] = vobj[vkey]
		validations_fetched = True
	
	try:
		customers_dict = data["customers"]
		for cobj in customers_dict:
			customers.append(cobj)
		pagination = data["pagination"]
		current_page = int(pagination["current_page"])
		per_page = int(pagination["per_page"])
		total = int(pagination["total"])
		if (current_page * per_page >= total):
			# print("Reached the end")
			break
	except:
		print("Error occured, parsed " + str(len(customers)))
		break;
	
	page += 1

# print("Validators: ")
# print(json.dumps(validations, sort_keys=True, indent=4))
# print("----")

for c in customers:
	vcheck_failed = []
	# print("customer: ", c);
	for v in validations:
		# print("validating: ", v)
		optns = validations[v]
		# print("options: ", optns)
		t = c[v]
		if "required" in optns:
			req = optns["required"]
			if req == True and t is None:
				vcheck_failed.append(v)
		if "type" in optns:
			tp = optns["type"]
			if t is not None and tp == "number" and not type(t) is types.IntType:
				vcheck_failed.append(v)
			elif t is not None and tp == "boolean" and not type(t) is types.BooleanType:
				vcheck_failed.append(v)
			elif t is not None and tp == "string" and (type(t) is types.IntType or type(t) is types.BooleanType):
				vcheck_failed.append(v)
		if "length" in optns:
			minl = 0
			maxl = sys.maxint
			if "min" in optns["length"]:
				minl = optns["length"]["min"]
			if "max" in optns["length"]:
				maxl = options["length"]["max"]
			if t is None or len(t) < minl or len(t) > maxl:
				vcheck_failed.append(v)
	if (len(vcheck_failed) > 0):
		invalid_customers.append({"id": c["id"], "invalid_fields": vcheck_failed})

# pp = pprint.PrettyPrinter(indent=4)
# pp.pprint(invalid_customers)

res = {"invalid_customers": invalid_customers};

print(json.dumps(res, sort_keys=True, indent=4))
