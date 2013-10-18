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
# Category.destroy_all
# Role.destroy_all
# Tenant.destroy_all
# User.destroy_all



Category.create(name: "Employee")
Category.create(name: "Contact")
Category.create(name: "User")

Role.create(name: "Administrator")
Role.create(name: "Worker")
Role.create(name: "User")
Role.create(name: "Guest")

# # Setup five different tenants

5.times do
  tenant = Tenant.new(org_name: Faker::Company.name)
  tenant.save
end

5.times do |index|
  tenant = Tenant.all[index]
  Tenant.set_current_tenant tenant.id

  User.create(email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password",
              category_id: 1,
              role_id: 1,
              full_name: Faker::Name.name,
              gender: ["male", "female"].sample)
end

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id

  rand(50..200).times do
    User.create(email: Faker::Internet.email,
            password: "password",
            password_confirmation: "password",
            category_id: 2,
            role_id: 3,
            full_name: Faker::Name.name,
            gender: ["male", "female"].sample)
  end


end



