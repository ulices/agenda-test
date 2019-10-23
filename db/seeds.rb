require 'faker'

ActiveRecord::Base.connection.tables.each do |t|
  update_seq_sql = "UPDATE sqlite_sequence set seq = 0 where name = '#{t}'"
  ActiveRecord::Base.connection.execute(update_seq_sql)
end

25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone = Faker::PhoneNumber.phone_number
  User.create(f_name: first_name, l_name: last_name, phone: phone)
end
