import csv
import time

# eh, whatever. Global
all_rarity = {}
all_values = {}

def split_string(input_string):
    return [s.strip() for s in input_string.split(",")]

def companies_read(company_file):
    companies = {}
    with open(company_file, "r") as f:
        csv_reader = csv.reader(f, delimiter=',')
        next(csv_reader, None) 
        for row in csv_reader:
            name = row[0]
            industry = split_string(row[1])
            companies[name] = industry
    return companies

def inorganics_read(inorganics_file):
    inorganics = {}
    with open(inorganics_file, "r") as f:
        csv_reader = csv.reader(f, delimiter=',')
        next(csv_reader, None) 
        for row in csv_reader:
            name = row[0]
            rarity = row[2]
            value = row[6]
            industry = split_string(row[8])
            inorganics[name] = industry
            all_rarity[name] = rarity
            all_values[name] = int(value)
    return inorganics

def organics_read(organics_file):
    organics = {}
    with open(organics_file, "r") as f:
        csv_reader = csv.reader(f, delimiter=',')
        next(csv_reader, None) 
        for row in csv_reader:
            name = row[0]
            rarity = row[2]
            value = row[6]
            industry = split_string(row[8])
            organics[name] = industry
            all_rarity[name] = rarity
            all_values[name] = int(value)
    return organics

def manufacturing_read(manufacturing_file):
    manufacturing = {}
    with open(manufacturing_file, "r") as f:
        csv_reader = csv.reader(f, delimiter=',')
        next(csv_reader, None) 
        for row in csv_reader:
            name = row[0]
            rarity = row[2]
            value = row[6]
            industry = split_string(row[8])
            manufacturing[name] = industry
            all_rarity[name] = rarity
            all_values[name] = int(value)
    return manufacturing

def reconciler(companies, organics, inorganics, manufacturing):
    rfp_list = []
    all_resources = organics | inorganics | manufacturing
    for resource, resource_industry in all_resources.items():
        for company, company_industry in companies.items():
            industry_match = set(resource_industry).intersection(set(company_industry))
            if industry_match:
                industry_match = list(industry_match)
                rfp_list.append([company, resource, all_rarity[resource], industry_match[0]])
                #if len(industry_match) > 1:
                    #print(company, resource, industry_match)
    return rfp_list

def get_quantity(order, rarity):
    tier_quantities = {
        1:100,
        2:500,
        3:1000,
        4:2500,
        5:5000
        }
    rarity_mult = {
        "Common":1,
        "Uncommon":0.75,
        "Rare":0.5,
        "Exotic":0.25,
        "Unique":0.1
        }
    quantity = tier_quantities[order] * rarity_mult[rarity]
    return quantity

def get_tcv(value, quantity):
    return value * quantity

def get_deadline(order_tier, rarity):
    std_deadline = 168

    tier_mult = {
        1:1,
        2:1,
        3:1.2,
        4:1.5,
        5:2
    }

    rarity_mult = {
        "Common":.75,
        "Uncommon":1,
        "Rare":1.25,
        "Exotic":1.75,
        "Unique":2.5
        }
    deadline = std_deadline * tier_mult[order_tier] * rarity_mult[rarity]
    return deadline

def update_values(rfp_file):
    rfp_raw_values = []
    with open(rfp_file, 'r') as f:
        csv_reader = csv.reader(f, delimiter=',')
        for rfp in csv_reader:
            name = rfp[1]
            value = all_values[name]
            order_tier = int(rfp[4])
            rarity = rfp[2]
            quant = get_quantity(order_tier, rarity)
            tcv = get_tcv(value, quant)
            deadline = get_deadline(order_tier, rarity)
            #print(f"Name {name} value {value} tcv {tcv}")
            #time.sleep(10)
            rfp.append(value)
            rfp.append(quant)
            rfp.append(tcv)
            rfp.append(deadline)
            rfp_raw_values.append(rfp)
    write_csv(rfp_raw_values)


def write_csv(data):
    with open("rfp.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerows(data)

def main():
    companies = companies_read("companies.csv")
    organics = organics_read("organic.csv")
    inorganics = inorganics_read("inorganic.csv")
    manufactured = manufacturing_read("manufactured.csv")
    #rfp = reconciler(companies, organics, inorganics, manufactured)
    update_values("rfp_raw.csv")

main()


    