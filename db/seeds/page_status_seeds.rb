# rails db:seed:page_status_seeds
# heroku run rails db:seed:page_status_seeds --app renegadebio-staging

# ===========================================================================
# Pages Statuses
# ===========================================================================

page_statuses = [
  {
    slug: 'published',
    status: 'Published'
  },
  {
    slug: 'unpublished',
    status: 'Unpublished'
  }
]

page_statuses.each do |page_status_attributes|
  existing_page_status = PageStatus.find_by(slug: page_status_attributes[:slug])
  existing_page_status.present? ? existing_page_status.update!(page_status_attributes) : PageStatus.create!(page_status_attributes)
end
