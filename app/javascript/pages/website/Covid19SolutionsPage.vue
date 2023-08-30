<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />

    <InPageNavigation :data="inPageNavigationData" />

    <ForGroups :data="forGroupsData" :parent="parent" />
    <LabPartnerProgram :data="labPartnerProgramData" :parent="parent" />
    <NoCostSolutions :data="noCostSolutionsData" :parent="parent" />
    <ForTravelers :data="forTravelersData" :parent="parent" />
    <OurTests :data="ourTestsData" :parent="parent" />

    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import InPageNavigation from '@/partials/website/shared/InPageNavigationPartial.vue'
  import OurTests from '@/partials/website/pages/covid19_solutions/OurTestsPartial.vue'
  import NoCostSolutions from '@/partials/website/pages/covid19_solutions/NoCostSolutionsPartial.vue'
  import ForTravelers from '@/partials/website/pages/covid19_solutions/ForTravelersPartial.vue'
  import ForGroups from '@/partials/website/pages/covid19_solutions/ForGroupsPartial.vue'
  import LabPartnerProgram from '@/partials/website/pages/covid19_solutions/LabPartnerProgramPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'covid-19-solutions',
    title: 'Covid-19 Solutions',
  }

  // ===========================================================================
  // Hero Section Data
  // ===========================================================================
  const heroData: IPageData = {
    id: `${parent.id}-section-hero`,
    copyBlocks: [
      {
        classes: ['hero-block'],
        content: `
          <h5 class="prehead eggplant-110">
            Meeting Your Testing Needs
          </h6>

          <h1 class="h1 navy-100">
            Covid-19 Solutions
          </h1>

          <p class="p2">
            Improving access to COVID screening is crucial for receiving quality healthcare. At renegade.bio, we strive to provide fast, accurate COVID testing that is accessible to all.
          </p>
        `,
      },
    ],
    risographs: [
      {
        id: 'blue-man-with-long-hair',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-man-with-long-hair',
        title: 'blue-man-with-long-hair',
        alt: 'blue man with long hair',
        width: 1284,
        height: 1044,
      },

      {
        id: 'yellow-woman-with-sunglasses',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/yellow-woman-with-sunglasses',
        title: 'yellow-woman-with-sunglasses',
        alt: 'yellow woman with sunglasses',
        width: 1413,
        height: 1785,
      },

      {
        id: 'pink-person-with-striped-shirt',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/pink-person-with-striped-shirt',
        title: 'pink-person-with-striped-shirt',
        alt: 'pink person with striped shirt',
        width: 2094,
        height: 1758,
      },
    ],
  }

  // ===========================================================================
  // In-Page Navigation Data
  // ===========================================================================
  const inPageNavigationData: IPageData = {
    id: `${parent.id}-in-page-navigation`,
    pageNavItems: [
      {
        id: 'page-nav-item-for-groups',
        link: {
          type: 'anchor-link',
          href: '#for-groups',
          classes: ['page-nav-item'],
          content: 'For Groups',
        },
      },
      {
        id: 'page-nav-item-lab-partner-program',
        link: {
          type: 'anchor-link',
          href: '#lab-partner-program',
          classes: ['page-nav-item'],
          content: 'Lab Partner Program',
        },
      },
      {
        id: 'page-nav-item-no-cost-solutions',
        link: {
          type: 'anchor-link',
          href: '#no-cost-solutions',
          classes: ['page-nav-item'],
          content: 'No Cost Solutions',
        },
      },
      {
        id: 'page-nav-item-for-travelers',
        link: {
          type: 'anchor-link',
          href: '#for-travelers',
          classes: ['page-nav-item'],
          content: 'For Travelers',
        },
      },
      {
        id: 'page-nav-item-our-tests',
        link: {
          type: 'anchor-link',
          href: '#our-tests',
          classes: ['page-nav-item'],
          content: 'Our Tests',
        },
      },
    ],
  }

  // ===========================================================================
  // For Groups Section Data
  // ===========================================================================
  const forGroupsData: IPageData = {
    id: `for-groups`,
    copyBlocks: [
      {
        classes: [],
        content: `
          <h5 class="prehead">
            Covid-19 Solutions
          </h6>

          <h2 class="h1 magenta-100">
            For Groups
          </h2>

          <p class="p2">
            We deliver customizable testing programs to meet your group’s needs, with specialized programs for events, concerts, festivals, production companies, schools and universities.
          </p>

          <p class="p2">
            Continue to keep your workplace, school, or company safe from COVID-19 with regular, ongoing access to fast, accurate COVID-19 testing.
          </p>
        `,
      },
    ],
    accordionList: {
      id: 'for-groups-list',
      accordionItems: [
        {
          id: 'covid-testing-for-groups',
          classes: ['magenta-100', 'active'],
          title:
            'Need COVID testing for your event, school, care facility, production company, or workplace?',
          content: `
            <div class="accordion-description copy-block">
              <div class="button-container">
                <a href="https://reach.renegade.bio/request_quote" rel="noopener" target="_blank" class="button button-pill magenta-100">Get a Quote</a>
              </div>
            </div>

            <div class="content-frame padded">
              <ul class="icon-list">
                <li class="icon-clipboard-list">
                  <h6 class="p3-bold">
                    Setup & Logistics
                  </h6>
                  <p>
                    From pop-up mobile events to on-site clinics, we provide the equipment, supplies, and expertise.
                  </p>
                </li>

                <li class="icon-check">
                  <h6 class="p3-bold">
                    Registration & Scheduling
                  </h6>
                  <p>
                    We provide tools and information to get your community signed up for testing. The Primary web portal makes it all quick and easy.
                  </p>
                </li>

                <li class="icon-thumb-up">
                  <h6 class="p3-bold">
                    Sample Collection
                  </h6>
                  <p>
                    Traffic flow design makes sample collection safe and easy for participants. From check-in to check-out, the entire experience typically takes under 15 minutes.
                  </p>
                </li>

                <li class="icon-beaker">
                  <h6 class="p3-bold">
                    Lab Testing
                  </h6>
                  <p>
                    Our methodology reduces sample collection, preparation, and processing time for faster throughput.
                  </p>
                </li>

                <li class="icon-cursor-click">
                  <h6 class="p3-bold">
                    Results Delivery
                  </h6>
                  <p>
                    Participants receive results within 24 hours via text message with a link to a secure web portal.
                  </p>
                </li>

                <li class="icon-tag">
                  <h6 class="p3-bold">
                    Billing
                  </h6>
                  <p>
                    We can provide COVID testing for your group by billing your employees health insurance.
                  </p>
                </li>

                <li class="icon-annotation">
                  <h6 class="p3-bold">
                    Community Monitoring
                  </h6>
                  <p>
                    Ongoing testing programs keep your community healthy and prevent outbreaks.
                  </p>
                </li>
              </ul>
            </div>
          `,
        },
      ],
    },
  }

  // ===========================================================================
  // Lab Partner Program Section Data
  // ===========================================================================
  const labPartnerProgramData: IPageData = {
    id: `lab-partner-program`,
    copyBlocks: [
      {
        classes: [],
        content: `
          <h5 class="prehead">
            Covid-19 Solutions
          </h6>

          <h2 class="h1 sky-blue-100">
            Lab Partner Program
          </h2>

          <p class="p2">
            renegade.bio’s Lab Partner Program helps your local or regional diagnostic lab serve your community’s COVID-19 testing needs by providing the licensing, expertise, and IT infrastructure partners needed to perform the renegadeXP™ diagnostic tests.
          </p>
        `,
      },
    ],
    accordionList: {
      id: 'lab-partner-program-list',
      accordionItems: [
        {
          id: 'interested-in-becoming-a-lab-partner',
          classes: ['sky-blue-100', 'active'],
          title: 'Interested in becoming a lab partner?',
          content: `
            <div class="accordion-description copy-block">
              <div class="button-container">
                <a href="https://reach.renegade.bio/request_call" target="_blank" class="button button-pill sky-blue-100">Request a Call</a>
              </div>
            </div>

            <div class="content-frame padded">
              <ul class="icon-list">
                <li class="icon-key">
                  <h6 class="p3-bold">
                    Licensing
                  </h6>
                  <p>
                    Highly sensitive, high throughput, environmentally friendly
                  </p>
                </li>

                <li class="icon-light-bulb">
                  <h6 class="p3-bold">
                    Expertise
                  </h6>
                  <p>
                    We provide setup and implementation training, process optimization and automation consulting, and advice on procuring reagents and supplies
                  </p>
                </li>

                <li class="icon-database">
                  <h6 class="p3-bold">
                    IT infrastructure
                  </h6>
                  <p>
                    We implement a scalable LIMS hosted on the Google Cloud platform, with seamless integration, healthcare information portals, and appointment scheduling apps—as well as direct integration with mandatory state health reporting
                  </p>
                </li>
              </ul>
            </div>
          `,
        },
      ],
    },
  }

  // ===========================================================================
  // No Cost Solutions Section Data
  // ===========================================================================
  const noCostSolutionsData: IPageData = {
    id: `no-cost-solutions`,
    copyBlocks: [
      {
        classes: [],
        content: `
          <h5 class="prehead">
            Covid-19 Solutions
          </h6>

          <h2 class="h1 sky-blue-100">
            No Cost Solutions
          </h2>
        `,
      },
    ],
    accordionList: {
      id: 'no-cost-solutions-list',
      accordionItems: [
        {
          id: 'covid-testing-no-cost-solutions-uninsured',
          classes: ['sky-blue-100', 'active'],
          title: 'Are you uninsured and symptomatic?',
          content: `
            <div class="accordion-description copy-block">
              <p>
                For uninsured individuals in need of testing, here are a couple of useful resources:
              </p>

              <div class="button-container">
                <a href="https://covid-19.acgov.org/testing" rel="noopener" target="_blank" class="button button-pill sky-blue-100">
                  Alameda Community Testing
                </a>

                <a href="https://datasf.org/covid19-testing-locations/" rel="noopener" target="_blank" class="button button-pill sky-blue-100">
                  SF Community Testing
                </a>
              </div>
            </div>

            <div class="content-frame padded">
              <h6 class="sky-blue-100 p3-bold">
                Symptoms can include, but are not limited to:
              </h6>

              <ul class="bullet-list">
                <li>Fever or chills</li>
                <li>Cough</li>
                <li>Shortness of breath or difficulty breathing</li>
                <li>Fatigue</li>
                <li>Muscle or body aches</li>

                <li>Headache</li>
                <li>New loss of taste or smell</li>
                <li>Sore throat</li>
                <li>Congestion or runny nose</li>
                <li>Nausea or vomiting</li>
                <li>Diarrhea</li>
              </ul>
            </div>
          `,
        },
      ],
    },
  }

  // ===========================================================================
  // For Travelers Section Data
  // ===========================================================================
  const forTravelersData: IPageData = {
    id: `for-travelers`,
    copyBlocks: [
      {
        classes: [],
        content: `
          <h5 class="prehead">
            Covid-19 Solutions
          </h6>

          <h2 class="h1 eggplant-100">
            For Travelers
          </h2>
        `,
      },
    ],
    accordionList: {
      id: 'for-travelers-list',
      accordionItems: [
        {
          id: 'covid-testing-for-travelers',
          classes: ['eggplant-100', 'active'],
          title: 'If you are traveling, or uninsured and asymptomatic, schedule your test',
          content: `
            <div class="accordion-description copy-block">
              <div class="button-container">
                <a href="https://covid-19.acgov.org/testing" rel="noopener" target="_blank" class="button button-pill eggplant-100">Alameda Community Testing</a>
                <a href="https://datasf.org/covid19-testing-locations/" rel="noopener" target="_blank" class="button button-pill eggplant-100">SF Community Testing</a>
                <a href="tel:8554800771" rel="noopener" class="button button-pill transparent"><span class="eggplant-100">or call +1.855.480.0771</span></a>
              </div>
            </div>

            <div class="content-frame padded">
              <ul class="icon-list">
                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Fast
                  </h6>
                  <p>
                    Results in 12 hours
                  </p>
                </li>

                <li class="icon-beaker">
                  <h6 class="p3-bold">
                    Sensitivity
                  </h6>
                  <p>
                    Highly accurate qRT-PCR test
                  </p>
                </li>

                <li class="icon-cursor-click">
                  <h6 class="p3-bold">
                    Convenient
                  </h6>
                  <p>
                    Schedule online for drive-thru or walk-thru testing
                  </p>
                </li>

                <li class="icon-check">
                  <h6 class="p3-bold">
                    Travel-Ready
                  </h6>
                  <p>
                    Downloadable travel letter meets nearly all air travel requirements
                  </p>
                </li>

                <li class="icon-tag">
                  <h6 class="p3-bold">
                    Pricing
                  </h6>
                  <p>
                    $200 per test includes downloadable travel letter
                  </p>
                </li>
              </ul>
            </div>
          `,
        },
      ],
    },
  }

  // ===========================================================================
  // Our Tests Section Data
  // ===========================================================================
  const ourTestsData: IPageData = {
    id: `our-tests`,
    copyBlocks: [
      {
        classes: [],
        content: `
          <h5 class="prehead">
            Covid-19 Solutions
          </h6>

          <h2 class="h1 magenta-100">
            Our Tests
          </h2>

          <p class="p2">
            We perform the SalivaDirect™ and renegadeXP™ diagnostic test methods, along with variant next generation sequencing (NGS) at our CAP accredited and CLIA certified laboratory in Oakland.
          </p>

          <p class="p2">
            Tests are performed by qRT-PCR (also called PCR or qPCR), the gold standard for diagnostic accuracy. Results are available within 24 hours of samples being received at the lab.
          </p>
        `,
      },
    ],
    accordionList: {
      id: 'our-tests-list',
      accordionItems: [
        {
          id: 'covid-19-roche-cobas-diagnostic',
          classes: ['magenta-100'],
          title: 'COVID-19 Roche Cobas Diagnostic',
          content: `
            <div class="accordion-description copy-block">
              <p>
                cobas® SARS-CoV-2 for use on the cobas® 6800/8800 Systems is a real-time RT-PCR test intended for the qualitative detection of nucleic acids from SARS-CoV-2.
              </p>
              <p>
                Nasal and nasopharyngeal swab specimens, as well as oropharyngeal swab specimens, are collected on site from any persons, including those who are suspected of the COVID-19 virus.
              </p>
            </div>

            <div class="content-frame padded">
              <ul class="icon-list">
                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Fast
                  </h6>
                  <p>
                    Same-day testing 7 days a week and results in 12 hours
                  </p>
                </li>

                <li class="icon-cursor-click">
                  <h6 class="p3-bold">
                    Easy
                  </h6>
                  <p>
                    Only requires an oral or nasal swab
                  </p>
                </li>

                <li class="icon-adjustments">
                  <h6 class="p3-bold">
                    Specificity
                  </h6>
                  <p>
                    Full-process controls with negative, positive and internal controls
                  </p>
                </li>

                <li class="icon-check">
                  <h6 class="p3-bold">
                    Accuracy
                  </h6>
                  <p>
                    Dual target assay, specific target unique to SARS-Cov-2 (COVID-19 Coronavirus) along with a conserved region of the E-gene
                  </p>
                </li>

                <li class="icon-beaker">
                  <h6 class="p3-bold">
                    Sensitivity
                  </h6>
                  <p>
                    Analytical sensitivity is greater than or equal to 95%
                  </p>
                </li>
              </ul>
            </div>
          `,
        },

        {
          id: 'covid-19-saliva-direct-diagnostic',
          classes: ['magenta-100'],
          title: 'COVID-19 SalivaDirect™ Diagnostic',
          content: `
            <div class="accordion-description copy-block">
              <p>
                SalivaDirect™ is a process developed at the Yale School of Public Health to test for infection with SARS-CoV-2, the virus that causes COVID-19.
              </p>
              <p>
                SalivaDirect uses a saliva sample, rather than an invasive nasal or throat sample, to detect the presence of the virus. While it relies on a similar molecular process as earlier tests, it simplifies the test process to drive down costs and ease stress on supply chains.
              </p>
            </div>

            <div class="content-frame padded">
              <ul class="icon-list">
                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Fast
                  </h6>
                  <p>
                    Same-day testing 7 days a week and results in 12 hours
                  </p>
                </li>

                <li class="icon-beaker">
                  <h6 class="p3-bold">
                    Sensitivity
                  </h6>
                  <p>
                    Accurate 94% of the time with detection as early as 3 days after exposure
                  </p>
                </li>

                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Non-Invasive
                  </h6>
                  <p>
                    Only requires a saliva sample as opposed to nasal swabs
                  </p>
                </li>

                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Travel-Ready
                  </h6>
                  <p>
                    Meets nearly all air travel requirements
                  </p>
                </li>
              </ul>
            </div>
          `,
        },

        {
          id: 'covid-19-renegadexp-diagnostic',
          classes: ['magenta-100'],
          title: 'COVID-19 renegadeXP™ Diagnostic',
          content: `
            <div class="accordion-description copy-block">
              <p>
                renegadeXP™ is our breakthrough qRT-PCR (also known as PCR or qPCR) diagnostic testing solution. Using samples collected via a quick nasal swab, it delivers results faster and more cost-effectively than the CDC’s SARS-CoV-2 assay.
              </p>
            </div>

            <div class="content-frame padded">
              <ul class="icon-list">
                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Fast
                  </h6>
                  <p>
                    Same-day testing 7 days a week and results in 12 hours
                  </p>
                </li>

                <li class="icon-beaker">
                  <h6 class="p3-bold">
                    Sensitivity
                  </h6>
                  <p>
                    Accurate 99.2% of the time with detection as early as 3 days after exposure
                  </p>
                </li>

                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Reduces Waste
                  </h6>
                  <p>
                    We’ve saved thousands of pounds of plastic
                  </p>
                </li>

                <li class="icon-lightning-bolt">
                  <h6 class="p3-bold">
                    Travel-Ready
                  </h6>
                  <p>
                    Meets nearly all air travel requirements
                  </p>
                </li>
              </ul>
            </div>
          `,
        },
      ],
    },
  }

  // ===========================================================================
  // Mailing List Sign Up Data
  // ===========================================================================
  const mailingListData: IPageData = {
    id: `${parent.id}-section-mailing-list-sign-up`,
    copyBlocks: [
      {
        content: `
          <h3 class="h3 sky-blue-100">Keep up with our latest developments in diagnostic testing.</h3>
        `,
      },
    ],
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section {
      &:not(.hero) {
        &:nth-of-type(odd) {
          background-color: $--color-content-background;
        }

        &:nth-of-type(even) {
          background-color: $--color-content-background-alt;
        }
      }

      &.hero {
        min-height: unset;
        padding-bottom: 0;

        @include for-desktop-mid-up {
          min-height: 60rem;
        }

        .container {
          row-gap: 6rem;
          padding-bottom: 0;
        }

        .copy-block {
          @include for-desktop-mid-up {
            flex: 0 1 38%;
          }

          .h1 {
            animation: fadeIn 1800ms ease-out forwards;
            transform: translate(3rem, 0rem) scale(1);
            transform-origin: center;
            opacity: 0;
          }
        }

        .risograph-container {
          justify-content: center;
          min-width: unset;

          height: calc(var(--scaling-factor) * 61rem);

          @include for-desktop-mid-up {
            justify-content: flex-end;
          }

          .risograph {
            animation: fadeIn 600ms ease-out forwards;
            opacity: 0;
          }

          #blue-man-with-long-hair {
            position: relative;
            left: 24.5rem;
            bottom: 0rem;

            animation-delay: 0ms;

            @include for-desktop-mid-up {
              position: absolute;
              left: unset;
              right: 38rem;
            }
          }

          #yellow-woman-with-sunglasses {
            position: relative;
            left: 2.5rem;
            bottom: 0rem;

            animation-delay: 600ms;

            @include for-desktop-mid-up {
              position: absolute;
              left: unset;
              right: 13rem;
            }
          }

          #pink-person-with-striped-shirt {
            position: relative;
            left: -24.5rem;
            bottom: 0;

            animation-delay: 1200ms;

            @include for-desktop-mid-up {
              position: absolute;
              left: unset;
              right: -30rem;
            }
          }
        }
      }

      .accordion {
        position: static;
      }

      .accordion-item {
        @include for-desktop-mid-up {
          max-width: 55%;
        }

        .accordion-item-content {
          @include for-desktop-mid-up {
            flex: 0 1 100%;
          }
        }
      }
    }

    .copy-block {
      .prehead {
        margin-bottom: 0;
      }
    }
  }
</style>
