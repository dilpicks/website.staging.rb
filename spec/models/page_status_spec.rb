# == Schema Information
#
# Table name: page_statuses
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  slug       :string
#  status     :string(255)      not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_page_statuses_on_slug    (slug) UNIQUE
#  index_page_statuses_on_status  (status) UNIQUE
#
require 'rails_helper'

RSpec.describe PageStatus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
