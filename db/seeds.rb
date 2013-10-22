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
               role_id: 1)
  # u.tenant_id = tenant.id
  u.save

  person =  Person.create(full_name: Faker::Name.name,
                          user_id: u.id,
                          category_id: 1,
                          gender: ["male", "female"].sample,
                          nationality: ["American", "Norwegian","Phillipino"].sample,
                          email: Faker::Internet.email)

end

## Create staff with the worker role

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  num = rand(5..25)
  puts "Adding #{num} staff to tenant #{tenant.id} (#{tenant.org_name})"

  num.times do
    print "."
    u = User.new(email: Faker::Internet.email,
                 password: "password",
                 password_confirmation: "password",
                 role_id: 1)
    u.save

    person =  Person.new(full_name: Faker::Name.name,
                         user_id: u.id,
                         category_id: 1,
                         gender: ["male", "female"].sample,
                         nationality: ["American", "Norwegian","Phillipino"].sample,
                         email: Faker::Internet.email)
    person.save
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
    p = Person.new(full_name: Faker::Name.name,
                   category_id: 3,
                   gender: ["male", "female"].sample,
                   nationality: ["American", "Norwegian","Norwegian"].sample,
                   email: Faker::Internet.email)
    p.save
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
    u = Person.new(full_name: Faker::Name.name,
                   category_id: 2,
                   gender: ["male", "female"].sample,
                   nationality: "Phillipino",
                   email: Faker::Internet.email)
    u.save
  end
  puts ""
end

# Create stories for

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  recipients = Person.where("category_id = 2")
  authors = Person.where("category_id = 1")
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


## Create Initiatives

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  num = rand(2..7)
  puts "Adding #{num} initiatives to tenant #{tenant.id} (#{tenant.org_name})"

  num.times do
    print "."
    manager = Person.where(category_id: 1).shuffle!.pop
    Initiative.create(manager_id: manager.id,
                      initiative_type_id: 0,
                      title: Faker::Lorem.sentence(word_count = 2, supplemental = false, random_words_to_add = 4),
                      description: Faker::Lorem.paragraph(sentence_count = 1, supplemental = false, random_sentences_to_add = 2),
                      goal: rand(1..10)*1000,
                      active: true,
                      start_date: DateTime.now())
  end
  puts ""
end


## Create Projects

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
  num = rand(5..21)
  puts "Adding #{num} projects to tenant #{tenant.id} (#{tenant.org_name}"

  num.times do
    print "."
    manager = Person.where(category_id: 1).shuffle!.pop
    Project.create(manager_id: manager.id,
                   name: Faker::Lorem.sentence(word_count = 2, supplemental = false, random_words_to_add = 2))
  end
  puts ""
end


## Add receivers to initiatives

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id

  Initiative.all.each do |initiative|
    num_projects = [0,0,0,0,2,1,3].sample
    num_people = rand(5..50)
    projects = Project.all.shuffle!
    people = Person.where(category_id: 2).shuffle!
    puts "Adding #{num_projects} projects and #{num_people} recipients to initiative #{initiative.title}"

    puts "Adding projects"
    num_projects.times do
      print "."
      p = projects.pop
      Receiver.create(initiative_id: initiative.id,
                   receiverable: p)
    end
    puts ""
    puts "Adding people"
    num_people.times do
      print "."
      p = people.pop
      Receiver.create(initiative_id: initiative.id,
                      receiverable: p)
    end
  end

  puts ""
end


## Create sponsorships

Tenant.all.each do |tenant|
  Tenant.set_current_tenant tenant.id
    Initiative.all.each do |initiative|

    receivers = initiative.receivers.shuffle!
    sponsor_count = receivers.length / 2

    puts "Setting up #{sponsor_count} sponsorships for initiative #{initiative.title}"

      sponsor_count.times do
        print "."
        r = receivers.pop
        s = Sponsorship.create(initiative_id: initiative.id,
                               frequency_id: 0,
                               recurring_payment: [true, true, true, false].sample,
                               amount: (rand(5..200)*10),
                               active: [true, true, true, true, true, false].sample,
                               start_date: DateTime.now())
        r.sponsorships << s
        s.sponsors << Person.where(category_id: 3).shuffle!.pop
      end
    puts ""
  end
end

# Create groups

Tenant.all.each do |tenant|

  Tenant.set_current_tenant tenant.id
  num = rand(5..15)
  manager = Person.where("category_id = 1").shuffle!.pop
  puts "Greating #{num} groups for tenant #{tenant.id} (#{tenant.org_name}"

  num.times do
    num_members = rand(5..30)

    members = Person.all.shuffle!
    g = Group.create(name: Faker::Lorem.sentence(word_count = 1, supplemental = false, random_words_to_add = 2),
                 manager_id: manager.id)
    puts "Greating group #{g.name} with #{num_members} members}"
    num_members.times do
      print "."
      g.members << members.pop
    end
    puts ""
  end


end

## Add transactions

TransactionType.create(name: "Bank")
TransactionType.create(name: "PayPal")

Tenant.all.each do |tenant|

  Tenant.set_current_tenant tenant.id

  sponsorships = Sponsorship.all.shuffle!

  puts "Greating transactions for #{sponsorships.length} sponsorship for #{tenant.id} (#{tenant.org_name}"

  sponsorships.each do |s|
    type = [1,2].sample
    sponsors = s.sponsors
    rand(1..12).times do
      print "."
      sponsors.shuffle!
      date = "#{rand(2008..2013)}-#{rand(1..12)}-#{rand(1..28)}"
      Transaction.create(transaction_type_id: type,
                         sponsorship_id: s.id,
                         payer_id: sponsors.first.id,
                         date: date,
                         amount: rand(1..100)*10)
    end
  end

  puts ""

end







