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

puts "Adding categories..."

Category.create(name: "Staff")
Category.create(name: "Recipient")
Category.create(name: "Supporter")

puts "Adding roles..."

Role.create(name: "Administrator")
Role.create(name: "Worker")
Role.create(name: "User")
Role.create(name: "Guest")

## Setup five different tenants

puts "Setting up 5 test tenants"

5.times do
  tenant = Tenant.new(org_name: Faker::Company.name)
  tenant.save
end

puts "Setting up 5 test admins"

5.times do |index|
  tenant = Tenant.all[index]
  Tenant.set_current_tenant tenant.id

  u = User.new(email: Faker::Internet.email,
               password: "password",
               password_confirmation: "password",
               category_id: 1,
               role_id: 1,
               full_name: Faker::Name.name,
               gender: ["male", "female"].sample)
  # u.tenant_id = tenant.id
  u.save(validate: false)
end

## Create staff with the worker role

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  num = rand(5..25)
  puts "Adding #{num} staff to tenant #{tenant.id} (#{tenant.org_name})"

  num.times do
    print "."
    u= User.new(email: Faker::Internet.email,
                password: "password",
                password_confirmation: "password",
                category_id: 1,
                role_id: 2,
                full_name: Faker::Name.name,
                gender: ["male", "female"].sample)
    # u.tenant_id = tenant.id
    u.save(validate: false)
  end
  puts ""
end


## Create supporters

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  num = rand(50..200)
  puts "Adding #{num} supporters to tenant #{tenant.id} (#{tenant.org_name})"

  num.times do
    print "."
    u = User.new(email: Faker::Internet.email,
                password: "password",
                password_confirmation: "password",
                category_id: 3,
                role_id: 3,
                full_name: Faker::Name.name,
                gender: ["male", "female"].sample)
    # u.tenant_id = tenant.id
    u.save(validate: false)
  end
  puts ""
end


## Create recipients in the user category

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  num = rand(50..300)
  puts "Adding #{num} recipients to tenant #{tenant.id} (#{tenant.org_name})"

  num.times do
    print "."
    u = User.new(email: Faker::Internet.email,
                 password: "password",
                 password_confirmation: "password",
                 category_id: 2,
                 role_id: 3,
                 full_name: Faker::Name.name,
                 gender: ["male", "female"].sample)
    # u.tenant_id = tenant.id
    u.save(validate: false)
  end
  puts ""
end

# Create stories for

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  recipients = tenant.users.where("category_id = 2")
  authors = tenant.users.where("category_id = 1")
  authors.shuffle!

  puts "Adding stories to #{recipients.length} recipients for tenant #{tenant.id} (#{tenant.org_name})"


  recipients.all.each do |r|
    print "."
    rand(1..5).times do
    story = Story.new(title: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6),
                      content: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 5),
                      author_id: authors.sample.id)
    story.save
    r.stories << story
    end
  end
  puts ""
end




