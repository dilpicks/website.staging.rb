# rails db:seed:event_seeds
# heroku run rails db:seed:event_seeds --app renegadebio-staging

# ===========================================================================
# Events
# ===========================================================================

timeline_events = [
  # Event - Group: 2016
  {
    slug: 'timeline-year-2016',
    classes: ['timeline-year', 'adjacent'],
    title: '2016',
    events_attributes: [
      # Event - Group: Unspecified
      {
        slug: 'timeline-event-group-2016-unspecified',
        classes: ['timeline-month', 'unspecified'],
        events_attributes: [
          # Event: Unspecified
          {
            slug: 'timeline-event-group-2016-unspecified-unspecified',
            classes: ['timeline-event'],
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy"><strong class="eggplant-100">CEO Craig Rouskey was in IndieBio Batch 3</strong> and founded Bionascent, Inc.</p>
                '
              }
            ]
          }
        ]
      }
    ]
  },

  # Event - Group: 2019
  {
    slug: 'timeline-year-2019',
    classes: ['timeline-year', 'adjacent'],
    title: '2019',
    events_attributes: [
      # Event - Group: Unspecified
      {
        slug: 'timeline-event-group-2019-unspecified',
        classes: ['timeline-month', 'unspecified'],
        events_attributes: [
          # Event: Unspecified
          {
            slug: 'timeline-event-group-2019-unspecified-unspecified',
            classes: ['timeline-event'],
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy"><strong class="eggplant-100">CEO Craig Rouskey was in IndieBio Batch 9 as well,</strong> to found Pando Nutrition, Inc.; along with our VP of Product Development Gabriel Paulino, who founded BioLumen.</p>
                '
              }
            ]
          }
        ]
      }
    ]
  },

  # Event - Group: 2020
  {
    slug: 'timeline-year-2020',
    classes: ['timeline-year'],
    title: '2020',
    events_attributes: [
      # Event - Group: March 2020
      {
        slug: 'timeline-event-group-2020-mar',
        classes: ['timeline-month'],
        title: 'mar',
        events_attributes: [
          {
            slug: 'timeline-event-group-2020-mar-march-11',
            classes: ['timeline-event'],
            title: 'March 11',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">When WHO declared the pandemic, Craig, Gabriel pivoted to create renegade.bio</p>
                '
              }
            ]
          },
          {
            slug: 'timeline-event-group-2020-mar-march-18',
            classes: ['timeline-event'],
            title: 'March 18',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">renegade.bio officially became a Public Benefit Corporation</p>
                '
              }
            ]
          },
          {
            slug: 'timeline-event-group-2020-mar-march-24',
            classes: ['timeline-event'],
            title: 'March 24',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Created our COVID test, conducted testing in the Bay Area</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: April 2020
      {
        slug: 'timeline-event-group-2020-apr',
        classes: ['timeline-month'],
        title: 'apr',
        events_attributes: [
          {
            slug: 'timeline-event-group-2020-apr-april-4',
            classes: ['timeline-event'],
            title: 'April 4',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Operated our first COVID lab in NYC</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: June 2020
      {
        slug: 'timeline-event-group-2020-jun',
        classes: ['timeline-month'],
        title: 'jun',
        events_attributes: [
          {
            slug: 'timeline-event-group-2020-jun-june-1',
            classes: ['timeline-event'],
            title: 'June',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Received our CLIA license</p>
                '
              }
            ]
          },
          {
            slug: 'timeline-event-group-2020-jun-june-2',
            classes: ['timeline-event'],
            title: 'June',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Launched Test The People at San Francisco at Pride, testing nearly 600 participants in under 48 hours; this proved we could run ~300 tests per day</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: September 2020
      {
        slug: 'timeline-event-group-2020-sep',
        classes: ['timeline-month'],
        title: 'sep',
        events_attributes: [
          {
            slug: 'timeline-event-group-2020-sep-september',
            classes: ['timeline-event'],
            title: 'September',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Became the first lab in the West Coast authorized to run SalivaDirect&trade;</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: October 2020
      {
        slug: 'timeline-event-group-2020-oct',
        classes: ['timeline-month'],
        title: 'oct',
        events_attributes: [
          {
            slug: 'timeline-event-group-2020-oct-october',
            classes: ['timeline-event'],
            title: 'October',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Launched our collection site at CHORI</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: November 2020
      {
        slug: 'timeline-event-group-2020-nov',
        classes: ['timeline-month'],
        title: 'nov',
        events_attributes: [
          {
            slug: 'timeline-event-group-2020-nov-november',
            classes: ['timeline-event'],
            title: 'November',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Partnered with Microgenesis to validate and bring their novel fertility health test to market in the U.S.</p>
                '
              }
            ]
          },
          {
            slug: 'timeline-event-group-2020-nov-november-december',
            classes: ['timeline-event'],
            title: 'November - December',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Performed community 6,886 free tests for UCSF and Unidos en Salud as part of a UCSF research study to determine peak transmissibility using Binax Now cards alongside clinical Analysis of our rXP assay</p>
                '
              }
            ]
          }
        ]
      }
    ]
  },

  # Event - Group: 2021
  {
    slug: 'timeline-year-2021',
    classes: ['timeline-year'],
    title: '2021',
    events_attributes: [
      # Event - Group: January 2021
      {
        slug: 'timeline-event-group-2021-jan',
        classes: ['timeline-month'],
        title: 'jan',
        events_attributes: [
          {
            slug: 'timeline-event-group-2021-jan-january',
            classes: ['timeline-event'],
            title: 'January',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Launched SalivaDirect&trade;</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: February 2021
      {
        slug: 'timeline-event-group-2021-feb',
        classes: ['timeline-month'],
        title: 'feb',
        events_attributes: [
          {
            slug: 'timeline-event-group-2021-feb-february',
            classes: ['timeline-event'],
            title: 'February',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy"><a href="https://primary.health/" rel="noopener" target="_blank">Primary</a>, in coordination with renegade.bio IT, activated the single barcode scan, allowing people to self-register, administer, and self scan their saliva tubes anywhere</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: June 2021
      {
        slug: 'timeline-event-group-2021-jun',
        classes: ['timeline-month'],
        title: 'jun',
        events_attributes: [
          {
            slug: 'timeline-event-group-2021-jun-june',
            classes: ['timeline-event'],
            title: 'June',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Partnered with biotech company Metabolomic Dx to bring PrePsia–for early detection of preeclampsia risks–to market</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: September 2021
      {
        slug: 'timeline-event-group-2021-sep',
        classes: ['timeline-month'],
        title: 'sep',
        events_attributes: [
          {
            slug: 'timeline-event-group-2021-sep-september',
            classes: ['timeline-event'],
            title: 'September',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Began R&D for cardiovascular</p>
                '
              }
            ]
          }
        ]
      },

      # Event - Group: December 2021
      {
        slug: 'timeline-event-group-2021-dec',
        classes: ['timeline-month'],
        title: 'dec',
        events_attributes: [
          {
            slug: 'timeline-event-group-2021-dec-december',
            classes: ['timeline-event'],
            title: 'December',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Secured our incredible new laboratory in Berkeley</p>
                '
              }
            ]
          }
        ]
      }
    ]
  },

  # Event - Group: 2022
  {
    slug: 'timeline-year-2022',
    classes: ['timeline-year'],
    title: '2022',
    events_attributes: [
      # Event - Group: March 2022
      {
        slug: 'timeline-event-group-2022-mar',
        classes: ['timeline-month'],
        title: 'mar',
        events_attributes: [
          {
            slug: 'timeline-event-group-2022-mar-march',
            classes: ['timeline-event'],
            title: 'March',
            copy_blocks_attributes: [
              {
                content: '
                  <p class="p3 timeline-event-copy">Moved into our new laboratory in Berkeley</p>
                '
              }
            ]
          }
        ]
      }
    ]
  }
]

events.each do |event_attributes|
  puts ''
  puts '###########################################################################'
  puts "Event: "
  puts "#{ap person_attributes[:title]}"
  puts '###########################################################################'
  puts ''

  existing_event = Event.find_by(slug: event_attributes[:slug])
  existing_event.present? ? existing_event.update!(event_attributes) : Event.create!(event_attributes)
end
