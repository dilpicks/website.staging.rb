<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <AccessAcrossThePipeline :data="accessAcrossThePipelineData" :parent="parent" />
    <Pipelines :data="pipelineData" :parent="parent" />
    <LetsInnovateTogether :data="letsInnovateTogetherData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import AccessAcrossThePipeline from '@/partials/website/pages/renegade_reach/AccessAcrossThePipelinePartial.vue'
  import Pipelines from '@/partials/website/pages/renegade_reach/PipelinesPartial.vue'
  import LetsInnovateTogether from '@/partials/website/shared/LetsInnovateTogetherPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'renegade-reach',
    title: 'Renegade reach',
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
          <h5 class="prehead">How We Work</h5>
          <h1 class="h1 magenta-100">
            renegade<br>reach
          </h1>
          <p class="p2">
            Within renegade.bio, we have two areas of focus that work together in tandem to successfully develop and distribute diagnostics to people: <a href="/renegade-science"><strong>renegade science</strong></a> and <strong>renegade reach</strong>.
          </p>
        `,
      },
    ],
    risographs: [
      {
        id: 'yellow-man-holding-smiling-child',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/yellow-man-holding-smiling-child',
        title: 'yellow man holding smiling child',
        alt: 'yellow man holding smiling child',
        width: 2691,
        height: 2718,
      },

      {
        id: 'purple-man-scratching-beard',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/purple-man-scratching-beard',
        title: 'purple man scratching beard',
        alt: 'purple man scratching beard',
        width: 1697,
        height: 1663,
      },

      {
        id: 'pink-woman-with-glasses',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/pink-woman-with-glasses',
        title: 'pink woman with glasses',
        alt: 'pink woman with glasses',
        width: 972,
        height: 1284,
      },
    ],
  }

  // ===========================================================================
  // Access Across The Pipeline Section Data
  // ===========================================================================
  const accessAcrossThePipelineData: IPageData = {
    id: `${parent.id}-section-access-across-the-pipeline`,
    copyBlocks: [
      {
        id: 'content-frame-increasing-access',
        classes: ['content-frame', 'padded', 'align-center'],
        content: `
          <h2 class="h2 magenta-100">
            Increasing access to preventative diagnostics, from pre-natal to end-of-life.
          </h2>
          <p class="p2">
            <strong>Renegade reach</strong> seeks out distribution channels for diagnostics, creating pathways through research and development, into the market, to the people who need them most.
          </p>
        `,
      },

      {
        classes: ['align-center', 'white-text'],
        content: `
          <h2 class="h1 magenta-100">
            Access Across the Pipeline
          </h2>
          <p class="p2">
            We are dedicated to bringing novel technologies to communities that will benefit the most from diagnostics improvements in the Hormones & Fertility Health, and Infectious Disease spaces.
          </p>
          <p class="p2">
            We’ve come to realize that access to these rapid and affordable diagnostics is a problem across the healthcare pipeline:
          </p>
        `,
      },
    ],
    cards: [
      // Biotech Partners & Research Institutions
      {
        id: 'card-hospitals-and-clinics',
        attributes: {
          classes: ['content-frame', 'padded', 'align-center'],
          title: 'Biotech Partners & Research Institutions',
          image: {
            id: 'card-image-biotech-partners',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-brain.svg',
            title: 'Biotech Partners & Research Institutions - Brain Icon',
            alt: 'Brain Icon',
            width: 128,
            height: 128,
          },
          link: {
            id: 'link-biotech-partners-learn-more',
            classes: ['magenta-100', 'button', 'button-pill'],
            type: 'anchor-link',
            href: '#card-biotech-partners-access-solution',
            content: 'Learn More',
          },
        },
      },

      // Hospitals & Clinics
      {
        id: 'card-hospitals-and-clinics',
        attributes: {
          classes: ['content-frame', 'padded', 'align-center'],
          title: 'Hospitals & Clinics',
          image: {
            id: 'card-image-hospitals-and-clinics',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-doctor.svg',
            title: 'Hospitals & Clinics - Doctor Icon',
            alt: 'Doctor Icon',
            width: 155,
            height: 128,
          },
          link: {
            id: 'link-hospitals-and-clinics-learn-more',
            classes: ['magenta-100', 'button', 'button-pill'],
            type: 'anchor-link',
            href: '#card-hospitals-and-clinics-access-solution',
            content: 'Learn More',
          },
        },
      },

      // Businesses/Private Clients & Community Partners
      {
        id: 'card-businesses-private-clients-community-partners',
        attributes: {
          classes: ['content-frame', 'padded', 'align-center'],
          title: 'Businesses/Private Clients & Community Partners',
          image: {
            id: 'card-image-businesses-private-clients-community-partners',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-chart.svg',
            title: 'Businesses/Private Clients & Community Partners - Chart Icon',
            alt: 'Chart Icon',
            width: 128,
            height: 128,
          },
          link: {
            id: 'link-businesses-private-clients-community-partners-learn-more',
            classes: ['magenta-100', 'button', 'button-pill'],
            type: 'anchor-link',
            href: '#card-businesses-clients-community-partners-access-solution',
            content: 'Learn More',
          },
        },
      },
    ],
  }

  // ===========================================================================
  // Pipeline Section Data
  // ===========================================================================
  const pipelineData: IPageData = {
    id: `${parent.id}-section-pipeline`,
    copyBlocks: [
      // CTA
      {
        id: 'diagnostics-to-market-cta',
        classes: ['content-frame', 'padded', 'cta-frame'],
        content: `
          <h3 class="h3 sky-blue-100">
            Are you seeking a partner to help increase access to diagnostics for your community?
          </h2>
          <div class="buttons-container">
            <a href="https://reach.renegade.bio/request_quote" rel="noopener" target="_blank" class="button pill-button lrg">Let Us Know</a>
          </div>
        `,
      },
    ],
    cards: [
      // Biotech Partners & Research Institutions
      {
        id: 'card-biotech-partners-access-solution',
        componentType: 'overlapping-image-card',
        attributes: {
          classes: ['content-frame', 'padded'],
          content: `
            <h2 class="h2 navy-100">
              Biotech Partners & Research Institutions
            </h2>
            <p class="p1">
              We partner in researching and developing novel diagnostics and getting them to market.
            </p>

            <h4 class="h4 p2-semibold magenta-100">
              ACCESS
            </h4>
            <p class="p3">
              Access is an issue for biotech companies seeking to bring their diagnostics to market. With complex regulatory pathways and laboratory licensing requirements—while useful and necessary—this prevents many novel diagnostics from ever making it to market. Communities suffer as a result.
            </p>

            <h4 class="h4 p2-semibold magenta-100">
              SOLUTION
            </h4>
            <p class="p3">
              To solve this, renegade.bio partners with biotech companies to bring their technologies through the R&D stage and into clinics. By partnering with those that can deliver the technologies, we accelerate on-time diagnostics and the downstream benefits are seen in the direct benefits to human health— on-time diagnosis leads to on-time treatment. We also work within the biotechnology community of San Francisco, to support R&D assay development.
            </p>
          `,
          image: {
            id: 'card-image-biotech-partners-access-solution',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/fpo/lab-technician-placeholder-cropped',
            title: 'Biotech Partners & Research Institutions',
            alt: 'FPO - lab-technician-placeholder-cropped',
            width: 2190,
            height: 2892,
          },
        },
      },

      // Hospitals & Clinics
      {
        id: 'card-hospitals-and-clinics-access-solution',
        componentType: 'overlapping-image-card',
        attributes: {
          classes: ['content-frame', 'padded'],
          content: `
            <h2 class="h2 navy-100">
              Hospitals & Clinics
            </h2>
            <p class="p1">
              We have distribution partners to increase access to diagnostics to patients.
            </p>

            <h4 class="h4 p2-semibold magenta-100">
              ACCESS
            </h4>
            <p class="p3">
              Access is an issue for clinicians that need on-time diagnostics to provide better care for patients.
            </p>

            <h4 class="h4 p2-semibold magenta-100">
              SOLUTION
            </h4>
            <p class="p3">
              To solve this, renegade.bio has developed a streamlined distribution process, aligning with local clinics, hospitals, and community groups to create clear channels for delivering affordable diagnostic technologies to people.
            </p>
          `,
          image: {
            id: 'card-image-hospitals-and-clinics-access-solution',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/fpo/blood-pressure-placeholder-cropped',
            title: 'Hospitals & Clinics',
            alt: 'FPO - blood-pressure-placeholder-cropped',
            width: 2190,
            height: 2892,
          },
        },
      },

      // Businesses/Private Clients & Community Partners
      {
        id: 'card-businesses-clients-community-partners-access-solution',
        componentType: 'overlapping-image-card',
        attributes: {
          classes: ['content-frame', 'padded'],
          content: `
            <h2 class="h2 navy-100">
              Businesses/Private Clients & Community Partners
            </h2>
            <p class="p1">
              We partner with local groups and with private companies to further distribution to specific communities and people
            </p>

            <h4 class="h4 p2-semibold magenta-100">
              ACCESS
            </h4>
            <p class="p3">
              Access is an issue for the communities of people whose health is on the line. Life-saving preventative diagnostics often don’t reach the people who need them most – especially with historically underserved communities. In the case of community-level clinics, we provide access to quality care.
            </p>

            <h4 class="h4 p2-semibold magenta-100">
              SOLUTION
            </h4>
            <p class="p3">
              To solve this, renegade.bio proactively identifies at-risk communities, creates the right test for their specific needs, works to lower costs for new testing modalities, increases availability through strategic partnerships, and provides more equitable access to testing, for <strong>all</strong> people.
            </p>
            <p class="p3">
              Some of our community partners include Unidos en Salud, Umoja Health, SF Free Clinic, and UCSF community health programs; and our focus with the TestThePeople initiative.
            </p>
          `,
          image: {
            id: 'card-image-businesses-clients-community-partners-access-solution',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/fpo/tongue-depressor-placeholder-cropped',
            title: 'Businesses/Private Clients & Community Partners',
            alt: 'FPO - tongue-depressor-placeholder-cropped',
            width: 2190,
            height: 2892,
          },
        },
      },
    ],
  }

  // ===========================================================================
  // Lets Innovate Together Section Data
  // ===========================================================================
  const letsInnovateTogetherData: IPageData = {
    id: `${parent.id}-section-lets-innovate-together`,
    risographs: [
      {
        id: 'blue-woman-smiling',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-woman-smiling',
        title: 'blue-woman-smiling',
        alt: 'blue woman smiling',
        width: 2847,
        height: 3642,
      },
    ],
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section {
      &.hero {
        .container {
          row-gap: 6rem;

          @include for-phone-lrg-up {
            row-gap: 8rem;
          }

          @include for-tablet-portrait-mid-up {
            row-gap: 15rem;
          }

          .h1 {
            animation: fadeIn 1800ms ease-out forwards;
            transform: translate(3rem, 0rem) scale(1);
            transform-origin: center;
            opacity: 0;
          }
        }

        .risograph-container {
          justify-content: space-evenly;
          z-index: -1;

          @include for-desktop-mid-up {
            justify-content: flex-end;
          }

          .risograph {
            animation: fadeIn 600ms ease-out forwards;
            opacity: 0;
          }

          #yellow-man-holding-smiling-child {
            position: relative;
            right: unset;
            bottom: 0;

            animation-delay: 0ms;

            @include for-desktop-mid-up {
              position: absolute;
              right: -23.8rem;
              bottom: 4rem;
            }
          }

          #purple-man-scratching-beard {
            left: 0rem;
            bottom: 0rem;

            animation-delay: 600ms;

            @include for-desktop-mid-up {
              left: unset;
              right: 18rem;
              bottom: 3rem;
            }
          }

          #pink-woman-with-glasses {
            right: 0rem;
            bottom: 0rem;

            animation-delay: 1200ms;

            @include for-desktop-mid-up {
              right: -6rem;
              bottom: 12rem;
            }
          }
        }
      }
    }
  }
</style>
