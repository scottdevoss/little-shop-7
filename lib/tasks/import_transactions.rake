namespace :csv_load do
  desc "TODO"
  task transactions: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join('db', 'data', 'transactions.csv'))
    csv = CSV.parse(csv_text, headers:true, encoding: "ISO-8859-1")
    csv.each do |row|
      transaction = Transaction.new
      transaction.credit_card_number = row['Credit_card_number']
      transaction.credit_card_expiration_date = row['Credit_card_expiration_date']
      transaction.result = row['result']
      transaction.created_at = row['created_at']
      transaction.updated_at = row['updated_at']
      transaction.invoice_id = row['invoice_id']
      transaction.save
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('transactions')
  end
  puts "transactions seeded"
end