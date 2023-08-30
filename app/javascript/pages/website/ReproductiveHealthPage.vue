<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <Preeclampsia :data="preeclampsiaData" :parent="parent" />
    <EquitableCare :data="equitableCareData" :parent="parent" :debug="false" />
    <OurDiagnosticSolution :data="ourDiagnosticSolutionData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import Preeclampsia from '@/partials/website/pages/reproductive_health/PreeclampsiaPartial.vue'
  import EquitableCare from '@/partials/website/shared/EquitableCarePartial.vue'
  import OurDiagnosticSolution from '@/partials/website/pages/reproductive_health/OurDiagnosticSolutionPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'reproductive-health',
    title: 'Reproductive Health',
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
          <h5 class="prehead">Diagnostic Solutions</h5>
          <h1 class="h1 sky-blue-100">
            Hormones & Reproductive Health
          </h1>

          <p class="p2">
            Our focus is in developing diagnostics to help reduce morbidity and mortality for both the mother and fetus/child.
          </p>
        `,
      },
    ],
    images: [
      {
        id: 'blue-woman-pregnant-holding-belly',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/blue-woman-pregnant-holding-belly',
        title: 'blue woman pregnant holding belly',
        alt: 'blue woman pregnant holding belly',
        width: 2175,
        height: 1842,
      },
    ],
    shapes: [
      {
        id: 'shape-section-hero-header-background',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-header-background.svg',
        width: 1983,
        height: 3053,
      },
    ],
  }

  // ===========================================================================
  // Preeclampsia Section Data
  // ===========================================================================
  const preeclampsiaData: IPageData = {
    id: `${parent.id}-section-preeclampsia`,
    copyBlocks: [
      {
        classes: ['preeclampsia-block'],
        content: `
          <h2 class="h1 magenta-100">
            Preeclampsia
          </h2>

          <p class="p3">
            Preeclampsia occurs in 5% of all first time pregnancies, and is the leading cause of morbidity and mortality for both the mother and fetus/child.
          </p>
          <p class="p3">
            Maternal mortality decreased globally by about 38% between 2000 and 2017, yet every year 70,000 mothers and 500,000 infants die as a direct effect of preeclampsia; and in the United States, 15% of premature deliveries are caused by preeclampsia.
          </p>
          <p class="p3">
            And even beyond fatality, there are other complications of preeclampsia: for the mother, this includes cerebrovascular accidents, liver rupture, pulmonary oedema or acute renal failure. As for the baby, the placental deficiency due to preeclampsia puts a constraint on fetal growth, which increases the chance of neonatal morbidity.
          </p>
        `,
      },
    ],
    cards: [
      // Preeclampsia
      {
        id: 'card-chart-preeclampsia',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['content-frame', 'padded'],
          content: `
            <h3 class="h1 magenta-100">
              5%
            </h3>
            <p class="p3">
              of all first time pregnancies experience preeclampsia
            </p>

            <h3 class="h1 eggplant-100">
              #1
            </h3>
            <p class="p3">
              Preeclampsia is the #1 killer of both mother and fetus/child
            </p>

            <h3 class="h1 sky-blue-100">
              15%
            </h3>
            <p class="p3">
              of premature deliveries are caused by preeclampsia
            </p>
          `,
        },
      },
    ],
  }

  // ===========================================================================
  // Equitable Care Section Data
  // ===========================================================================
  const equitableCareData: IPageData = {
    id: `${parent.id}-section-equitable-care`,
    copyBlocks: [
      {
        classes: ['equitable-care-block'],
        content: `
          <h2 class="h1 white">
            An eye on equitable care
          </h2>
        `,
      },
    ],
    cards: [
      // STIs on the Rise in the United States
      {
        id: 'card-chart-equitable-care',
        componentType: 'adjacent-image-card',
        attributes: {
          content: `
            <h3 class="h2 sky-blue-100">
              Inequalities in Infant & Maternal
            </h3>

            <p class="p3 white">
              Black women are three to four times more likely to die from pregnancy-related causes than white women, according to the U.S. Centers for Disease Control and Prevention. Black women have the highest age-adjusted prevalence of preeclampsia (12.4%) compared with Hispanic (8.2%) and white women (7.1%).
            </p>
            <p class="p3 white">
              Preeclampsia is one of the leading causes of maternal deaths worldwide, affecting approximately 1 in 25 pregnancies in the U.S. And those who experience it have an increased risk of developing chronic hypertension and cardiovascular disease later in life.
            </p>
          `,
        },
      },
    ],
    animationBlock: {
      id: 'preeclampsia-by-race-chart',
      classes: ['content-frame', 'padded', 'animated-chart-frame'],
      copyBlocks: [
        {
          id: 'preeclampsia-by-race-chart-header',
          classes: [],
          content: `
            <h2 class="h2 navy-100">
              Prevalence of Preeclampsia<br>by Race
            </h2>
          `,
        },
      ],
      animation: {
        type: 'fade',
        name: 'preeclampsia-by-race-chart-animation',
        classes: [],
        content: `
          <div class="preeclampsia-by-race-chart-animation animated-chart-container">
            <div class="animated-item-container" id="preeclampsia-by-race-chart-black">
              <h3 class="figure-percentage white">
                12.4%
              </h3>
              <p class="p3 white">Black</p>
            </div>

            <div class="animated-item-container" id="preeclampsia-by-race-chart-hispanic">
              <h3 class="figure-percentage white">
                8.2%
              </h3>
              <p class="p3 white">Hispanic</p>
            </div>

            <div class="animated-item-container" id="preeclampsia-by-race-chart-white">
              <h3 class="figure-percentage white">
                7.1%
              </h3>
              <p class="p3 white">White</p>
            </div>
          </div>
        `,
      },
    },
    shapes: [
      {
        id: 'shape-section-equitable-care-background',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-site-double-helix.svg',
        width: 1194,
        height: 3053,
      },
    ],
  }

  // ===========================================================================
  // Our Diagnostic Solution Section Data
  // ===========================================================================
  const ourDiagnosticSolutionData: IPageData = {
    id: `${parent.id}-section-our-diagnostic-solution`,
    copyBlocks: [
      {
        classes: ['preeclampsia-block'],
        content: `
          <h2 class="h1 navy-100">
            Our Diagnostic Solution
          </h2>
        `,
      },
    ],
    cards: [
      // PrePsia by Metabolomic Diagnostics
      {
        id: 'card-prepsia-by-metabolomic-diagnostics',
        attributes: {
          content: `
            <h3 class="h3 sky-blue-100">
              PrePsia by Metabolomic Diagnostics
            </h3>
            <p class="p3">
              We are jointly developing this test with MetabolomicDx, focusing on the U.S. population, and improving upon available assessments by creating a personalized risk profile for individuals. It measures a panel of biomarkers in blood that serves as early indicators of preeclampsia risk. This provides maternal health physicians with the insights to better identify at risk pregnancies and improve their outcomes.
            </p>
          `,
          link: {
            id: 'link-prepsia-by-metabolomic-diagnostics-case-study',
            classes: ['sky-blue-100'],
            type: 'route-link',
            href: 'metabolomic',
            content: 'Read Our Case Study',
          },
        },
      },

      // About Metabolomic Diagnostics
      {
        id: 'card-about-metabolomic-diagnostics',
        attributes: {
          content: `
            <h3 class="h3 sky-blue-100">
              About Metabolomic Diagnostics
            </h3>
            <p class="p3">
              Based in Ireland, Metabolomic Diagnostic’s high-performance R&D team has developed an effective pipeline to firstly identify diagnostic biomarker panels and then translate these panels into clinical assays ready for application in the clinical laboratory. This pipeline combines the biomarker multiplexing capabilities of Mass Spectrometry, a powerful analytical technology, with the company’s own informatics and statistics solutions to deliver diagnostic innovation. This is reflected in Metabolomic Diagnostics’ strong and versatile IP portfolio of technical innovations and biomarkers.
            </p>
          `,
        },
      },
    ],
    images: [
      {
        id: 'image-metabolomic-diagnostics-logo',
        classes: ['content-frame'],
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/graphics/metabolomic-diagnostics-logo',
        title: 'Metabolomic Diagnostics logo',
        alt: 'Metabolomic Diagnostics logo',
        width: 3786,
        height: 615,
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

  :deep() {
    .section.hero {
      gap: 4.6rem;
      min-height: unset;

      $container-gap: 4.6rem;
      $image-container-bias: 60%;

      .container {
        justify-content: space-between;
        max-height: none;
        gap: $container-gap;

        @include for-desktop-mid-up {
          max-height: 60rem;
        }

        .copy-block,
        > .image-container {
          z-index: 2;
        }
      }

      .copy-block {
        .prehead {
          color: $--color-theme-navy-100;
        }

        &.hero-block {
          flex: 1 1 auto;

          @include for-desktop-mid-up {
            flex: 0 1 calc(100% - $image-container-bias);
          }
        }
      }

      .image-container {
        justify-content: center;
        align-self: center;
        flex: 1 1 auto;
        // min-width: 54.4rem;

        @include for-desktop-mid-up {
          justify-content: flex-end;
          flex: 0 1 calc($image-container-bias - $container-gap);
        }

        img {
          width: 100%;
        }
      }

      #shape-section-hero-header-background {
        top: -14rem;
        left: 62rem;
        max-height: calc(100% + 14rem);
        width: 198.3rem;
        background-position-x: 0rem;
        background-position-y: -79rem;
      }
    }

    .section.equitable-care {
      .animated-chart-frame {
        flex: 1 1 auto;
        padding: 2.5rem;

        @include for-tablet-landscape-up {
          flex: 0 1 auto;
          padding: 2.5rem;
        }

        @include for-desktop-narrow-up {
          flex: 0 1 auto;
          padding: 3.5rem;
        }

        .animated-chart-container {
          align-content: center;
          align-items: center;
          flex-wrap: wrap;
          justify-content: center;
          row-gap: 2.1rem;

          margin-top: 3rem;
        }

        .animated-component {
          padding: 0 1rem;
        }

        .animation-container {
          .animated-item-container {
            position: relative;

            flex: 1 1 auto;
            justify-content: center;
            align-items: center;
            align-content: center;
            flex-direction: column;

            margin-bottom: 0;
            min-width: 25.7rem;

            margin-left: -1rem;
            margin-right: -1rem;

            background-repeat: no-repeat;
            background-size: cover;
            border-radius: 2rem;

            mix-blend-mode: multiply;

            .figure-percentage {
              font-size: 6rem;
              line-height: 1;

              padding-top: 1rem;
            }

            &:nth-of-type(1) {
              background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-prevalence-of-preeclampsia-by-race-pink.svg');

              // @media (min-width: 800px) {}
              min-width: 22.1rem;
              max-width: 22.1rem;
              width: 22.1rem;

              min-height: 22.1rem;
              max-height: 22.1rem;
              height: 22.1rem;
            }

            &:nth-of-type(2) {
              background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-prevalence-of-preeclampsia-by-race-blue.svg');

              // @media (min-width: 800px) {}
              min-width: 17.9rem;
              max-width: 17.9rem;
              width: 17.9rem;

              min-height: 17.9rem;
              max-height: 17.9rem;
              height: 17.9rem;

              .figure-percentage {
                font-size: 5rem;
              }
            }

            &:nth-of-type(3) {
              background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-prevalence-of-preeclampsia-by-race-purple.svg');

              // @media (min-width: 800px) {}
              min-width: 16.7rem;
              max-width: 16.7rem;
              width: 16.7rem;

              min-height: 16.7rem;
              max-height: 16.7rem;
              height: 16.7rem;

              .figure-percentage {
                font-size: 4rem;
              }
            }
          }

          .animated-item-container {
            opacity: 0;

            @media (min-width: 800px) {
              transform: translateX(-5rem);
            }

            transition-property: opacity, transform;
            transition-duration: 300ms;
            transition-timing-function: ease-out;

            @for $i from 1 to 10 {
              &:nth-of-type(#{$i}) {
                transition-delay: ($i - 1) * 250ms;
              }
            }
          }

          &.animation-triggered {
            .animated-item-container {
              opacity: 1;

              @media (min-width: 800px) {
                transform: translateX(0);
              }
            }
          }
        }
      }
    }
  }
</style>
