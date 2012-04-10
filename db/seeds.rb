# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Category.create(name: "Great Stuff")
c2 = Category.create(name: "Pretty Good Stuff")

p1 = Product.create(name: "Sample Product 1", description: "Lorem ipsum dolor sit amet", categories: [c1], price_in_cents: 1050)
p2 = Product.create(name: "Second Product Sample", description: "Foo bar baz quux", categories: [c2], price_in_cents: 19999)

u1 = User.create(full_name: "Mark Tabler", email: "a@b.com", password: "asdfasdf", password_confirmation: "asdfasdf")
u2 = User.create(full_name: "Charles Strahan", email: "b@c.com", password: "asdfasdf", password_confirmation: "asdfasdf")
u3 = User.create(full_name: "Happy Admin", email: "admin@store.com", password: "asdfasdf", password_confirmation: "asdfasdf")
u3.update_attribute(:admin, true)
u3.update_attributes(billing_address: "My Billing Address", shipping_address: "My Shipping Address")
