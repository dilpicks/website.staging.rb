<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <CaseStudiesCollection :data="caseStudiesCollectionData" :parent="parent" />
    <NewsAndPublications :data="newsAndPublicationsData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import CaseStudiesCollection from '@/partials/website/pages/case_studies/CaseStudiesCollectionPartial.vue'
  import NewsAndPublications from '@/partials/website/pages/case_studies/NewsAndPublicationsPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'

  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'case-studies',
    title: 'Case Studies',
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
            Case Studies
          </h5>

          <h1 class="h1 navy-100">
            We are <span>renegade</span> together with our valued partners
          </h1>

          <p class="p2">
           Our partnerships with biotech companies and community groups are what help us bring novel technologies to market, and to the communities of people who need them most. Here’s a look at a few we are working with to create impact together.
          </p>
        `,
      },
    ],
    risographs: [
      {
        id: 'pink-children-smiling',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/pink-children-smiling',
        title: 'pink children smiling',
        alt: 'pink children smiling',
        width: 1800,
        height: 1664,
      },

      {
        id: 'blue-woman-smiling',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-woman-smiling',
        title: 'blue woman smiling',
        alt: 'blue woman smiling',
        width: 1980,
        height: 2529,
      },
    ],
  }

  // ===========================================================================
  // Case Studies Collection Section Data
  // ===========================================================================
  const caseStudiesCollectionData: IPageData = {
    id: `${parent.id}-section-case-studies-collection`,
    tabCollection: {
      id: 'case-studies-tab-collection',
      tabList: [
        // Umoja Health
        {
          id: 'tab-umoja-health-case-study',
          headline: 'Umoja Health',
          image: {
            id: 'umoja-health-sf-bay-area-family',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/tab-umoja-health-sf-bay-area-family',
            title: 'healthy Oakland family',
            alt: 'Mixed race family blowing bubbles in park',
            width: 2490,
            height: 1806,
          },
          content: `
            <p class="p2">
              COVID-19 unequally affected many racial and ethnic minority groups, putting them more at risk. Working with Umoja Health, we were able to tailor our diagnostic distribution strategy to reflect East Oakland's community needs.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'umoja-health',
            content: 'Read More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
        },

        // Metabolomic Dx
        {
          id: 'tab-metabolomic-healthy-family',
          headline: 'Metabolomic Dx',
          image: {
            id: 'metabolomic-healthy-family',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/tab-metabolomic-healthy-family',
            title: 'healthy family',
            alt: 'healthy family',
            width: 2490,
            height: 1806,
          },
          content: `
            <p class="p2">
              PrePsia USA, developed in partnership with Metabolomic Dx, is a comprehensive assessment of biomarkers that allows detection of preeclampsia risks as early as 13 weeks of pregnancy, which could reduce mortality risks by 62%.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'metabolomic',
            content: 'Read More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
        },

        // Microgenesis
        {
          id: 'tab-microgenesis-case-study',
          headline: 'Microgenesis',
          image: {
            id: 'microgenesis-new-moms-and-babies',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/tab-microgenesis-new-moms-and-babies',
            title: 'moms celebrate their babies',
            alt: 'three diverse moms sit on sofa with babies in their laps',
            width: 2490,
            height: 1806,
          },
          content: `
            <p class="p2">
              Microgenesis transforms fertility health with unparalleled analysis and support of a balanced gut microbiome. Early data indicate that this test has the ability to drive up pregnancy rates in those experiencing unexplained infertility.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'microgenesis',
            content: 'Read More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
        },
      ],
    },
  }

  // ===========================================================================
  // News & Publications Section Data
  // ===========================================================================
  const newsAndPublicationsData: IPageData = {
    id: `${parent.id}-section-news-and-publications`,
    copyBlocks: [
      {
        classes: ['news-and-publications-block'],
        content: `
          <h2 class="h1 navy-100">
            News & Publications
          </h2>

          <p class="p2">
            The latest news, research, and testing information from renegade.bio. Check back regularly for our latest updates.
          </p>
        `,
      },
    ],
    cards: [
      {
        id: 'card-press-release-monkey-pox-test',
        attributes: {
          prehead: 'Press Release',
          title:
            'Renegade.bio Launches Monkeypox Test with Fast Result Turn-Around Times of 24 hours',
          content: `
            <p class="p2">
              Renegade.bio, an LGBTQ-owned public benefit corporation, announces highly sensitive and accurate, PCR monkeypox tests with results in 24 hours.
            </p>
          `,
          link: {
            type: 'external',
            href: 'https://res.cloudinary.com/renegade-bio/image/upload/pdfs/Renegade.bio_Launches_Monkeypox_Test_with_Fast_Result_Turn-Around_Times_of_24_hours.pdf',
            rel: 'noopener',
            target: '_blank',
            content: 'Read More',
          },
        },
      },

      {
        id: 'card-press-release-rethinking-diagnostics',
        attributes: {
          prehead: 'Publication',
          title: 'Rethinking Diagnostics to Reduce Healthcare Disparities',
          content: `
            <p class="p2">
              Our first no-cost COVID-19 testing event reached some communities, but we hadn’t reached others. This was a turning point in how we address complex barriers for marginalized communities.
            </p>
          `,
          link: {
            type: 'external',
            href: 'https://res.cloudinary.com/renegade-bio/image/upload/pdfs/renegade-bio-Rethinking-Diagnostics-to-Reduce-Healthcare-Disparities.pdf',
            rel: 'noopener',
            target: '_blank',
            content: 'Read More',
          },
        },
      },

      {
        id: 'card-fertility-health',
        attributes: {
          prehead: 'Press Release',
          title: 'renegade.bio Teams Up with Umoja Health, BayPLS & Alameda County for COVID-19',
          content: `
            <p class="p2">
              Pop Up Site at Children’s Hospital of Oakland Research Institute (CHORI); Stationary Location with One-stop for COVID-19 Vaccine Distribution and Testing
            </p>
          `,
          link: {
            type: 'external',
            href: 'https://res.cloudinary.com/renegade-bio/image/upload/pdfs/renegade.bio_Teams_Up_with_Umoja_Health_BayPLS_and_Alameda_County_for_COVID-19_Vaccine_Distribution_and_Testing_in_Underserved_Bay_Area_Communities.pdf',
            rel: 'noopener',
            target: '_blank',
            content: 'Read More',
          },
        },
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
          <h3 class="h3 sky-blue-100">Keep up with our latest developments in diagnostic testing.</h3>
        `,
      },
    ],
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section {
    &.hero {
      min-height: unset;

      @include for-desktop-mid-up {
        min-height: 75.5rem;
      }

      &:deep() {
        .container {
          row-gap: 5rem;

          @include for-phone-lrg-up {
            row-gap: 6rem;
          }

          @include for-tablet-portrait-mid-up {
            row-gap: 8rem;
          }

          .h1 {
            span {
              --from-color: #{$--color-theme-navy-100};
              --to-color: #{$--color-theme-magenta-100};

              color: var(--from-color);

              animation: fadeColor 1s ease-out forwards;
            }
          }
        }

        .copy-block {
          &.hero-block {
            flex: 0 1 77%;

            @include for-desktop-narrow-to-mid-up {
              justify-content: center;
            }

            p {
              @include for-desktop-narrow-to-mid-up {
                max-width: 79%;
              }
            }
          }
        }

        .risograph-container {
          justify-content: space-evenly;

          @include for-desktop-mid-up {
            justify-content: flex-end;
          }

          .risograph {
            animation: fadeIn 1s ease-out forwards;
            opacity: 0;
          }

          #pink-children-smiling {
            transform: scaleX(-1);

            left: 0rem;
            right: unset;
            bottom: 0rem;

            animation-delay: 0ms;

            @include for-desktop-mid-up {
              transform: scaleX(1);

              left: unset;
              right: 0rem;
            }
          }

          #blue-woman-smiling {
            right: 0;
            bottom: 0;

            animation-delay: 600ms;

            @include for-desktop-mid-up {
              position: absolute;
              right: -35rem;
              bottom: -12.8rem;
            }
          }
        }
      }
    }
  }
</style>
