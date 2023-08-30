class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include Pagy::Backend

  after_action { pagy_headers_merge(@pagy) if @pagy }

  def website
    run_as_env = ENV.fetch('RUN_AS_ENV', 'production')

    @zoom_class = 'zoom-100'
    @zoom_class = 'zoom-80' if run_as_env == 'production'

    render template: 'layouts/website'
  end

  def panel
    return redirect_to website_path unless user_signed_in?

    render template: 'layouts/panel'
  end
end
