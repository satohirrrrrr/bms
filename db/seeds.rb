# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.connection.execute('TRUNCATE TABLE users')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE user_profiles')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE roles')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE user_roles')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE books')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE book_oweners')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE authors')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE book_authors')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE tags')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE book_tags')

SeedFu.seed
