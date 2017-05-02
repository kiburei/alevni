# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = User.create! :full_name => 'admin invela', :country => 'kenya', :email => 'admin@admin.com', :member_code => "000", :password => 'topsecret', :password_confirmation => 'topsecret', :superadmin_role => true, :supervisor_role => true, :user_role => true

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'invela_members.csv'))
if ! csv_text.valid_encoding?
  csva = csv_text.encode("UTF-16be", :invalid => :replace, :replace => "?").encode('UTF-8')
  csv = CSV.parse(csva, :headers => true)
end
csv.each do |row|
  t = User.new
    t.member_code = row['Membership Number']
    t.subscription_date = Date.strptime(row['Application Date'], "%m/%d/%Y")
    t.end_subscription = Date.strptime(row['End of Subscription'], "%m/%d/%Y")
    t.full_name = row['Member Name']
    t.id_no = row['ID Number']
    t.mobile_no = row['Mobile Number']
    t.address = row['Address Of Applicant']
    t.address_code = row['Address Code']
    t.town = row['Town']
    t.county = row['County']
    t.country = row['Country']
    t.advisor = row['Investment Advisor']
    t.advisor_code = row['Advisor Code']
    t.nok = row['Next of Kin']
    t.nok_id = row['Next Of Kin ID Number']
    t.nok_mobile = row['Next Of Kin Mobile']
    t.bank = row['Bank Name']
    t.bank_branch = row['Branch']
    t.bank_ac = row['Acc Number']
    t.email = row['Email Address']
    t.password = row['Password']
    t.password_confirmation = row['Password confirmation']
    t.save
    puts "#{t.member_code}, #{t.full_name} saved"
  end
