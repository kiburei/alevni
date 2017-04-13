# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create! :full_name => 'admin invela', :country => 'kenya', :email => 'admin@admin.com', :member_code => "000", :password => 'topsecret', :password_confirmation => 'topsecret', :superadmin_role => true, :supervisor_role => true, :user_role => true
