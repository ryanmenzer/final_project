# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131021153439) do

  create_table "categories", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["tenant_id"], :name => "index_categories_on_tenant_id"

  create_table "frequencies", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "frequencies", ["name"], :name => "index_frequencies_on_name"
  add_index "frequencies", ["tenant_id"], :name => "index_frequencies_on_tenant_id"

  create_table "groups", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "manager_id", :null => false
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["manager_id"], :name => "index_groups_on_manager_id"
  add_index "groups", ["tenant_id"], :name => "index_groups_on_tenant_id"

  create_table "groups_people", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "group_id",  :null => false
  end

  add_index "groups_people", ["group_id"], :name => "index_groups_people_on_group_id"
  add_index "groups_people", ["person_id"], :name => "index_groups_people_on_person_id"

  create_table "images", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "creator_id"
    t.string   "title",          :null => false
    t.string   "url",            :null => false
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "images", ["creator_id"], :name => "index_images_on_creator_id"
  add_index "images", ["imageable_id"], :name => "index_images_on_imageable_id"
  add_index "images", ["imageable_type"], :name => "index_images_on_imageable_type"
  add_index "images", ["tenant_id"], :name => "index_images_on_tenant_id"
  add_index "images", ["title"], :name => "index_images_on_title"
  add_index "images", ["url"], :name => "index_images_on_url"

  create_table "initiatives", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "manager_id"
    t.integer  "initiative_type_id",                   :null => false
    t.string   "title",                                :null => false
    t.text     "description"
    t.float    "goal"
    t.boolean  "active",             :default => true
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "initiatives", ["end_date"], :name => "index_initiatives_on_end_date"
  add_index "initiatives", ["initiative_type_id"], :name => "index_initiatives_on_initiative_type_id"
  add_index "initiatives", ["manager_id"], :name => "index_initiatives_on_manager_id"
  add_index "initiatives", ["start_date"], :name => "index_initiatives_on_start_date"
  add_index "initiatives", ["tenant_id"], :name => "index_initiatives_on_tenant_id"
  add_index "initiatives", ["title"], :name => "index_initiatives_on_title"

  create_table "mandrill_settings", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "api_email"
    t.string   "api_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mandrill_settings", ["tenant_id"], :name => "index_mandrill_settings_on_tenant_id"

  create_table "paypal_settings", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "api_username"
    t.string   "api_password"
    t.string   "api_signature"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "paypal_settings", ["tenant_id"], :name => "index_paypal_settings_on_tenant_id"

  create_table "people", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "user_id"
    t.integer  "category_id",   :null => false
    t.string   "full_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "nationality"
    t.string   "phone_number"
    t.date     "date_of_birth"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "email"
    t.string   "country"
  end

  add_index "people", ["category_id"], :name => "index_people_on_category_id"
  add_index "people", ["date_of_birth"], :name => "index_people_on_date_of_birth"
  add_index "people", ["first_name"], :name => "index_people_on_first_name"
  add_index "people", ["full_name"], :name => "index_people_on_full_name"
  add_index "people", ["last_name"], :name => "index_people_on_last_name"
  add_index "people", ["nationality"], :name => "index_people_on_nationality"
  add_index "people", ["phone_number"], :name => "index_people_on_phone_number"
  add_index "people", ["tenant_id"], :name => "index_people_on_tenant_id"
  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "people_sponsorships", :id => false, :force => true do |t|
    t.integer "sponsorship_id", :null => false
    t.integer "person_id",      :null => false
  end

  add_index "people_sponsorships", ["person_id"], :name => "index_people_sponsorships_on_person_id"
  add_index "people_sponsorships", ["sponsorship_id"], :name => "index_people_sponsorships_on_sponsorship_id"

  create_table "projects", :force => true do |t|
    t.integer  "tenant_id",  :null => false
    t.integer  "manager_id", :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects", ["manager_id"], :name => "index_projects_on_manager_id"
  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["tenant_id"], :name => "index_projects_on_tenant_id"

  create_table "receivers", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "initiative_id",     :null => false
    t.integer  "receiverable_id",   :null => false
    t.string   "receiverable_type", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "receivers", ["initiative_id"], :name => "index_receivers_on_initiative_id"
  add_index "receivers", ["tenant_id"], :name => "index_receivers_on_tenant_id"

  create_table "receivers_sponsorships", :id => false, :force => true do |t|
    t.integer "receiver_id",    :null => false
    t.integer "sponsorship_id", :null => false
  end

  add_index "receivers_sponsorships", ["receiver_id"], :name => "index_receivers_sponsorships_on_receiver_id"
  add_index "receivers_sponsorships", ["sponsorship_id"], :name => "index_receivers_sponsorships_on_sponsorship_id"

  create_table "roles", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["tenant_id"], :name => "index_roles_on_tenant_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "display_name"
    t.integer  "logo_id"
    t.string   "cat_1_name"
    t.string   "cat_2_name"
    t.string   "cat_3_name"
    t.string   "email"
    t.integer  "paypal_setting_id"
    t.integer  "mandrill_setting_id"
    t.integer  "primary_contact_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "default_email"
  end

  add_index "settings", ["tenant_id"], :name => "index_settings_on_tenant_id"

  create_table "sponsorships", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "initiative_id",     :null => false
    t.integer  "frequency_id"
    t.boolean  "recurring_payment"
    t.float    "amount"
    t.boolean  "active"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "sponsorships", ["end_date"], :name => "index_sponsorships_on_end_date"
  add_index "sponsorships", ["initiative_id"], :name => "index_sponsorships_on_initiative_id"
  add_index "sponsorships", ["start_date"], :name => "index_sponsorships_on_start_date"
  add_index "sponsorships", ["tenant_id"], :name => "index_sponsorships_on_tenant_id"

  create_table "stories", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "author_id",      :null => false
    t.string   "title",          :null => false
    t.text     "content"
    t.integer  "storyable_id"
    t.string   "storyable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "stories", ["author_id"], :name => "index_stories_on_author_id"
  add_index "stories", ["storyable_id"], :name => "index_stories_on_storyable_id"
  add_index "stories", ["storyable_type"], :name => "index_stories_on_storyable_type"
  add_index "stories", ["tenant_id"], :name => "index_stories_on_tenant_id"
  add_index "stories", ["title"], :name => "index_stories_on_title"

  create_table "tenants", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "org_name",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "subdomain"
  end

  add_index "tenants", ["org_name"], :name => "index_tenants_on_org_name"

  create_table "tenants_users", :id => false, :force => true do |t|
    t.integer "tenant_id"
    t.integer "user_id"
  end

  add_index "tenants_users", ["tenant_id"], :name => "index_tenants_users_on_tenant_id"
  add_index "tenants_users", ["user_id"], :name => "index_tenants_users_on_user_id"

  create_table "transaction_types", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "transaction_types", ["tenant_id"], :name => "index_transaction_types_on_tenant_id"

  create_table "transactions", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "transaction_type_id", :null => false
    t.integer  "sponsorship_id",      :null => false
    t.integer  "payer_id",            :null => false
    t.date     "date",                :null => false
    t.float    "amount"
    t.string   "status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "transactions", ["amount"], :name => "index_transactions_on_amount"
  add_index "transactions", ["date"], :name => "index_transactions_on_date"
  add_index "transactions", ["payer_id"], :name => "index_transactions_on_payer_id"
  add_index "transactions", ["sponsorship_id"], :name => "index_transactions_on_sponsorship_id"
  add_index "transactions", ["status"], :name => "index_transactions_on_status"
  add_index "transactions", ["tenant_id"], :name => "index_transactions_on_tenant_id"
  add_index "transactions", ["transaction_type_id"], :name => "index_transactions_on_transaction_type_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.integer  "tenant_id"
    t.integer  "role_id",                                :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["tenant_id"], :name => "index_users_on_tenant_id"

end
