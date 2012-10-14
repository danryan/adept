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

ActiveRecord::Schema.define(:version => 20121010205246) do

  create_table "distribution_packages", :force => true do |t|
    t.integer  "distribution_id"
    t.integer  "package_id"
    t.string   "uuid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "distribution_packages", ["distribution_id", "package_id"], :name => "index_distribution_packages_on_distribution_id_and_package_id"

  create_table "distributions", :force => true do |t|
    t.string   "origin"
    t.string   "label"
    t.string   "codename"
    t.string   "description"
    t.integer  "repository_id"
    t.string   "uuid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "distributions", ["repository_id"], :name => "index_distributions_on_repository_id"

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.text     "control"
    t.text     "raw_control"
    t.text     "checksums"
    t.string   "component"
    t.string   "architecture"
    t.string   "kind"
    t.string   "prefix"
    t.string   "filename"
    t.string   "extension"
    t.string   "size"
    t.integer  "repository_id"
    t.string   "uuid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "file"
  end

  add_index "packages", ["repository_id"], :name => "index_packages_on_repository_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "public",     :default => false
    t.string   "uuid"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "type",                          :null => false
  end

  add_index "repositories", ["type"], :name => "index_repositories_on_type"
  add_index "repositories", ["user_id"], :name => "index_repositories_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["tagger_id", "tagger_type"], :name => "index_taggings_on_tagger_id_and_tagger_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_roles", ["user_id", "role_id"], :name => "index_user_roles_on_user_id_and_role_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.integer  "roles"
    t.string   "uuid"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
