require 'machinist/active_record'
require 'sham'
require 'ffaker'

Sham.define do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  username { Faker::Internet.user_name }
  password { Faker::Name.name[0..10] }
end

Account.blueprint do
  email
  password
end

Application.blueprint do
  account
  name
end

CallLog.blueprint do
  application
end

Channel.blueprint do
  application
  account { application.account }
  name
end
