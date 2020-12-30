require './Item'

bill_price_payable = 0
savings = 0
items = Array.new
items_hash = Hash.new(0)

# Initializing Price Table
price_table = {
  'milk' => Item.new("milk", 3.97, { 2 => 5 }),
  'bread' => Item.new("bread", 2.17, { 3 => 6 }),
  'banana' => Item.new("banana", 0.99, { 0 => 0 }),
  'apple' => Item.new("apple", 0.89, { 0 => 0 })
}

# Accepting user input and splitting items by a comma
puts "Please enter all the items purchased separated by a comma:"
item_list = gets

items = item_list.split(",")

# Stripping white-space and normalizing case
items.each { |item|
  item = item.strip.downcase
  items_hash[item] = items_hash[item] + 1
}

puts "Item\t\tQuantity\t\tPrice"
puts "---------------------------------------------------------"

# Calculating payable bill amount and savings
items_hash.each { |key, value|
  if price_table[key].sale_price.keys[0] != 0
    sale_quantity = value / price_table[key].sale_price.keys[0]
    non_sale_quantity = value % price_table[key].sale_price.keys[0]
    sale_price = sale_quantity * price_table[key].sale_price.values[0]
    non_sale_price = non_sale_quantity * price_table[key].item_price
    bill_item_price = sale_price + non_sale_price
    savings += (value * price_table[key].item_price - bill_item_price)

  else
    bill_item_price = value * price_table[key].item_price
  end

  puts "#{price_table[key].item_name} \t\t #{value} \t\t #{bill_item_price}"
  bill_price_payable += bill_item_price
}

# Printing final bill amount and savings
puts "Total price :  #{bill_price_payable.round(2)}"
puts "You saved #{savings.round(2)} today."

