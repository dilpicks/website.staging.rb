# rails db:seed:person_seeds
# heroku run rails db:seed:person_seeds --app renegadebio-staging

# ===========================================================================
# People
# ===========================================================================
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE people RESTART IDENTITY")

people = [
  # Featured Team Members
  {
    slug: 'craig-rouskey',
    team_member: true,
    featured: true,
    name: 'Craig Rouskey',
    title: 'MSc, co-founder & CEO',
    summary: '<p class="p3">With a Master of Science degree in molecular biology, microbiology, biochemistry, and immunology, along with 21 years in the field, Craig has a long history of fighting challenging diseases from H5N1, anthrax, and HIV vaccine development to gonorrhea treatment and antibody therapies using Next Generation Sequencing. Craig is a two-time IndieBio alumnus.</p>',
    bio: '<p class="p3"><strong>Craig Rouskey</strong> is a co-founder & CEO of <a href="https://renegade.bio" target="_self">renegade.bio</a>, a Public Benefit Corporation, which offers the SalivaDirect&trade; test and other diagnostic tests on a commercial basis.</p>',
    link: 'https://www.linkedin.com/in/craig-rouskey/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/craig-rouskey.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio ceo and co-founder craig rouskey', alt: 'renegade.bio ceo craig rouskey' }
  },

  {
    slug: 'gabriel-paulino',
    team_member: true,
    featured: true,
    name: 'Gabriel Paulino',
    title: 'PhD, co-founder & CPO',
    summary: '<p class="p3">Gabriel has extensive experience in R&D, product development, strategy, and innovation for biotech and nutraceutical companies. An IndieBio and Plug & Play alumnus, he has also consulted on consumer health products.</p><p class="p3">Gabe holds Master of Science degrees in life sciences engineering, human health and nutrition from the AgroParisTech, and a PhD in neurophysiology of nutrition from UC Davis and the Paris Institute of Technology.</p>',
    bio: '<p class="p3"><strong>Gabriel Paulino</strong> is a co-founder & VP of Product Development of <a href="https://renegade.bio" target="_self">renegade.bio</a>, a Public Benefit Corporation, which offers the SalivaDirect&trade; test and other diagnostic tests on a commercial basis.</p>',
    link: 'https://www.linkedin.com/in/gabrielpaulino/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/gabriel-paulino.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio cpo and co-founder gabriel paulino', alt: 'renegade.bio cpo and found gabriel paulino' }
  },

  {
    slug: 'salu-ribeiro',
    team_member: true,
    featured: true,
    name: 'Salu Ribeiro',
    title: 'MSc, co-founder & VP of Clinical Operations',
    summary: '<p class="p3">Salu is co-founder and CEO of Bay Area Phlebotomy and Laboratory Services, a CLIA-certified laboratory and sample transportation, processing, and test distribution service. A trained phlebotomist and reproductive scientist, with expertise in high-complexity CLIA-certified laboratories.</p><p class="p3">Salu holds a Bachelor of Science degree in animal biotechnology from UC Davis and a Master of Science in clinical embryology and andrology from the University of Leeds.</p>',
    bio: '',
    link: 'https://www.linkedin.com/in/salu-ribeiro-ms-ts-abb-els-als-aab-05081a182/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/salu-ribeiro.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio co-founder & VP of Clinical Laboratory salu ribeiro', alt: 'co-founder & VP of Clinical Laboratory salu ribeiro' }
  },

  {
    slug: 'jen-skeen',
    team_member: true,
    featured: true,
    name: 'Jen Skeen',
    title: 'PhD, COO',
    summary: '<p class="p3">At a young age, Jen found her calling in clinical laboratory medicine—the perfect use of science to improve human health.</p><p class="p3">With 27 years as a biotechnology and laboratory executive, for companies including Illumina and GenomeDx, Jen has amassed high performance team management expertise in the life science and diagnostics sectors.</p><p class="p3">Jen’s passion is building companies, products, teams, and young professionals. Her positive attitude brings out the best in people to achieve collective goals.</p>',
    bio: '',
    link: 'https://www.linkedin.com/in/jen-skeen-phd-4625b9a/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/jen-skeen.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio coo jen skeen', alt: 'renegade.bio coo jen skeen' }
  },

  {
    slug: 'angelike-kefalas',
    team_member: true,
    featured: true,
    name: 'Angelike Kefalas',
    title: 'MBA, CBO',
    summary: '<p class="p3">Angelike is an entrepreneurial-minded C-level Commercial Operations and Sales Growth Leader with over 20 years of experience in digital health, diagnostic, and biotechnology companies.</p><p class="p3">She has a track record in creating winning commercial strategies, launching 7 FDA products, and implementing successful marketing and sales plans that have driven revenue.</p><p class="p3">With a passion for helping companies grow, Angelike uses her problem-solving skills to analyze market conditions and develop actionable strategies for bringing products to market that improve patients’ lives.</p>',
    bio: '',
    link: 'https://www.linkedin.com/in/angelike/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/angelike-kefalas.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio cbo aneglike kefalas', alt: 'renegade.bio cbo aneglike kefalas' }
  },

  {
    slug: 'neil-turner',
    team_member: true,
    featured: true,
    name: 'Neil Turner',
    title: 'VP of Finance',
    summary: '<p class="p3">Neil has a keen understanding of the ever-changing landscape of the biopharmaceutical, medical device, and healthcare management sector and the financial challenges that face them.</p><p class="p3">As an experienced financial planner and analyst, Neil is a specialist in the integration of corporate, operational, and product financial planning and analysis.</p><p class="p3">Using the application of intelligent forecasting and analytical systems and programs, Neil supports and enhances the financial process to accelerate development time, decrease costs, and promote corporate and product value.</p>',
    bio: '',
    link: 'https://www.linkedin.com/in/neil-turner/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/neil-turner.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio vp of finance neil turner', alt: 'renegade.bio vp of finance neil turner' }
  },

  {
    slug: 'limor-allen',
    team_member: true,
    featured: true,
    name: 'Limor Allen',
    title: 'VP of Sales & Business Development',
    summary: '<p class="p3">Limor’s background armed her with the experience and knowledge needed to help launch renegade.bio. From negotiating billion dollar international contracts and managing global cross functional teams for aerospace and healthcare to running her own eco-friendly wine company, she brings her entrepreneurial spirit and unique skills to every project. Limor graduated with Honors from the International Business School at the University of Texas.</p>',
    bio: '',
    link: 'https://www.linkedin.com/in/limor-allen/',
    image_attributes: { src: 'https://res.cloudinary.com/renegade-bio/image/upload/people/limor-allen.jpg', primary: true, width: 1218, height: 1218, title: 'renegade.bio VP of Sales & Business Development limor allen', alt: 'renegade.bio VP of Sales & Business Development limor allen' }
  },

  # Authors
  {
    slug: 'carol-carmick',
    team_member: false,
    featured: false,
    name: 'Carol Carmick',
    title: '',
    summary: '',
    bio: '<p class="p3"><strong>Carol Carmick</strong> (aka Stella Maris) is a strategic copywriter, cauldron technician, and community instigator in Portland, Oregon. <a href="http://www.carolcarmick.com/" target="_blank"><strong>www.carolcarmick.com</strong></a></p>',
    link: ''
  },

  {
    slug: 'garrett-christopher',
    team_member: false,
    featured: false,
    name: 'Garrett Christopher',
    title: '',
    summary: '',
    bio: '<p class="p3"><strong>Garrett Christopher</strong> is a writer, artist and plant geek living in Portland OR. He helps brands and businesses create engaging, clear, and creative content. Omnivorous with a taste for the odd and captivating he writes about current events, the arts and culture.</p>',
    link: ''
  },
  {
    slug: 'jared-morgan',
    team_member: true,
    featured: false,
    name: 'Jared Morgan',
    title: '',
    summary: '',
    bio: '<p class="p3"><strong>Jared Morgan</strong> leads brand and marketing at <a href="https://renegade.bio" target="_self">renegade.bio</a>. He also creates art from his home studio in Louisville, KY after 20 years of film, documentary, commercial, and marketing work in the San Francisco Bay and Portland, OR.</p>',
    link: ''
  },
  {
    slug: 'tristan-vitale',
    team_member: true,
    featured: false,
    name: 'Tristan Vitale',
    title: '',
    summary: '',
    bio: '<p class="p3">Tristan Vitale is a digital marketer, music producer and outdoor enthusiast living in San Francisco, CA. He began his marketing career with <a href="https://renegade.bio" target="_self">renegade.bio</a> after completing his bachelor degree at Northern Michigan University.</p>',
    link: ''
  }
]

people.each do |person_attributes|
  puts ''
  puts '###########################################################################'
  puts "Person Name: "
  puts "#{ap person_attributes[:name]}"
  puts '###########################################################################'
  puts ''

  existing_person = Person.find_by(name: person_attributes[:name])
  existing_person.present? ? existing_person.update!(person_attributes) : Person.create!(person_attributes)
end
