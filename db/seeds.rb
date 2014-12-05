# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tyler = User.create(username: 'softtilt', email: 'hello@soft-tilt.sx', real_name: 'tyler', blog_name: 'subtleties',
                    city: 'San Francisco', country: 'US', password: 'voidpass1')

tate = User.create(username: 'tatemodern', email: 'westerantyler@gmail.com', real_name: 'tate', blog_name: 'convict tang',
                    city: 'San Francisco', country: 'US', password: 'voidpass2')

Post.create!(user_id: tyler.id, title: 'first post', content: 'this is the first post', num_recommends: 0, topic: 'admin')

Post.create!(user_id: tyler.id, title: 'second post', content: 'this is another great test post that will be displayed', num_recommends: 0, topic: 'admin')
Post.create!(user_id: tyler.id, title: 'third post', content: 'this is the last test post', num_recommends: 2, topic: 'admin')
Post.create!(user_id: tate.id, title: 'tate post 1', content: 'this is the first tate test post', num_recommends: 2, topic: 'test')
Post.create!(user_id: tate.id, title: 'tate post 2', content: 'this is the second tate test post', num_recommends: 2, topic: 'test')

Following.create(user_id: tyler.id, follow_id: tate.id)
Following.create(user_id: tate.id, follow_id: tyler.id)