# rails db:seed:data_seeds
# heroku run rails db:seed:data_seeds --app renegadebio-staging

# ===========================================================================
# Destroy & Rebuild All
# ===========================================================================
# Must be run BEFORE `article_seeds`
load 'db/seeds/person_seeds.rb'

# Can be run in any order once the above seeds have been established
load 'db/seeds/article_seeds.rb'
# load 'db/seeds/event_seeds.rb'
load 'db/seeds/test_seeds.rb'
