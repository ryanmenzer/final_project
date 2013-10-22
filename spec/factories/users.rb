# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
   factory :user do |f|
    f.email                 "mbrown@example.com"
    f.password              "testtesttest"
    f.password_confirmation "testtesttest"
   end
end

