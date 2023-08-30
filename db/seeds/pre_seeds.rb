# rails db:seed:pre_seeds
# heroku run rails db:seed:pre_seeds --app renegadebio-staging

# ===========================================================================
# Destroy & Rebuild All
# ===========================================================================
ActiveRecord::Base.connection.execute("TRUNCATE TABLE article_types, characteristics, characteristic_groups, page_statuses, articles, copy_blocks, images, people, article_authors, tests, events RESTART IDENTITY")

# Load seeds in specific order

# "Constants"
load 'db/seeds/article_type_seeds.rb'
load 'db/seeds/characteristic_group_seeds.rb'
load 'db/seeds/page_status_seeds.rb'