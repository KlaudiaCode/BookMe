# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Condition.create(
  name: 'Nowy'
)
Condition.create(
  name: 'Bardzo dobry'
)
Condition.create(
  name: 'Dobry'
)
Condition.create(
  name: 'Średni'
)
Condition.create(
  name: 'Zły'
)
Genre.create(
  name: 'planszowa',
  group: 'game'
)
Genre.create(
  name: 'karciana',
  group: 'game'
)
Genre.create(
  name: 'kooperacyjna',
  group: 'game'
)
Genre.create(
  name: 'euro',
  group: 'game'
)
Genre.create(
  name: 'strategiczna',
  group: 'game'
)
Genre.create(
  name: 'familijna',
  group: 'game'
)
Genre.create(
  name: 'przygodowa',
  group: 'book'
)
Genre.create(
  name: 'kryminalna',
  group: 'book'
)
Genre.create(
  name: 'fantasy',
  group: 'book'
)
Genre.create(
  name: 'biografia',
  group: 'book'
)
Genre.create(
  name: 'historyczna',
  group: 'book'
)
Genre.create(
  name: 'dla dzieci',
  group: 'book'
)
Genre.create(
  name: 'młodzieżowa',
  group: 'book'
)
Genre.create(
  name: 'komedia',
  group: 'book'
)