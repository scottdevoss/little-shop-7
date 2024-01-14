def load_test_data
  @merchant1 = Merchant.create!(name: "Hannah's Handbags")
  @merchant2 = Merchant.create!(name: "Arnold's Armoire")
  @merchant3 = Merchant.create!(name: "Schroeder-Jerde")
  @merchant4 = Merchant.create!(name: "Klein, Rempel and Jones")
  @merchant5 = Merchant.create!(name: "Pollich and Sons")
  @merchant6 = Merchant.create!(name: "Bosco, Howe and Davis")
  @merchant7 = Merchant.create!(name: "Kiehn Group")
  @merchant8 = Merchant.create!(name: "Smitham LLC")
  @merchant9 = Merchant.create!(name: "Gibson Group")

  @item1 = Item.create!({
    name: "Item Qui Esse",
    description:
    "Nihil autem sit odio inventore deleniti.",
    unit_price: 75107,
    merchant_id: @merchant1.id
  })
  @item2 = Item.create!({
    name: "Item Autem Minima",
    description:
    "Cumque consequuntur ad.",
    unit_price: 67076,
    merchant_id: @merchant1.id
  })
  @item3 = Item.create!({
    name: "Item Ea Voluptatum",
    description:
    "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
    unit_price: 32301,
    merchant_id: @merchant2.id
  })
  @item4 = Item.create!({
    name: "Item Nemo Facere",
    description: "Sunt eum id eius magni consequuntur delectus veritatis.",
    unit_price: 4291,
    merchant_id: @merchant3.id
  })

  @item5 = Item.create!(name: "Gold Ring", unit_price: 1200, merchant_id: @merchant4.id, description: "14k Gold")
  @item6 = Item.create!(name: "Silver Ring", unit_price: 900, merchant_id: @merchant5.id, description: "Pure Silver")
  @item7 = Item.create!(name: "Gold Necklace", unit_price: 1400, merchant_id: @merchant6.id, description: "10k Gold")
  @item8 = Item.create!(name: "Silver Necklace", unit_price: 1000, merchant_id: @merchant7.id, description: "Pure Silver")
  @item9 = Item.create!(name: "Hair Clip", unit_price: 25, merchant_id: @merchant8.id, description: "Black Plastic")
  @item10 = Item.create!(name: "Hoop Earrings", unit_price: 125, merchant_id: @merchant9.id, description: "Bronze")
  @item11 = Item.create!(name: "Platinum Bracelet", unit_price: 800, merchant_id: @merchant9.id, description: "Platinum")
  @item12 = Item.create!(name: "Custom Watch", unit_price: 310, merchant_id: @merchant4.id, description: "Silver")

  @customer1 = Customer.create!(first_name: "John", last_name: "Jacobs")
  @customer2 = Customer.create!(first_name: "Susan", last_name: "Robinson")
  @customer3 = Customer.create!(first_name: "Jessica", last_name: "Simpson")
  @customer4 = Customer.create!(first_name: "Harry", last_name: "Potter")
  @customer5 = Customer.create!(first_name: "Ron", last_name: "Weasley")
  @customer6 = Customer.create!(first_namse: "Nicole", last_name: "Johnson")

  @invoice1 = Invoice.create!(status: 2, customer_id: @customer1.id)
  @invoice2 = Invoice.create!(status: 2, customer_id: @customer2.id)
  @invoice3 = Invoice.create!(status: 2, customer_id: @customer3.id)
  @invoice4 = Invoice.create!(status: 2, customer_id: @customer4.id)
  @invoice5 = Invoice.create!(status: 2, customer_id: @customer5.id)
  @invoice6 = Invoice.create!(status: 2, customer_id: @customer6.id)
  @invoice7 = Invoice.create!(status: 2, customer_id: @customer6.id)
  @invoice8 = Invoice.create!(status: 2, customer_id: @customer2.id)
  @invoice9 = Invoice.create!(status: 2, customer_id: @customer2.id,)
  @invoice10 = Invoice.create!(status: 2, customer_id: @customer3.id)
  @invoice10 = Invoice.create!(status: 2, customer_id: @customer4.id)
  @invoice10 = Invoice.create!(status: 2, customer_id: @customer3.id)

  @invoice_item1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 3, unit_price: 111, status: 1) 
  @invoice_item2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 12, unit_price: 345, status: 1) 
  @invoice_item3 = InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 8, unit_price: 420, status: 1) 
  @invoice_item4 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 7, unit_price: 345, status: 1) 
  @invoice_item5 = InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice5.id, quantity: 8, unit_price: 420, status: 1) 
  @invoice_item6 = InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice6.id, quantity: 9, unit_price: 345, status: 1) 
  @invoice_item7 = InvoiceItem.create!(item_id: @item6.id, invoice_id: @invoice7.id, quantity: 2, unit_price: 711, status: 1)
  @invoice_item8 = InvoiceItem.create!(item_id: @item8.id, invoice_id: @invoice8.id, quantity: 3, unit_price: 711, status: 1)
  @invoice_item9 = InvoiceItem.create!(item_id: @item10.id, invoice_id: @invoice9.id, quantity: 5, unit_price: 345, status: 1)
  @invoice_item10 = InvoiceItem.create!(item_id: @item8.id, invoice_id: @invoice10.id, quantity: 15, unit_price: 126, status: 1)
  @invoice_item11 = InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice2.id, quantity: 13, unit_price: 123, status: 1)
  @invoice_item12 = InvoiceItem.create!(item_id: @item7.id, invoice_id: @invoice8.id, quantity: 8, unit_price: 345, status: 1)
  @invoice_item13 = InvoiceItem.create!(item_id: @item11.id, invoice_id: @invoice4.id, quantity: 10, unit_price: 425, status: 1)
  @invoice_item14 = InvoiceItem.create!(item_id: @item12.id, invoice_id: @invoice6.id, quantity: 8, unit_price: 323, status: 1)
  @invoice_item15 = InvoiceItem.create!(item_id: @item10.id, invoice_id: @invoice10.id, quantity: 6, unit_price: 595, status: 1)
  @invoice_item16 = InvoiceItem.create!(item_id: @item7.id, invoice_id: @invoice10.id, quantity: 9, unit_price: 376, status: 1)

  @transaction1 = Transaction.create!(invoice_id: @invoice1.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction2 = Transaction.create!(invoice_id: @invoice2.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction3 = Transaction.create!(invoice_id: @invoice3.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction4 = Transaction.create!(invoice_id: @invoice4.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction5 = Transaction.create!(invoice_id: @invoice5.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction6 = Transaction.create!(invoice_id: @invoice6.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction7 = Transaction.create!(invoice_id: @invoice7.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction8 = Transaction.create!(invoice_id: @invoice8.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction9 = Transaction.create!(invoice_id: @invoice9.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
  @transaction10 = Transaction.create!(invoice_id: @invoice10.id, credit_card_number: "1234567812345678", credit_card_expiration_date: "10/26", result: 0)
end