<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <PeoplePlanetProfit :data="peoplePlanetProfitData" :parent="parent" />
    <Donations :data="donationsData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import PeoplePlanetProfit from '@/partials/website/pages/annual_report/PeoplePlanetProfitPartial.vue'
  import Donations from '@/partials/website/pages/annual_report/DonationsPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'annual-report',
    title: 'Annual Report',
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
          <h5 class="prehead">Who We Are</h5>
          <h1 class="h1 navy-100">
            Annual Report
          </h1>
          <p class="p2">
            As a purpose-driven, LGBTQ-led, Public Benefit Corporation, we demand better health and healthcare for all people.
          </p>
        `,
      },
    ],
  }

  // ===========================================================================
  // People Planet Profit Section Data
  // ===========================================================================
  const peoplePlanetProfitData: IPageData = {
    id: `${parent.id}-section-people-planet-profit`,
    copyBlocks: [
      {
        id: 'content-frame-people-planet-profit',
        classes: ['content-frame', 'padded', 'align-center'],
        content: `
          <h2 class="h2 magenta-100">
            renegade.bio is a team of scientists, entrepreneurs, and community organizers, mobilizing as a public benefit corporation in response to the coronavirus pandemic.
          </h2>

          <p class="p2">
            Since our formation, we have focused on expanding access to diagnostics by developing health solutions for everyone—especially historically underserved and underrepresented groups, such as women, LGBTQ+ and BIPOC communities.
          </p>
        `,
      },
    ],
    cards: [
      // People
      {
        id: 'card-people',
        attributes: {
          classes: ['content-frame', 'padded'],
          image: {
            id: 'card-image-people',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/triple-bottom-line-people',
            title: 'Triple Bottom Line People',
            alt: 'Volunteers at Pride Is A Riot COVID-19 Testing Event',
            width: 1224,
            height: 864,
          },
          content: `
            <h3 class="h1 navy-100">
              People
            </h3>

            <h3 class="h1 magenta-100">
              <span id="counter-animation-people-helped" class="counter-animation" data-counter-start="0" data-counter-end="42000" data-counter-duration="3000" data-counter-group="people-planet-profit-counter-group" data-counter-group-size="6">
                42,000
              </span>
            </h3>
            <p class="p3">
              Over 42,000 people helped in our first year (2020).
            </p>

            <h3 class="h1 magenta-100">
              <span id="counter-animation-tests-performed" class="counter-animation" data-counter-start="0" data-counter-end="173000" data-counter-duration="3000" data-counter-group="people-planet-profit-counter-group" data-counter-group-size="6">
                173,000
              </span>
            </h3>
            <p class="p3">
              Total of 173,000 tests performed in 2021; Over 129,000 lives supported via testing.
            </p>
          `,
        },
      },

      // Planet
      {
        id: 'card-planet',
        attributes: {
          classes: ['content-frame', 'padded'],
          image: {
            id: 'card-image-planet',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/triple-bottom-line-planet',
            title: 'Triple Bottom Line Planet',
            alt: 'Hands holding plant in soil',
            width: 1224,
            height: 864,
          },
          content: `
            <h3 class="h1 navy-100">
              Planet
            </h3>

            <h3 class="h1 sky-blue-100">
              <span id="counter-animation-tests-performed" class="counter-animation" data-counter-start="0" data-counter-end="1166" data-counter-duration="3000" data-counter-group="people-planet-profit-counter-group" data-counter-group-size="6">
                1,166
              </span>
            </h3>
            <p class="p3">
              Estimated 1166lbs of plastic waste saved in 2020.
            </p>

            <h3 class="h1 sky-blue-100">
              <span id="counter-animation-tests-performed" class="counter-animation" data-counter-start="0" data-counter-end="2500" data-counter-duration="3000" data-counter-group="people-planet-profit-counter-group" data-counter-group-size="6">
                2,500
              </span>
            </h3>
            <p class="p3">
              Over 2500lbs of plastics saved in 2021.
            </p>
          `,
        },
      },

      // Profit
      {
        id: 'card-profit',
        attributes: {
          classes: ['content-frame', 'padded'],
          image: {
            id: 'card-image-profit',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/biotech-automation',
            title: 'Biotechnology Startup Automated Workflow',
            alt: 'Capped test tubes from overhead',
            width: 1224,
            height: 864,
          },
          content: `
            <h3 class="h1 navy-100">
              Profit
            </h3>

            <h3 class="h1 eggplant-100">
              $<span id="counter-animation-tests-performed" class="counter-animation" data-counter-start="0" data-counter-end="3" data-counter-duration="3000" data-counter-group="people-planet-profit-counter-group" data-counter-group-size="6">3</span>m
            </h3>
            <p class="p3">
              Over $3M in revenue generated in 2020.
            </p>

            <h3 class="h1 eggplant-100">
              $<span id="counter-animation-tests-performed" class="counter-animation" data-counter-start="0" data-counter-end="17" data-counter-duration="3000" data-counter-group="people-planet-profit-counter-group" data-counter-group-size="6">17</span>.2m
            </h3>
            <p class="p3">
              Generated $17.2M of revenue and $3.8M Profit in 2021.
            </p>
          `,
        },
      },
    ],
  }

  // ===========================================================================
  // Donations Section Data
  // ===========================================================================
  const donationsData: IPageData = {
    id: `${parent.id}-section-donations`,
    copyBlocks: [
      {
        id: 'content-frame-donation-recipients',
        classes: ['content-frame', 'padded', 'align-center'],
        content: `
          <h2 class="h1 magenta-100">
            Donations
          </h2>

          <p class="p2 upcase">
            <strong>We Donated to the following organizations in 2021</strong>
          </p>
        `,
      },
    ],
    images: [
      // Open House SF
      {
        id: 'open-house-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/open-house-logo',
        title: 'Open house sf',
        alt: 'Open house sf logo',
        width: 750,
        height: 198,
      },

      // Until There’s a Cure
      {
        id: 'until-theres-a-cure-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/until-theres-a-cure-logo',
        title: 'Until there’s a cure',
        alt: 'Until there’s a cure logo',
        width: 642,
        height: 225,
      },

      // SF AIDS foundation
      {
        id: 'sf-aids-foundation-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/sf-aids-foundation-logo',
        title: 'San Francisco aids foundation',
        alt: 'San Francisco aids foundation logo',
        width: 450,
        height: 450,
      },

      // Team Megan Bugg
      {
        id: 'megans-mission-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/megans-mission-logo',
        title: 'Megan’s mission',
        alt: 'Megan’s mission logo',
        width: 378,
        height: 606,
      },

      // Vaughn’s Wings of Hope
      {
        id: 'vanughns-wings-of-hope-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/vanughns-wings-of-hope-logo',
        title: 'Vaughn’s wings of hope',
        alt: 'Vaughn’s wings of hope logo',
        width: 600,
        height: 155,
      },

      // Community Resource for Science
      {
        id: 'crs-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/crs-logo',
        title: 'Community resources for science',
        alt: 'Community resources for science logo',
        width: 600,
        height: 300,
      },

      // Start Out
      {
        id: 'start-out-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/start-out-logo',
        title: 'Start out',
        alt: 'Start out logo',
        width: 726,
        height: 111,
      },

      // Naturally Proud Network
      {
        id: 'naturally-proud-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/naturally-proud-logo',
        title: 'Naturally proud network',
        alt: 'Naturally proud network logo',
        width: 450,
        height: 450,
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
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  #annual-report-page {
    background-color: $--color-theme-background-secondary-dark;
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
          // background-position-y: -50rem;
          background-position-x: center;
          width: 295.9rem;

          // @include for-desktop-mid-up {
          //   left: 34rem;
          //   background-position-y: -20rem;
          // }
        }
      }
    }
  }
</style>
