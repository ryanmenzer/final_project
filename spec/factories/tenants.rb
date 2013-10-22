# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
   factory :tenant do |f|
    f.tenant_id               10	
    f.org_name                "Test Org"
   end
end

#   	@tenant = Tenant.create(org_name: "Hello Inc")
#     Tenant.set_current_tenant @tenant.id

#need to set to Tenant.set_current_tenant 10


  # attr_accessible :email,
  #                 :password,
  #                 :password_confirmation,
  #                 :remember_me,
  #                 :role_id
