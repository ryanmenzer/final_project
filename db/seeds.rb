# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# WARNING! Comment out to not delete all records.
#

Category.destroy_all
Role.destroy_all
Tenant.destroy_all
User.destroy_all



# Category.create(name: "Worker")
# Category.create(name: "Sponsor")
# Category.create(name: "User")

# Role.create(name: "Administrator")
# Role.create(name: "Worker")
# Role.create(name: "User")
# Role.create(name: "Guest")

# 5.times do
#   User.create(email: Faker::Internet.email,
#               category_id: 1,
#               role_id: 1,
#               full_name: Faker::Name.name,
#               gender: ["male", "female"].sample)
# end


5.times do
  tenant = Tenant.new(org_name: Faker::Company.name)
  user = User.new(email: Faker::Internet.email,
                     password: "password",
                     password_confirmation: "password",
                     category_id: 1,
                     role_id: 1,
                     full_name: Faker::Name.name,
                     gender: ["male", "female"].sample)
  tenant.primary_contact_id = user.id
  tenant.save
end
