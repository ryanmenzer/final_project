class Transaction < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :transaction_type_id,
                  :sponsorship_id,
                  :payer_id,
                  :date,
                  :amount,
                  :status

  belongs_to :sponsorship
  belongs_to :transaction_type
  belongs_to :payer, class_name: "Person"

  

def paypal_url(return_url)
  values = {
    :business => 'seller@oliwi.org',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id
  }
  line_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => item.unit_price,
      "item_name_#{index+1}" => item.product.name,
      "item_number_#{index+1}" => item.id,
      "quantity_#{index+1}" => item.quantity
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end



end
