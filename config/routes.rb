# == Route Map
#

Rails.application.routes.draw do
  defaults format: :json do
    resources :articles, only: [:index, :show]
    resources :contacts, only: [:create]
    resources :events, only: [:index]
    resources :people, only: [:index, :show]
    resources :tests, only: [:index, :show]
  end

  mount Sidekiq::Web => '/sidekiq'

  # -----------------------------------------------------------------------------------------
  # SPA Entry Point
  # -----------------------------------------------------------------------------------------
    root to: 'application#website'

  # -----------------------------------------------------------------------------------------
  # 301 Redirects
  # -----------------------------------------------------------------------------------------
    # /tests
    get '/tests', to: redirect('/test-directory', status: 301)
    get '/tests/:id', to: redirect('/test-directory/:id', status: 301)

    # /diagnostic-testing
    get '/diagnostic-testing/covid-19-testing-organizations', to: redirect('/covid-19-solutions', status: 301)
    get '/diagnostic-testing/about-our-covid-tests', to: redirect('/covid-19-solutions', status: 301)
    get '/diagnostic-testing/covid-lab-partners', to: redirect('/covid-19-solutions', status: 301)
    get '/diagnostic-testing/covid-19-travel-testing', to: redirect('/covid-19-solutions', status: 301)
    get '/diagnostic-testing/about-our-saliva-covid-test', to: redirect('/covid-19-solutions', status: 301)
    get '/diagnostic-testing/about-our-nasal-pcr-covid-test', to: redirect('/covid-19-solutions', status: 301)
    get '/diagnostic-testing/covid/uninsured-and-sick-with-covid-19-symptoms', to: redirect('/covid-19-solutions', status: 301)

    # /about-us
    get '/about-us/about', to: redirect('/who-we-are', status: 301)
    get '/about-us/team', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/about-us/careers', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/about-us/press', to: redirect('/', status: 301)
    get '/about-us/strategic-partners', to: redirect('/renegade-science', status: 301)

    # /team
    get '/team/craig-rouskey', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/team/gabriel-paulino-phd', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/team/salu-robeiro-msc', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/team/jen-skeen', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/team/angelike-kefalas', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/team/neil-turner', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)
    get '/team/limor-allen', to: redirect('/who-we-are#who-we-are-section-team-bios', status: 301)

    # /blog
    get '/blog', to: redirect('/newsroom', status: 301)

    # /posts
    get '/post/tuzun-guvener', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/post/daniel-lee', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/post/rethinking-diagnostics-to-reduce-healthcare-disparities', to: redirect('/newsroom/rethinking-diagnostics-to-reduce-healthcare-disparities', status: 301)
    get '/post/how-to-prevent-covid-outbreaks-in-schools', to: redirect('/newsroom/how-to-prevent-covid-outbreaks-in-schools', status: 301)
    get '/post/decentralizing-salivadirect-sample-collection', to: redirect('/newsroom/decentralizing-salivadirect-sample-collection', status: 301)
    get '/post/covid-19-infection-vaccines-fertility', to: redirect('/newsroom/covid-19-infection-vaccines-fertility', status: 301)
    get '/post/how-to-covid-production-companies', to: redirect('/newsroom/how-to-covid-production-companies', status: 301)
    get '/post/how-to-stay-safe-post-vaccination', to: redirect('/newsroom/how-to-stay-safe-post-vaccination', status: 301)
    get '/post/covid-variants', to: redirect('/newsroom/covid-variants', status: 301)
    get '/post/how-to-pay-for-covid-testing', to: redirect('/covid-19-solutions', status: 301)
    get '/post/get-the-right-test-at-the-right-time', to: redirect('/newsroom/how-to-pay-for-covid-testing', status: 301)
    get '/post/coronavirus-tips-flying', to: redirect('/newsroom/coronavirus-tips-flying', status: 301)
    get '/post/covid-safe-thanksgiving', to: redirect('/newsroom/covid-safe-thanksgiving', status: 301)
    get '/post/right-type-of-covid-19-test', to: redirect('/newsroom/right-type-of-covid-19-test', status: 301)

    # /news
    get '/news', to: redirect('/newsroom', status: 301)
    get '/news?3057a815_page=1', to: redirect('/newsroom&page=1', status: 301)
    get '/news?3057a815_page=2', to: redirect('/newsroom&page=2', status: 301)
    get '/news?3057a815_page=3', to: redirect('/newsroom&page=3', status: 301)
    get '/news?3057a815_page=4', to: redirect('/newsroom&page=4', status: 301)

    # /support
    get '/support/contact', to: redirect('/contact-us', status: 301)

    # /policies
    # * Endpoints already conformed to routing schema. No redirect necessary.
    # get '/policies/terms-conditions', to: redirect('/policies/terms-conditions', status: 301)
    # get '/policies/privacy-policy', to: redirect('/policies/privacy-policy', status: 301)
    # get '/policies/accreditations-certifications', to: redirect('/policies/accreditations-certifications', status: 301)
    # get '/policies/billing', to: redirect('/policies/billing', status: 301)
    # get '/policies/manage-cookies', to: redirect('/policies/manage-cookies', status: 301)

    # /covid-testing
    get '/covid-testing/schools-universities', to: redirect('/covid-19-solutions', status: 301)
    get '/covid-testing/production-companies', to: redirect('/covid-19-solutions', status: 301)

    # /jobs
    get '/jobs/clinical-trial-manager', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/jobs/program-manager', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/jobs/full-stack-software-engineer', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/jobs/clinical-laboratory-scientist', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/jobs/lab-specimen-accessioner-berkeley', to: redirect('https://renegade-bio.breezy.hr/', status: 301)
    get '/jobs/testing-site-administrator', to: redirect('https://renegade-bio.breezy.hr/', status: 301)

    # /press-releases
    get '/press-releases/monkeypox-test-with-fast-result-turn-around-times-of-24-hours', to: redirect('/newsroom/monkeypox-test-with-fast-result-turn-around-times-of-24-hours', status: 301)
    get '/press-releases/renegade-bio-announces-decision-to-continue-no-cost-covid-19-testing-for-symptomatic-uninsured-bay-area-community', to: redirect('/newsroom/renegade-bio-announces-decision-to-continue-no-cost-covid-19-testing-for-symptomatic-uninsured-bay-area-community', status: 301)
    get '/press-releases/renegade-bio-metabolomic-diagnostics-announcement', to: redirect('/newsroom/renegade-bio-metabolomic-diagnostics-announcement', status: 301)
    get '/press-releases/renegade-bio-expands-access-to-cutting-edge-diagnostics-with-new-lab-in-berkeley', to: redirect('/newsroom/renegade-bio-expands-access-to-cutting-edge-diagnostics-with-new-lab-in-berkeley', status: 301)
    get '/press-releases/alameda-county-covid-19-vaccine-testing', to: redirect('/newsroom/alameda-county-covid-19-vaccine-testing', status: 301)
    get '/press-releases/renegade-bio-announces-authorization-to-offer-salivadirect-covid-19-test', to: redirect('/newsroom/renegade-bio-announces-authorization-to-offer-salivadirect-covid-19-test', status: 301)
    get '/press-releases/affordable-next-day-covid-testing-in-north-oakland', to: redirect('/newsroom/affordable-next-day-covid-testing-in-north-oakland', status: 301)
    get '/press-releases/renegade-bio-officially-certified-a-lgbt-business-enterprise-r-by-the-national-lgbt-chamber-of-commerce', to: redirect('/newsroom/renegade-bio-officially-certified-a-lgbt-business-enterprise-r-by-the-national-lgbt-chamber-of-commerce', status: 301)
    get '/press-releases/renegade-bio-announces-r-d-partnership-with-caspr-biotech-to-develop-cost-effective-point-of-care-covid-19-tests', to: redirect('/newsroom/renegade-bio-announces-r-d-partnership-with-caspr-biotech-to-develop-cost-effective-point-of-care-covid-19-tests', status: 301)
    get '/press-releases/renegade-bio-and-primary-form-strategic-alliance-to-streamline-and-expedite-access-to-us-wide-covid-19-community-testing', to: redirect('/newsroom/renegade-bio-and-primary-form-strategic-alliance-to-streamline-and-expedite-access-to-us-wide-covid-19-community-testing', status: 301)
    get '/press-releases/renegade-bio-responds-to-new-yorkcity-call-for-accelerated-covid-19testing', to: redirect('/newsroom/renegade-bio-responds-to-new-yorkcity-call-for-accelerated-covid-19testing', status: 301)

    # /travel
    get '/travel/covid-travel-requirements', to: redirect('/covid-19-solutions', status: 301)
    get '/travel/faqs', to: redirect('/covid-19-solutions', status: 301)

  # -----------------------------------------------------------------------------------------
  # SPA Pages
  # -----------------------------------------------------------------------------------------
    # get '/panel(/*path)', to: 'application#panel', as: :panel
    get '/(*path)', to: 'application#website', as: :website
end
