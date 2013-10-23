# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do |f|
    f.full_name   "Beep Anders"
    f.gender      "Male"
    f.nationality      "Beepish"
    f.phone_number     "212-222-2212"
    f.date_of_birth       "05-05-2000"
    user
    category

    factory :person_no_cid do
      category nil
    end
  end
end

      # t.integer :tenant_id
      # t.integer :user_id
      # t.integer :category_id, null: false
      # t.string  :full_name
      # t.string  :first_name
      # t.string  :last_name
      # t.string  :gender
      # t.string  :nationality
      # t.string  :phone_number
      # t.date    :date_of_birth