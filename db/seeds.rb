# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.new
admin.email = 'admin@ncsu.edu'
admin.name = 'Admin'
admin.password = '12345678'
admin.password_confirmation = '12345678'
admin.save!

agent = Agent.new
agent.email = 'agent@ncsu.edu'
agent.name = 'Agent'
agent.password = '12345678'
agent.password_confirmation = '12345678'
agent.save!

customer = Customer.new
customer .email = 'customer@ncsu.edu'
customer.name = 'Customer'
customer .password = '12345678'
customer .password_confirmation = '12345678'
customer .save!