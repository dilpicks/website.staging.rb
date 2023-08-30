<template>
  <div class="page">
    <Hero :data="heroData" />
    <TrustedPartners :data="trustedPartnersData" />
    <ForEveryonesHealth :data="forEveryonesHealthData" />
    <OurFocus :data="ourFocusData" />
    <Testimonials :data="testimonialsData" />
    <DiagnosticSolutions :data="diagnosticSolutionsData" />
    <CaseStudies :data="caseStudiesData" />
    <LetsInnovateTogether :data="letsInnovateTogetherData" />
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import TrustedPartners from '@/partials/website/pages/home/TrustedPartnersPartial.vue'
  import ForEveryonesHealth from '@/partials/website/pages/home/ForEveryonesHealthPartial.vue'
  import OurFocus from '@/partials/website/pages/home/OurFocusPartial.vue'
  import Testimonials from '@/partials/website/pages/home/TestimonialsPartial.vue'
  import DiagnosticSolutions from '@/partials/website/pages/home/DiagnosticSolutionsPartial.vue'
  import CaseStudies from '@/partials/website/pages/home/CaseStudiesPartial.vue'
  import LetsInnovateTogether from '@/partials/website/shared/LetsInnovateTogetherPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'home',
    title: 'We Are renegade',
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
          <h1 class="h1">
            <span id="text-we-are" class="multiply magenta-100">We Are</span>
            <span id="text-renegade" class="multiply sky-blue-100">renegade</span>
            <span id="text-at-our-core" class="multiply lemon-yellow-100">At Our Core</span>
          </h1>

          <p class="p1">
            We are a purpose-driven, LGBTQ+ led, Public Benefit Corporation, demanding better health and healthcare for all people!
          </p>
        `,
      },
    ],
    risographs: [
      {
        id: 'yellow-person-with-kid',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/yellow-person-with-kid',
        title: 'yellow-person-with-kid',
        alt: 'yellow person with kid',
        width: 1353,
        height: 2313,
      },

      {
        id: 'blue-person-looking-up',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-person-looking-up',
        title: 'blue-person-looking-up',
        alt: 'blue person looking up',
        width: 1012,
        height: 1038,
      },

      {
        id: 'pink-person',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/pink-person',
        title: 'pink-person',
        alt: 'pink person',
        width: 2672,
        height: 2716,
      },
    ],
  }

  // ===========================================================================
  // Trusted Partners Section Data
  // ===========================================================================
  const trustedPartnersData: IPageData = {
    id: `${parent.id}-section-trusted-partners`,
    copyBlocks: [
      {
        classes: ['our-trusted-partners-block'],
        content: `
          <h5 class="prehead sky-blue-100">
            Our Trusted Partners
          </h5>
        `,
      },
    ],
    images: [
      {
        id: 'ucsf-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/UCSF-logo',
        title: 'UCSF',
        alt: 'UCSF logo',
        width: 243,
        height: 120,
      },

      {
        id: 'united-in-health-san-francisco',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/United-in-Health-San-Francisco-logo',
        title: 'United in Health San Francisco',
        alt: 'United in Health San Francisco logo',
        width: 339,
        height: 213,
      },

      {
        id: 'salvia-direct-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Salvia-Direct-logo',
        title: 'Salvia Direct',
        alt: 'Salvia Direct logo',
        width: 615,
        height: 138,
      },

      {
        id: 'the-town-umoja-health-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/The-Town-Umoja-Health-logo',
        title: 'The Town Umoja Health',
        alt: 'The Town Umoja Health logo',
        width: 252,
        height: 258,
      },

      {
        id: 'bay-pls-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Bay-PLS-logo.png',
        title: 'BayPLS',
        alt: 'BayPLS logo',
        width: 219,
        height: 204,
      },
    ],
  }

  // ===========================================================================
  // For Everyone's Health Section Data
  // ===========================================================================
  const forEveryonesHealthData: IPageData = {
    id: `${parent.id}-section-for-everyones-health`,
    shapes: [
      {
        id: 'shape-home-for-everyones-health',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-home-hero-with-embedded-text.svg',
        width: 2959,
        height: 2080,
        renderAsSVG: true,
      },
    ],
  }

  // ===========================================================================
  // Our Focus Section Data
  // ===========================================================================
  const ourFocusData: IPageData = {
    id: `${parent.id}-section-our-focus`,
    copyBlocks: [
      {
        classes: ['our-focus-block'],
        content: `
          <h2 class="h1 navy-100">Our Focus is Two-fold</h2>
        `,
      },
    ],
    cards: [
      {
        id: 'card-renegade-science',
        attributes: {
          title: 'renegade science',
          classes: ['shown'],
          content: `<p class="p2">
            We develop diagnostics that identify disease earlier, faster, and more affordably. We
            create our diagnostics in-house, as well as with biotech partners who are also pushing for
            radically improved health outcomes.
            <br /><br />
            <strong>
              By giving people access to these diagnostics, every person can achieve better health.
            </strong>
          </p>`,
          color: `sky-blue-100`,
          link: {
            id: 'link-renegade-science',
            type: 'route-link',
            href: 'renegade-science',
            content: 'Learn More',
          },
        },
      },

      {
        id: 'card-renegade-reach',
        attributes: {
          title: 'renegade reach',
          content: `<p class="p2">
            We create pathways through the healthcare system for distributing diagnostics to people who
            need them most. We do so through our relationships with Community Groups, Hospitals, Clinics,
            and Research Institutions.
            <br /><br />
            <strong>
              By opening pathways through the system, everyone receives better healthcare.
            </strong>
          </p>`,
          color: `magenta-100`,
          link: {
            id: 'link-renegade-reach',
            type: 'route-link',
            href: 'renegade-reach',
            content: 'Learn More',
          },
        },
      },
    ],
    shapes: [
      {
        id: 'renegade-pathway',
        classes: ['responsive'],
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/graphics/renegade-pathway.svg',
        width: 2364,
        height: 4200,
        renderAsSVG: true,
      },
    ],
  }

  // ===========================================================================
  // Testimonials Section Data
  // ===========================================================================
  const testimonialsData: IPageData = {
    id: `${parent.id}-section-testimonials`,
    galleryItems: [
      {
        id: 'testimonial-lon-hua',
        attibution: 'Lon Hua, Ubiquitome Application Scientist',
        copyBlocks: [
          {
            content: `
              <p class="p1 white">
                <q>
                  renegade.bio executed the study with precision and expertise, while keeping us
                  up-to-date with their latest activities and completed all that was required in a
                  timely manner. The team at renegade.bio provided us with invaluable feedback around
                  the current workflow, protocol programming, user interface, and experience of the
                  Liberty16.
                </q>
              </p>
            `,
          },
        ],
        image: {
          id: 'profile-image-lon-hua',
          src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Ubiquitome-logo.svg',
          title: 'Ubiquitome',
          alt: 'Ubiquitome logo',
          width: 120,
          height: 94,
        },
      },

      {
        id: 'testimonial-gabriela-gutierrez',
        attibution: 'Gabriela Gutierrez, CEO Microgenesis',
        copyBlocks: [
          {
            content: `
              <p class="p1">
                <q>
                  I connected with Craig through IndieBio and after 6 months of collaboration I can tell not
                  only how hard and efficient they work with the higher standards but also the ability to
                  cover the timeline for verification and validation and new potential scientific cooperation.
                </q>
              </p>
            `,
          },
        ],
        image: {
          id: 'profile-image-gabriela-gutierrez',
          src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Microgenesis-logo.svg',
          title: 'Microgenesis',
          alt: 'Microgenesis logo',
          width: 200,
          height: 41,
        },
      },
    ],
  }

  // ===========================================================================
  // Diagnostic Solutions Section Data
  // ===========================================================================
  const diagnosticSolutionsData: IPageData = {
    id: `${parent.id}-section-diagnostic-solutions`,
    copyBlocks: [
      {
        classes: ['diagnostic-solutions-block', 'align-center'],
        content: `
          <h2 class="h1 sky-blue-100">
            Diagnostic Solutions Across Disease Spaces
          </h2>

          <p class="p1">
            We develop diagnostics across multiple disease spaces. Currently, renegade.bio is focused on infectious diseases, hormones and fertility health, and PrEP testings.
          </p>
        `,
      },
    ],
    tabCollection: {
      id: 'diagnostic-solutions-tab-collection',
      tabList: [
        // Infectious Disease Diagnostics
        {
          id: 'tab-infectious-disease-diagnostics',
          headline: 'Infectious Disease Diagnostics',
          image: {
            id: 'lgbtq-prep-testing',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/lgbtq-prep-testing',
            title: 'lgbtq-prep-testing',
            alt: 'lgbtq-prep-testing',
            width: 2490,
            height: 1806,
          },

          // title: 'PrEP Testing for LGBTQ+ Communities',
          // alt: 'Black male couple',
          content: `
            <p class="p2">
              We seek out improved technologies toward testing for infectious diseases, from diagnostic solutions for COVID-19; as well as testing for STIs, and solutions that lead toward improved sexual health.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'infectious-diseases',
            content: 'Learn More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
          // classes: ['magenta-100'],
        },

        // Hormones & Fertility Health
        {
          id: 'tab-hormones-and-fertility-health',
          headline: 'Hormones & Fertility Health',
          image: {
            id: 'healthy-mother-and-child',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/healthy-mother-and-child',
            title: 'Healthy Mother & Child',
            alt: 'Latina mother hugging her infant',
            width: 2490,
            height: 1806,
          },
          content: `
            <p class="p2">
              We develop diagnostics for reproductive health, including testing for preeclampsia – Providing maternal health physicians with the insights to better identify at-risk pregnancies and improve their outcomes.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'reproductive-health',
            content: 'Learn More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
          // classes: ['magenta-100'],
        },

        // // Cardiovascular Health Diagnostics
        // {
        //   id: 'tab-cardiovascular-health-diagnostics',
        //   headline: 'Cardiovascular Health Diagnostics',
        //   image: {
        //     id: 'cardiovascular-health',
        //     src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/cardiovascular-health',
        //     title: 'Cardiovascular Diagnostics',
        //     alt: 'Older man with sunglasses',
        //     width: 2490,
        //     height: 1806,
        //   },
        //   content: `
        //     <p class="p2">
        //       By leveraging the power of small molecules, we are working to predict cardiovascular disease risk, enabling clinicians and physicians to intervene in this deadly disease much earlier.
        //     </p>
        //   `,
        //   link: {
        //     type: 'route-link',
        //     href: 'cardiovascular-health',
        //     content: 'Learn More',
        //     classes: ['magenta-100', 'button', 'button-pill'],
        //   },
        //   // classes: ['magenta-100'],
        // },

        {
          id: 'tab-PrEP-testing',
          headline: 'PrEP Testing',
          image: {
            id: 'prep-testing',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/cardiovascular-health',
            title: 'PrEP Testing',
            alt: 'Older man with sunglasses',
            width: 2490,
            height: 1806,
          },
          content: `
            <p class="p2">
              By providing regular, low-cost and accessible STI & PrEP testing to everyone, we can help to reduce HIV and STI related health disparities and inequities.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'prep-testing',
            content: 'Learn More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
          // classes: ['magenta-100'],
        },

        // Innovations in Diagnostics
        {
          id: 'tab-innovations-in-diagnostics',
          headline: 'Innovations in Diagnostics',
          image: {
            id: 'biotech-innovations-in-diagnostics',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/biotech-innovations-in-diagnostics',
            title: 'Biotech Innovations in Diagnostics',
            alt: 'Lab technicians look in microscope',
            width: 2490,
            height: 1806,
          },
          content: `
            <p class="p2">
              Focused on innovation around disease prevention, we conduct R&D to explore human and planetary diagnostic solutions, leveraging PCR/qRT-PCR, LCMS, NGS, and Cobas.
            </p>
          `,
          link: {
            type: 'route-link',
            href: 'innovations-in-diagnostics',
            content: 'Learn More',
            classes: ['magenta-100', 'button', 'button-pill'],
          },
          // classes: ['magenta-100'],
        },
      ],
    },
  }

  // ===========================================================================
  // Case Studies Section Data
  // ===========================================================================
  const caseStudiesData: IPageData = {
    id: `${parent.id}-section-case-studies`,
    copyBlocks: [
      {
        classes: ['case-studies-block'],
        content: `
          <h2 class="h1 navy-100">
            Case Studies
          </h2>

          <p class="p1">
            We develop diagnostics across multiple disease spaces. Currently, renegade.bio is focused on infectious diseases, reproductive health, and cardiovascular conditions.
          </p>
        `,
      },
    ],
    cards: [
      {
        id: 'card-covid-19',
        attributes: {
          prehead: 'Umoja Health',
          title: 'Community Testing',
          content: `
            <p class="p2">
              Working together with Umoja Health to expand COVID-19 testing, we were able to tailor our diagnostic distribution strategy to reflect the needs of the community, increasing testing across East Oakland, California.
            </p>
          `,
          image: {
            id: 'card-image-case-study-covid-19-umoja-health',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/graphics/umoja-health-logo',
            title: 'The Town Umoja Health',
            alt: 'Umoja Health logo',
            width: 1224,
            height: 711,
          },
          link: {
            id: 'link-case-studies',
            type: 'route-link',
            href: 'umoja-health',
            content: 'See Case Study',
          },
        },
      },

      {
        id: 'card-preeclampsia',
        attributes: {
          prehead: 'Metabolomic Dx',
          title: 'Maternal Health',
          content: `
            <p class="p2">
              In partnership with Metabolomic Dx, renegade.bio developed PrePsia USA, a comprehensive assessment of biomarkers that allows detection of preeclampsia risks as early as 13 weeks of pregnancy.
            </p>
          `,
          image: {
            id: 'card-image-case-study-preeclampsia-metabolomic-dx',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/graphics/metabolomic-dx-logo',
            title: 'Metabolomic Dx',
            alt: 'Metabolomic Dx logo',
            width: 1224,
            height: 711,
          },
          link: {
            id: 'link-case-studies',
            type: 'route-link',
            href: 'metabolomic',
            content: 'See Case Study',
          },
        },
      },

      {
        id: 'card-fertility-health',
        attributes: {
          prehead: 'Microgenesis',
          title: 'Hormones & Fertility Health',
          content: `
            <p class="p2">
              Microgenesis transforms fertility health with unparalleled analysis and support of a balanced vaginal microbiome. Together, we’re able to offer a novel and more accessible pathway to parenthood.
            </p>
          `,
          image: {
            id: 'card-image-case-study-fertility-health-microgenesis',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/graphics/microgenesis-logo',
            title: 'Microgenesis',
            alt: 'Microgenesis logo',
            width: 1224,
            height: 711,
          },
          link: {
            id: 'link-case-studies',
            type: 'route-link',
            href: 'microgenesis',
            content: 'See Case Study',
          },
        },
      },
    ],
  }

  // ===========================================================================
  // Let's Innovate Together Section Data
  // ===========================================================================
  const letsInnovateTogetherData: IPageData = {
    id: `${parent.id}-section-lets-innovate-together`,
    copyBlocks: [
      {
        classes: ['header-block'],
        content: `
          <h2 class="h1 eggplant-100">
            Let’s Innovate Together
          </h2>

          <p class="p2">
            We partner with biotechnology companies to create novel diagnostic solutions.
          </p>

          <div class="buttons-container">
            <a href="https://reach.renegade.bio/request_call" rel="noopener" target="_blank" class="button button-pill">
              Get in Touch
            </a>
          </div>
        `,
      },
    ],
    cards: [
      // {
      //   id: 'card-who-we-are',
      //   attributes: {
      //     title: 'Who We Are',
      //     content: `
      //       <p class="p4">
      //         From how we originated, to who makes up our team, what we create, and the people we serve – we are renegade across all.
      //       </p>
      //     `,
      //     link: {
      //       id: 'link-who-we-are',
      //       type: 'route-link',
      //       href: 'about-us',
      //       content: 'Learn About Us',
      //     },
      //   },
      // },

      {
        id: 'card-join-renegade-bio',
        attributes: {
          title: 'Join renegade.bio',
          content: `
            <p class="p4">
              We’re always on the lookout for talented people who are aligned with our mission.
            </p>
          `,
          link: {
            type: 'external',
            id: 'sub-menu-item-careers',
            classes: ['nav-link'],
            content: 'See Careers',
            href: 'https://renegade-bio.breezy.hr/',
            rel: 'noopener',
            target: '_blank',
          },
        },
      },
    ],
    risographs: [
      {
        id: 'yellow-kid-toss',
        classes: [],
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/yellow-kid-toss',
        title: 'yellow-kid-toss',
        alt: 'yellow kid toss',
        width: 816,
        height: 1932,
      },

      {
        id: 'blue-man',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-man',
        title: 'blue-man',
        alt: 'blue man',
        width: 2202,
        height: 1998,
      },
    ],
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section {
      &.hero {
        min-height: unset;
        padding: 0;
        order: 0;
        min-height: unset;

        @include for-desktop-up {
          min-height: 80rem;
        }

        .container {
          row-gap: 5.9rem;
          justify-content: center;
          padding-bottom: 0;

          @include for-desktop-mid-up {
            justify-content: flex-start;
          }
        }

        .copy-block {
          flex: 0 1 80%;
          row-gap: 5.9rem;

          @include for-desktop-mid-up {
            flex: 0 1 46%;
          }

          .ml-container {
            width: 100%;

            @include for-desktop-mid-up {
              width: unset;
            }

            .h1 {
              display: flex;
              flex-direction: column;
              flex: 1 1 100%;
              line-height: normal;
              text-align: center;
              margin-top: 1rem;

              color: $--color-theme-eggplant-100;

              @include for-desktop-mid-up {
                text-align: left;
              }

              span {
                line-height: 1;
                margin: 0 0 0 0;
                opacity: 0;
                text-transform: uppercase;
                white-space: nowrap;

                animation: fadeIn 1s ease forwards;

                // We Are
                &:nth-of-type(3n + 1) {
                  transform: translate(-5rem, -2rem) scale(1.2);
                  animation-delay: 0ms;
                }

                // renegade
                &:nth-of-type(3n + 2) {
                  margin: -1.5rem 0 -1.25rem 0;
                  text-transform: lowercase;

                  transform: translate(5rem, 0rem) scale(1.2);
                  animation-delay: 600ms;

                  @include for-phone-up {
                    margin: -2.5rem 0 -1.95rem 0;
                  }

                  @include for-tablet-portrait-up {
                    margin: -3.75rem 0 -2.95rem 0;
                  }

                  @include for-desktop-mid-up {
                    margin: -4.1rem 0 -2.9rem 9.2rem;
                  }
                }

                // At Out Core
                &:nth-of-type(3n) {
                  transform: translate(-5rem, 2rem) scale(1.2);
                  animation-delay: 1200ms;
                }
              }
            }

            .p1 {
              max-width: unset;
              text-align: center;

              @include for-desktop-mid-up {
                max-width: 47.7rem;
                text-align: left;
              }
            }
          }
        }

        .risograph-container {
          margin: auto;
          position: relative;
          justify-content: flex-start;
          width: auto;

          --scaling-factor: 0.3;

          transform: scale(var(--scaling-factor));
          min-width: unset;
          height: calc(var(--scaling-factor) * 86rem);
          transform-origin: bottom center;

          justify-content: flex-end;

          // 39.7 is the furthest `right` prop used with #blue-person-looking-up
          margin-right: calc(39.7rem * var(--scaling-factor));

          @include for-phone-lrg-up {
            --scaling-factor: 0.4;
          }

          @include for-phone-lrg-tablet-up {
            --scaling-factor: 0.5;
          }

          @include for-tablet-mid-up {
            --scaling-factor: 0.75;
          }

          @include for-desktop-mid-up {
            position: absolute;

            transform: scale(1);
            height: 66.6rem;
            min-width: 73.4rem;

            margin-right: 0;
          }
        }

        .risograph {
          width: var(--intrinsic-width);

          max-height: var(--intrinsic-height);
          height: var(--intrinsic-height);

          animation: fadeIn 1s ease-in forwards;
          opacity: 0;

          @include for-desktop-mid-up {
            width: var(--intrinsic-width);

            max-height: unset;
            height: var(--intrinsic-height);
          }
        }

        // The three risographs below fade in with
        // the corresponding text

        // We are
        #pink-person {
          right: -30.3rem;
          position: relative;

          animation-delay: 0ms;

          @include for-desktop-mid-up {
            position: absolute;
          }
        }

        // renegade
        #blue-person-looking-up {
          right: 39.7rem;

          animation-delay: 600ms;
        }

        // At Out Core
        #yellow-person-with-kid {
          right: 15.5rem;

          animation-delay: 1200ms;
        }
      }

      &.trusted-partners {
        background-color: $--color-theme-navy-100;
        order: 2;

        @include for-tablet-mid-up {
          order: 1;
          z-index: 4;
        }
      }

      &.for-everyones-health {
        background-color: $--color-theme-navy-100;
        order: 1;
        padding: 0;
        z-index: 5;

        @include for-tablet-mid-up {
          background-color: transparent;
          order: 2;
        }
      }

      &.our-focus {
        order: 3;
      }

      &.testimonials {
        order: 4;
      }

      &.diagnostic-solutions {
        order: 5;
      }

      &.case-studies {
        order: 6;
      }

      &.lets-innovate-together {
        order: 7;

        .risograph-container {
          min-width: unset;

          .risograph {
            width: auto;
            max-width: 100vw;

            height: auto;
            max-height: 100%;

            &#blue-man {
              position: relative;
            }
          }
        }
      }
    }
  }

  @include for-phone-up {
    // Temp for responsive dev
    #site-header {
      display: none;
    }
  }
</style>
