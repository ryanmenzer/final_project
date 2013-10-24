authorization do
  role :administrator do
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users, :mandrill_settings, :paypal_settings], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create, :paypal_checkout, :editroleform, :editrole, :oliwi, :home]
  end

  role :worker do
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create, :paypal_checkout, :editroleform, :editrole, :oliwi, :home]
  end

  role :guest do
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create, :paypal_checkout, :editroleform, :editrole, :oliwi, :home]
  end

  role :user do
    has_permission_on [:emailresponses, :groups, :homes, :images, :initiatives, :locales, :paypal_payments, :people, :receivers, :settings, :sponsorships, :stories, :transactions, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :addperson, :addgroup, :removeperson, :confirm_payment, :search, :paypal_create, :paypal_checkout, :editroleform, :editrole, :oliwi, :home]
  end
end
