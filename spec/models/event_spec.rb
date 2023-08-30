# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)      not null
#  classes     :string           default([]), is an Array
#  occurred_at :datetime
#  event_id    :bigint
#  slug        :string
#
# Indexes
#
#  index_events_on_event_id  (event_id)
#  index_events_on_slug      (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
