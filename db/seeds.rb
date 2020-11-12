puts 'Clearing database'
Ingredient.destroy_all

puts 'Creating 3 fake ingredients...'
ingredient1 = Ingredient.create(name: 'lemon')
ingredient2 = Ingredient.create(name: 'ice')
ingredient3 = Ingredient.create(name: 'mint leaves')

puts 'Saving 1st ingredient...'
ingredient1.save!

puts 'Saving 2nd ingredient...'
ingredient2.save!

puts 'Saving 3rd ingredient...'
ingredient3.save!

puts 'Finished!'
