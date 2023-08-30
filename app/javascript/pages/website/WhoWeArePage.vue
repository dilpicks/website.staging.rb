<template>
  <div :id="`${parent.id}-page`" class="page">
    <HeroWhoWeAre :data="heroData" :parent="parent" />
    <div class="section-group">
      <Manifesto :data="manifestoData" :parent="parent" />
      <AndWeAreWhoWeServe :data="andWeAreWhoWeServeData" :parent="parent" />
    </div>
    <PublicBenefitCorporation :data="publicBenefitCorporationData" :parent="parent" />
    <Timeline :data="timelineData" :parent="parent" />
    <TeamBios :data="teamBiosData" :parent="parent" />
    <Investors :data="investorsData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import {
    computed,
    // defineProps,
    // defineComponent,
    inject,
    // nextTick,
    // onBeforeMount,
    onMounted,
    // onUnmounted,
    // reactive,
    // ref,
  } from 'vue'

  import { Emitter } from 'mitt'
  import { storeToRefs } from 'pinia'

  import HeroWhoWeAre from '@/partials/website/pages/who_we_are/HeroWhoWeArePartial.vue'
  import Manifesto from '@/partials/website/pages/who_we_are/ManifestoPartial.vue'
  import AndWeAreWhoWeServe from '@/partials/website/pages/who_we_are/AndWeAreWhoWeServePartial.vue'
  import PublicBenefitCorporation from '@/partials/website/pages/who_we_are/PublicBenefitCorporationPartial.vue'
  import Timeline from '@/partials/website/pages/who_we_are/TimelinePartial.vue'
  import TeamBios from '@/partials/website/pages/who_we_are/TeamBiosPartial.vue'
  import Investors from '@/partials/website/pages/who_we_are/InvestorsPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'

  import { ICard, IPageData, Events } from '@/types/general'
  import { showToast } from '@/utils/showToast'
  import { usePeopleStore } from '@/stores/people.store'

  const parent: IPageData = {
    id: 'who-we-are',
    title: 'Who We Are',
  }

  const peopleStore = usePeopleStore()
  // eslint-disable-next-line prettier/prettier
  const { featuredTeamMembers } = storeToRefs(peopleStore)

  // ===========================================================================
  // Hero Section Data
  // ===========================================================================
  const heroData: IPageData = {
    id: `${parent.id}-section-hero-who-we-are`,
    shapes: [
      {
        id: 'shape-hero-who-we-are',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background-lrg-embedded-text.svg',
        width: 2959,
        height: 1865,
        renderAsSVG: true,
      },
    ],
  }

  // ===========================================================================
  // Manifesto Section Data
  // ===========================================================================
  const manifestoData: IPageData = {
    id: `manifesto`,
    copyBlocks: [
      // in how we run our company.
      {
        classes: [],
        content: `
          <h5 class="prehead">
            We are renegade
          </h6>

          <h2 class="h1 magenta-100">
            in how we run our company.
          </h2>

          <ul class='unmarked-list'>
            <li class="p2">We challenge systems and reject the norm.</li>
            <li class="p2">We celebrate diversity.</li>
            <li class="p2">We focus on community.</li>
            <li class="p2">We lead with integrity.</li>
          </ul>
        `,
      },

      // in our approach to science.
      {
        classes: [],
        content: `
          <h5 class="prehead">
            We are renegade
          </h6>

          <h2 class="h1 sky-blue-100">
            in our approach to science.
          </h2>

          <ul class='unmarked-list'>
            <li class="p2">We demand radical transparency with data.</li>
            <li class="p2">We’re devoted to personal privacy.</li>
            <li class="p2">We push for innovation.</li>
            <li class="p2">We bring novel diagnostics to life.</li>
          </ul>
        `,
      },

      // in how we reach people.
      {
        classes: [],
        content: `
          <h5 class="prehead">
            We are renegade
          </h6>

          <h2 class="h1 eggplant-100">
            in how we reach people.
          </h2>

          <ul class='unmarked-list'>
            <li class="p2">We are solution-oriented.</li>
            <li class="p2">We seek out distribution channels for diagnostics.</li>
            <li class="p2">We create pathways.</li>
            <li class="p2">We are your health advocate.</li>
            <li class="p2">We bring clarity to health education.</li>
          </ul>
        `,
      },

      // And we are who we serve.
      // {
      //   classes: ['align-center'],
      //   content: `
      //     <h2 class="h1 magenta-100">
      //       And we are who we serve.
      //     </h2>

      //     <p class="p2 center">
      //       We have been part of communities that are underfunded, underseen, and underserved. We’ve been disenfranchised. We’re diverse, we’re Queer and we support all things LGBTQ+. We’re women, we’re People of Color. We’re Activists, we’re Scientists. We’re part of the San Francisco Bay Area community.
      //     </p>

      //     <h2 class="h2 navy-100 center">
      //       And we’re here to make a difference.
      //     </h2>
      //   `,
      // },
    ],
  }

  // ===========================================================================
  // And We Are Who We Serve Section Data
  // ===========================================================================
  const andWeAreWhoWeServeData: IPageData = {
    id: `and-we-are-who-we-serve`,
    copyBlocks: [
      // And we are who we serve.
      {
        classes: ['align-center'],
        content: `
          <h2 class="h1 magenta-100">
            and we are who we serve.
          </h2>

          <p class="p2 center">
            We have been part of communities that are underfunded, underseen, and underserved. We’ve been disenfranchised. We’re diverse, we’re Queer and we support all things LGBTQ+. We’re women, we’re People of Color. We’re Activists, we’re Scientists. We’re part of the San Francisco Bay Area community.
          </p>

          <h2 class="h2 navy-100 center">
            and we’re here to make a difference.
          </h2>
        `,
      },
    ],
  }

  // ===========================================================================
  // Public Benefit Corporation Section Data
  // ===========================================================================
  const publicBenefitCorporationData: IPageData = {
    id: `${parent.id}-section-public-benefit-corporation`,
    copyBlocks: [
      {
        id: 'content-frame-public-benefit-corporation',
        classes: ['content-frame', 'padded', 'align-center'],
        content: `
          <h2 class="h1 sky-blue-100">
            A Proud Public Benefit Corporation
          </h2>

          <p class="p2">
            As a Public Benefit Corporation, we are really a People Benefit Company – as we put the person at the center of all we do.
          </p>

          <p class="p2">
            <strong>As a PBC, we are committed to the following:</strong>
          </p>

          <ul class="custom-list">
            <li>
              <h3 class="h2 custom-list-marker">1</h3>
              <p class="p2"><strong>To bring cutting edge assays to life</strong></p>
            </li>
            <li>
              <h3 class="h2 custom-list-marker">2</h3>
              <p class="p2"><strong>To educate and elevate the Clinical Laboratory Sciences & Scientists</strong></p>
            </li>
            <li>
              <h3 class="h2 custom-list-marker">3</h3>
              <p class="p2"><strong>To increase access to testing by reaching people at home</strong></p>
            </li>
          </ul>
        `,
      },
    ],
  }

  // ===========================================================================
  // Timeline Section Data
  // ===========================================================================
  const timelineData: IPageData = {
    id: `${parent.id}-section-timeline`,
    images: [
      // renegade.bio founders
      {
        id: 'renegade-bio-founders-image',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/gabe-craig-renegade-bio-sf-lab-launch-2020',
        title: 'renegade.bio founders',
        alt: 'renegade.bio founders',
        width: 1791,
        height: 1722,
      },

      // Test the People Covid-19 Testing Event at SF Pride Is A Riot
      {
        id: 'test-the-people-covid-19-testing-event-at-sf-pride-is-a-riot-image',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/test-the-people-pride-is-a-riot-2020',
        title: 'Test the People Covid-19 Testing Event at SF Pride Is A Riot',
        alt: 'Test the People Covid-19 Testing Event at SF Pride Is A Riot',
        width: 1791,
        height: 1722,
      },

      // renegade.bio lab personnel
      {
        id: 'renegade-bio-lab-personnel-image',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/heinz-lab-under-the-hood',
        title: 'renegade.bio lab personnel',
        alt: 'renegade.bio lab personnel',
        width: 1791,
        height: 1722,
      },
    ],
    eventCollection: {
      id: 'renegade-timeline-event-collection',
      classes: [],
      eventGroups: [
        // EventGroup: 2016
        {
          id: 'timeline-year-2016',
          classes: ['timeline-year', 'adjacent'],
          title: '2016',
          eventGroups: [
            // EventGroup: Unspecified
            {
              id: 'timeline-event-group-2016-unspecified',
              classes: ['timeline-month', 'unspecified'],
              events: [
                // Event: Unspecified
                {
                  id: 'timeline-event-group-2016-unspecified-unspecified',
                  classes: ['timeline-event'],
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy"><strong class="eggplant-100">CEO Craig Rouskey was in IndieBio Batch 3</strong> and founded Bionascent, Inc.</p>
                      `,
                    },
                  ],
                },
              ],
            },
          ],
        },

        // EventGroup: 2019
        {
          id: 'timeline-year-2019',
          classes: ['timeline-year', 'adjacent'],
          title: '2019',
          eventGroups: [
            // EventGroup: Unspecified
            {
              id: 'timeline-event-group-2019-unspecified',
              classes: ['timeline-month', 'unspecified'],
              events: [
                // Event: Unspecified
                {
                  id: 'timeline-event-group-2019-unspecified-unspecified',
                  classes: ['timeline-event'],
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy"><strong class="eggplant-100">CEO Craig Rouskey was in IndieBio Batch 9 as well,</strong> to found Pando Nutrition, Inc.; along with our VP of Product Development Gabriel Paulino, who founded BioLumen.</p>
                      `,
                    },
                  ],
                },
              ],
            },
          ],
        },

        // EventGroup: 2020
        {
          id: 'timeline-year-2020',
          classes: ['timeline-year'],
          title: '2020',
          eventGroups: [
            // EventGroup: March 2020
            {
              id: 'timeline-event-group-2020-mar',
              classes: ['timeline-month'],
              title: 'mar',
              events: [
                {
                  id: 'timeline-event-group-2020-mar-march-11',
                  classes: ['timeline-event'],
                  title: 'March 11',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">When WHO declared the pandemic, Craig, Gabriel pivoted to create renegade.bio</p>
                      `,
                    },
                  ],
                },
                {
                  id: 'timeline-event-group-2020-mar-march-18',
                  classes: ['timeline-event'],
                  title: 'March 18',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">renegade.bio officially became a Public Benefit Corporation</p>
                      `,
                    },
                  ],
                },
                {
                  id: 'timeline-event-group-2020-mar-march-24',
                  classes: ['timeline-event'],
                  title: 'March 24',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Created our COVID test, conducted testing in the Bay Area</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: April 2020
            {
              id: 'timeline-event-group-2020-apr',
              classes: ['timeline-month'],
              title: 'apr',
              events: [
                {
                  id: 'timeline-event-group-2020-apr-april-4',
                  classes: ['timeline-event'],
                  title: 'April 4',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Operated our first COVID lab in NYC</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: June 2020
            {
              id: 'timeline-event-group-2020-jun',
              classes: ['timeline-month'],
              title: 'jun',
              events: [
                {
                  id: 'timeline-event-group-2020-jun-june-1',
                  classes: ['timeline-event'],
                  title: 'June',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Received our CLIA license</p>
                      `,
                    },
                  ],
                },
                {
                  id: 'timeline-event-group-2020-jun-june-2',
                  classes: ['timeline-event'],
                  title: 'June',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Launched Test The People at San Francisco at Pride, testing nearly 600 participants in under 48 hours; this proved we could run ~300 tests per day</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: September 2020
            {
              id: 'timeline-event-group-2020-sep',
              classes: ['timeline-month'],
              title: 'sep',
              events: [
                {
                  id: 'timeline-event-group-2020-sep-september',
                  classes: ['timeline-event'],
                  title: 'September',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Became the first lab in the West Coast authorized to run SalivaDirect™</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: October 2020
            {
              id: 'timeline-event-group-2020-oct',
              classes: ['timeline-month'],
              title: 'oct',
              events: [
                {
                  id: 'timeline-event-group-2020-oct-october',
                  classes: ['timeline-event'],
                  title: 'October',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Launched our collection site at CHORI</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: November 2020
            {
              id: 'timeline-event-group-2020-nov',
              classes: ['timeline-month'],
              title: 'nov',
              events: [
                {
                  id: 'timeline-event-group-2020-nov-november',
                  classes: ['timeline-event'],
                  title: 'November',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Partnered with Microgenesis to validate and bring their novel fertility health test to market in the U.S.</p>
                      `,
                    },
                  ],
                },
                {
                  id: 'timeline-event-group-2020-nov-november-december',
                  classes: ['timeline-event'],
                  title: 'November - December',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Performed community 6,886 free tests for UCSF and Unidos en Salud as part of a UCSF research study to determine peak transmissibility using Binax Now cards alongside clinical Analysis of our rXP assay</p>
                      `,
                    },
                  ],
                },
              ],
            },
          ],
        },

        // EventGroup: 2021
        {
          id: 'timeline-year-2021',
          classes: ['timeline-year'],
          title: '2021',
          eventGroups: [
            // EventGroup: January 2021
            {
              id: 'timeline-event-group-2021-jan',
              classes: ['timeline-month'],
              title: 'jan',
              events: [
                {
                  id: 'timeline-event-group-2021-jan-january',
                  classes: ['timeline-event'],
                  title: 'January',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Launched SalivaDirect™</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: February 2021
            {
              id: 'timeline-event-group-2021-feb',
              classes: ['timeline-month'],
              title: 'feb',
              events: [
                {
                  id: 'timeline-event-group-2021-feb-february',
                  classes: ['timeline-event'],
                  title: 'February',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy"><a href="https://primary.health/" rel="noopener" target="_blank">Primary</a>, in coordination with renegade.bio IT, activated the single barcode scan, allowing people to self-register, administer, and self scan their saliva tubes anywhere</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: June 2021
            {
              id: 'timeline-event-group-2021-jun',
              classes: ['timeline-month'],
              title: 'jun',
              events: [
                {
                  id: 'timeline-event-group-2021-jun-june',
                  classes: ['timeline-event'],
                  title: 'June',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Partnered with biotech company Metabolomic Dx to bring PrePsia–for early detection of preeclampsia risks–to market</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: September 2021
            {
              id: 'timeline-event-group-2021-sep',
              classes: ['timeline-month'],
              title: 'sep',
              events: [
                {
                  id: 'timeline-event-group-2021-sep-september',
                  classes: ['timeline-event'],
                  title: 'September',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Began R&D for cardiovascular</p>
                      `,
                    },
                  ],
                },
              ],
            },

            // EventGroup: December 2021
            {
              id: 'timeline-event-group-2021-dec',
              classes: ['timeline-month'],
              title: 'dec',
              events: [
                {
                  id: 'timeline-event-group-2021-dec-december',
                  classes: ['timeline-event'],
                  title: 'December',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Secured our incredible new laboratory in Berkeley</p>
                      `,
                    },
                  ],
                },
              ],
            },
          ],
        },

        // EventGroup: 2022
        {
          id: 'timeline-year-2022',
          classes: ['timeline-year'],
          title: '2022',
          eventGroups: [
            // EventGroup: March 2022
            {
              id: 'timeline-event-group-2022-mar',
              classes: ['timeline-month'],
              title: 'mar',
              events: [
                {
                  id: 'timeline-event-group-2022-mar-march',
                  classes: ['timeline-event'],
                  title: 'March',
                  copyBlocks: [
                    {
                      content: `
                        <p class="p3 timeline-event-copy">Moved into our new laboratory in Berkeley</p>
                      `,
                    },
                  ],
                },
              ],
            },
          ],
        },
      ],
    },
  }

  // ===========================================================================
  // Team Bios Section Data
  // ===========================================================================
  const teamBiosData = computed(() => {
    const pageData: IPageData = {
      id: `${parent.id}-section-team-bios`,
      copyBlocks: [
        {
          classes: ['team-bios-block'],
          content: `
            <h2 class="h1 eggplant-100">
              Our Team
            </h2>
          `,
        },
      ],
      // cards: featuredTeamMembers.value,
      cards: featuredTeamMembers.value.map((person) => {
        const personAsProfileCard: ICard = {
          id: person.id,
          componentType: 'profile-card',
          attributes: {
            name: person.attributes.name,
            title: person.attributes.title,
            content: person.attributes.content,
            image: person.attributes.image,
            link: person.attributes.link,
          },
        }

        return personAsProfileCard
      }),
    }

    return pageData
  })

  // ===========================================================================
  // Investors Section Data
  // ===========================================================================
  const investorsData: IPageData = {
    id: `${parent.id}-section-investors`,
    copyBlocks: [
      {
        id: 'content-frame-donation-recipients',
        classes: ['content-frame', 'padded', 'align-center'],
        content: `
          <h2 class="h2 sky-blue-100">
            Renegade.bio is supported by a community of VC firms and outstanding angel investors.
          </h2>
        `,
      },
    ],
    images: [
      // IndieBio
      {
        id: 'indie-bio-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/indie-bio-logo.svg',
        title: 'IndieBio',
        alt: 'IndieBio logo',
        width: 164,
        height: 32,
      },

      // SOSV
      {
        id: 'sosv-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/sosv-logo.svg',
        title: 'SOSV',
        alt: 'SOSV logo',
        width: 132,
        height: 58,
      },
    ],
  }

  // ===========================================================================
  // Mailing List Sign Up Data
  // ===========================================================================
  const mailingListData: IPageData = {
    id: `${parent.id}-section-mailing-list-sign-up`,
    copyBlocks: [
      {
        content: `
          <h3 class="h3 sky-blue-100">Keep up with our latest <strong class="magenta-100">renegade.bio</strong> news</h3>
        `,
      },
    ],
  }

  // ===========================================================================
  // Methods
  // ===========================================================================
  const hydrate = () => {
    peopleStore.index().catch((error) => {
      showToast(error, 'error')
    })
  }

  const emitter = inject('emitter') as Emitter<Events>

  const observeHeight = (selector: string) => {
    const resizeObserver = new ResizeObserver(() => {
      // console.log(`'${selector}' - Height changed...`)
      emitter.emit('elementHeightChange')
    })

    const observedElement = document.querySelector(selector)

    if (observedElement) {
      resizeObserver.observe(observedElement)
    }
  }

  // ===========================================================================
  // Mounted
  // ===========================================================================
  onMounted(() => {
    if (document.querySelector('.page')) {
      observeHeight('.page')
    }

    hydrate()
  })

  // ===========================================================================
  // Created
  // ===========================================================================
</script>

<style setup lang="scss">
  [data-current-page='who-we-are'] {
    > #site-footer {
      z-index: 2;
    }
  }
</style>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  #who-we-are-page {
    // background-color: $--color-theme-background-secondary-dark;
  }

  .section-group {
    background: linear-gradient(0deg, $--color-theme-white 15%, $--color-theme-light-blue-100 100%);
  }

  :deep() {
    .section {
      &.hero {
        @include for-tablet-landscape-up {
          min-height: 47rem;
        }

        .container {
          row-gap: 6rem;

          @include for-phone-lrg-up {
            row-gap: 8rem;
          }

          @include for-tablet-portrait-mid-up {
            row-gap: 15rem;
          }

          .hero-block {
            flex: 0 1 60%;
          }
        }

        #shape-section-hero-header-background {
          left: calc(((2959px - 1304px) / 2) * -1);
          top: -54rem;
          background-position-x: center;
          width: 295.9rem;
        }
      }

      &.public-benefit-corporation {
        > .container {
          @include for-tablet-mid-up {
            margin-top: -6rem;
          }
        }
      }
    }

    #lets-innovate-together {
      padding-top: 4.5rem;
    }
  }
</style>
