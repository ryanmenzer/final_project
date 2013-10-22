FactoryGirl.define do
    factory :user do |f|
    f.email                 "mbrown@example.com"
    f.password              "test"
    f.password_confirmation "test"
    f.tenant_id             10
    f.role_id               3
    end
end



  # attr_accessible :email,
  #                 :password,
  #                 :password_confirmation,
  #                 :remember_me,
  #                 :role_id
