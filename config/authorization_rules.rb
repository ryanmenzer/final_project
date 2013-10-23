authorization do 
  role :administrator do 
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create]
  end

  role :worker do 
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create]
  end 

  role :guest do 
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create]
  end 

  role :user do 
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create]
  end 
end 

# Not for now, every role can access everything. we can later set level of access of each role by changing the codes above. 
