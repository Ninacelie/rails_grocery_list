# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    nina = User.new
    nina.email = "nina@nina.com"
    nina.username = "ninacelie"
    nina.password = "password"
    nina.save
    
    list = nina.lists.build 
    list.title = "easter"
    list.content = "eggs, cheese"
    list.save 

    item1 = Item.new 
    item1.content = "eggs"
    item1.save

    item2 = Item.new
    item2.content = "cheese" 
    item2.save

    item3 = Item.new
    item3.content = "milk"
    item3.save 

    ListItem.create(item: item1, list: list, completed: false)
    