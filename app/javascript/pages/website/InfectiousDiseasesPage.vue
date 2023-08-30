<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <SexualHealth :data="sexualHealthData" :parent="parent" />
    <EquitableCare :data="equitableCareData" :parent="parent" :debug="false" />
    <MonkeyPox :data="monkeyPoxData" :parent="parent" />
    <CovidAndInfluenza :data="covidAndInfluenzaData" :parent="parent" />
    <Covid19 :data="covid19Data" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import SexualHealth from '@/partials/website/pages/infectious_diseases/SexualHealthPartial.vue'
  import EquitableCare from '@/partials/website/shared/EquitableCarePartial.vue'
  import MonkeyPox from '@/partials/website/pages/infectious_diseases/MonkeyPoxPartial.vue'
  import CovidAndInfluenza from '@/partials/website/pages/infectious_diseases/CovidAndInfluenzaPartial.vue'
  import Covid19 from '@/partials/website/pages/infectious_diseases/Covid19Partial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'infectious-diseases',
    title: 'Infectious Diseases',
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
          <h1 class="h1 eggplant-100">
            Infectious Diseases
          </h1>

          <p class="p2">
            We leverage our surveillance efforts to statistically identify areas of need, and create diagnostics that detect and prevent the spread of novel pathogens.
          </p>
        `,
      },
    ],
    images: [
      {
        id: 'purple-scientists-with-test-tubes',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/purple-scientists-with-test-tubes',
        title: 'purple scientists with test tubes',
        alt: 'purple scientists with test tubes',
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
  // Sexual Health Section Data
  // ===========================================================================
  const sexualHealthData: IPageData = {
    id: `${parent.id}-section-sexual-health`,
    copyBlocks: [
      {
        classes: ['sexual-health-block', 'align-center'],
        content: `
          <h2 class="h1 magenta-100">
            STIs & Sexual Health
          </h2>

          <p class="p2">
            Our R&D team is currently developing diagnostic solutions to improve outcomes within sexual health.
          </p>

          <div class="button-container">
            <a href="https://reach.renegade.bio/provideronboarding" rel="noopener" target="_blank" class="button button-pill lrg magenta-100">
              Order Your Test
            </a>
          </div>
        `,
      },
    ],
    cards: [
      // STIs on the Rise in the United States
      {
        id: 'card-chart-sexual-health',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-left'],
          content: `
            <h3 class="h3 eggplant-100">
              STIs on the Rise in the United States
            </h3>
            <p class="p3">
              There are approximately 42.5 million cases of human papillomavirus (HPV) each year, with at least 75% of the reproductive-age population having been exposed. HPV is known to cause numerous reproductive cancers.
            </p>
            <p class="p3">
              Furthermore, 1 in 5 Americans has a sexually transmitted infection, according to the Centers for Disease Control and Prevention. Additionally, they reported that for the 6th consecutive year STD cases are on the rise, from approximately 1.9 million reported new STD cases in 2014 up to 2.6 million in 2019 with racial and ethnic minorities, gay and bisexual men, and youth the most affected.
            </p>
          `,
          image: {
            id: 'card-image-chart-sexual-health',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-stis-on-the-rise.svg',
            title: 'STIs on the Rise Chart',
            alt: 'STIs on the Rise Chart',
            width: 620,
            height: 420,
          },
        },
      },

      // Biotech Partners & Research Institutions
      {
        id: 'card-chart-sexual-health',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-right'],
          content: `
            <h3 class="h3 eggplant-100">
              Antibiotic Resistant Gonorrhea
            </h3>
            <p class="p3">
              Gonorrhea is the United States second most frequently diagnosed bacterial STI, after Chlamydia. Although instances of gonorrhea were at a historic low in 2009, reported cases have increased nearly 92% over the past decade.
            </p>
            <p class="p3">
              Additionally, antibiotic resistant gonorrhea is on the rise, with viable treatment options running out. By 2050, more people are expected to die per year from antimicrobial resistance than cancer.
            </p>
            <p class="p3">
              Through testing and sequencing, we can track antibiotic resistance, and support the development of novel therapeutic strategies against emergent strains of gonorrhea.
            </p>
          `,
          image: {
            id: 'card-image-chart-sexual-health',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-antibiotic-resistant-gonorrhea.svg',
            title: 'Antibiotic-Resistant Gonorrhea Chart',
            alt: 'Antibiotic-Resistant Gonorrhea Chart',
            width: 620,
            height: 468,
          },
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
          classes: [''],
          content: `
            <h3 class="h2 eggplant-60">
              Inequalities Impact Communities
            </h3>

            <p class="p2 white">
              Systemic inequalities—like access, affordability, and communication barriers—all contribute to a greater rate of infection in many communities.
            </p>

            <ul class="arrow-list p3 eggplant-60">
              <li class="white p3">
                African American or Black people are 5-8 times more likely to experience infection
              </li>
              <li class="white p3">
                American Indian or Alaska Native and Native Hawaiian or Other Pacific Islander people are 3-5 times more likely
              </li>
              <li class="white p3">
                Hispanic or Latino people are 1-2 times more likely to become infected
              </li>
              <li class="white p3">
                Gay and bisexual men accounted for nearly half of all 2019 primary and secondary syphilis cases
              </li>
            </ul>
          `,
          // image: {
          //   id: 'card-image-chart-equitable-care',
          //   classes: ['content-frame'],
          //   src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-rates-of-infections.svg',
          //   title: 'Rates of Infections Chart',
          //   alt: 'Rates of Infections Chart',
          //   width: 620,
          //   height: 545,
          // },
        },
      },
    ],
    animationBlock: {
      id: 'rates-of-infections-chart',
      classes: ['content-frame', 'padded', 'animated-chart-frame'],
      copyBlocks: [
        {
          id: 'rates-of-infections-chart-header',
          classes: [],
          content: `
            <h2 class="h2 navy-100">
              Rates of<br>Infections
            </h2>
          `,
        },
      ],
      animation: {
        type: 'fade',
        name: 'rates-of-infections-chart-animation',
        classes: [],
        content: `
          <div class="rates-of-infections-chart-animation animated-chart-container">
            <div class="animated-item-container" id="rates-of-infections-chart-pink">
              <div class="background-container">
                <h3 class="figure-percentage white">1-2x</h3>
              </div>
              <div class="chart-context">
                <p class="magenta-100">
                  <strong>More likely for Hispanic or Latino people</strong>
                </p>
              </div>
            </div>

            <div class="animated-item-container" id="rates-of-infections-chart-blue">
              <div class="background-container">
                <h3 class="figure-percentage white">3-5x</h3>
              </div>
              <div class="chart-context">
                <p class="sky-blue-100">
                  <strong>More likely for American Indian or Alaska Native &amp; Native Hawaiian or other Pacific Islander</strong>
                </p>
              </div>
            </div>

            <div class="animated-item-container" id="rates-of-infections-chart-purple">
              <div class="background-container">
                <h3 class="figure-percentage white">5-8x</h3>
              </div>
              <div class="chart-context">
                <p class="eggplant-100">
                  <strong>More likely for African American or Black people</strong>
                </p>
              </div>
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
  // Monkey Pox Section Data
  // ===========================================================================
  const monkeyPoxData: IPageData = {
    id: `${parent.id}-section-monkey-pox`,
    copyBlocks: [
      {
        classes: ['monkey-pox-block', 'align-center'],
        content: `
          <h2 class="h1 magenta-100">
            Monkeypox
          </h2>

          <p class="p2">
            In partnership with the California Department of Public Health, renegade.bio has begun monkeypox testing as a result of the nationwide outbreak.
          </p>

          <div class="button-container">
            <a href="https://reach.renegade.bio/request_quote" rel="noopener" target="_blank" class="button button-pill lrg magenta-100">
              Request a Quote
            </a>
          </div>
        `,
      },
    ],
    cards: [
      // Biotech Partners & Research Institutions
      {
        id: 'card-chart-monkey-pox',
        componentType: 'adjacent-image-card',
        attributes: {
          content: `
            <p class="p3">
              Monkeypox is a rare viral disease that occurs primarily in remote parts of Central and West Africa, near tropical rainforests. But more recently, we've seen monkeypox cases reach the U.S in at least 44 states and counting. In total, the U.S. has reported more than 10,000 cases since the beginning of May 2022. The total worldwide exceeds 31,000.
            </p>
            <p class="p3">
              Unlike other tests on the market, we use DNA/RNA Shield which inactivates viruses and supports safer monkeypox sample collection. Renegade.bio is here to support early diagnosis of your patients which is essential to better patient care, interrupting disease transmission chains and protecting public health.
            </p>
            <div class="button-container">
              <a href="https://reach.renegade.bio/provideronboarding" rel="noopener" target="_blank" class="button button-pill lrg sky-blue-100">Order Your Test</a>
            </div>
          `,
          image: {
            id: 'card-image-chart-monkey-pox',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-monkey-pox.svg',
            title: 'Monkeypox Chart',
            alt: 'Increase of Monkeypox cases across the us chart',
            width: 620,
            height: 530,
            link: {
              type: 'external',
              href: 'https://www.cdc.gov/poxvirus/monkeypox/response/2022/mpx-trends.html',
              rel: 'noopener',
              target: '_blank',
            },
          },
        },
      },
    ],
  }

  // ===========================================================================
  // Covid & Influenza Section Data
  // ===========================================================================
  const covidAndInfluenzaData: IPageData = {
    id: `${parent.id}-section-covid-and-influenza`,
    copyBlocks: [
      {
        classes: ['covid & Influenza A/B Test-block', 'align-center'],
        content: `
          <h2 class="h1 sky-blue-100">
            COVID & Influenza A/B Test
          </h2>

          <p class="p2">
            renegade.bio's newest assay can detect the presence of and differentiate between SARS-CoV-2 (COVID-19), influenza A virus, and/or influenza B virus RNA (the flu), with high-accuracy results in less than 3 days.
          </p>

          <div class="button-container">
            <a href="https://reach.renegade.bio/request_quote" rel="noopener" target="_blank" class="button button-pill lrg sky-blue-100">
              Request A Quote
            </a>
          </div>
        `,
      },
    ],
    cards: [
      {
        id: 'card-chart-covid-and-influenza',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-left'],
          content: `
            <p class="p3">
              As the pandemic continues, and we head into cold and flu season, it's more important than ever for patients who may be at risk of severe illness, to get tested for both COVID-19 and the flu.
            </p>
            <p class="p3">
              Individuals infected with COVID-19 and/or influenza A/B often experience similar symptoms of coughing, fever, and a runny and/or stuffy nose. Because COVID-19 and the flu share so many similar symptoms, the CDC advises that patients may need testing to confirm a diagnosis. renegade.bio's COVID/Influenza Virus A/B Test will help clinicians and public health officials make more informed decisions about diagnosing and treating patients with these viruses.
            </p>
            <p class="p3">
              Want to find out more about the COVID and Influenza A/B test from renegade?
            </p>
            <div class="button-container">
              <a href="https://reach.renegade.bio/provideronboarding" rel="noopener" target="_blank" class="button button-pill lrg magenta-100">Order Your Test</a>
            </div>
          `,
          image: {
            id: 'card-image-chart-covid-and-influenza',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-covid-influenza.svg',
            title: 'COVID & Influenza A/B Test Chart',
            alt: 'COVID & Influenza A/B Test Chart',
            width: 620,
            height: 440,
            link: {
              type: 'external',
              href: 'https://www.cdc.gov/mmwr/volumes/70/wr/mm7015a7.htm',
              rel: 'noopener',
              target: '_blank',
            },
          },
        },
      },
    ],
  }

  // ===========================================================================
  // Covid-19 Section Data
  // ===========================================================================
  const covid19Data: IPageData = {
    id: `${parent.id}-section-covid-19`,
    copyBlocks: [
      {
        classes: ['covid-19-block', 'align-center'],
        content: `
          <h2 class="h1 magenta-100">
            COVID-19
          </h2>

          <p class="p2">
            We have COVID-19 testing solutions to support a variety of needs: For travelers, for large groups, and no cost solutions. Additionally, our Lab Partner Program helps local and regional diagnostic labs better-serve their communities’ COVID-19 testing needs.
          </p>

          <div class="button-container">
            <a href="/covid-19-solutions" class="button button-pill lrg magenta-100">
              See Our Solutions
            </a>
          </div>
        `,
      },
    ],
    cards: [
      // Biotech Partners & Research Institutions
      {
        id: 'card-chart-covid-19',
        componentType: 'adjacent-image-card',
        attributes: {
          content: `
            <p class="p3">
              In March 2020, when COVID-19 was officially declared a pandemic, renegade.bio quickly sprang into action. Optimizing a process that required extensive labor and preparation, our science directly supported communities by providing PCR testing with less than 24 hour turnaround times starting in June 2020.
            </p>
            <p class="p3">
              During our first year—while our technology was in development—we tested over <strong>40,500 people,</strong> including nearly <strong>7,000 tests provided at no-cost to members of the community.</strong> By our second year, we more than tripled that reach to include <strong>more than 173,000 tests</strong> for Bay Area residents.
            </p>
            <div class="button-container">
              <a href="/case-studies/umoja-health" class="button button-pill lrg sky-blue-100">Read Our Case Study</a>
            </div>
          `,
          image: {
            id: 'card-image-chart-covid-19',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-covid-19.svg',
            title: 'COVID-19 Chart',
            alt: 'COVID-19 Tests Chart',
            width: 620,
            height: 440,
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

  :deep() {
    .section {
      .container {
        .cards {
          .adjacent-image-card {
            .image-container {
              flex: 1 1 auto;
            }
          }
        }
      }
    }

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
          align-content: flex-end;
          align-items: flex-end;
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
            justify-content: flex-end;
            align-items: center;
            align-content: center;
            flex-direction: column;

            margin-bottom: 0;
            min-width: 25.7rem;

            margin-left: -1rem;
            margin-right: -1rem;

            mix-blend-mode: multiply;

            .background-container {
              background-repeat: no-repeat;
              background-size: cover;

              position: relative;
              align-content: flex-end;
              align-items: flex-end;
              justify-content: center;

              min-width: 100%;
              max-width: 100%;
              width: 100%;

              min-height: 100%;
              max-height: 100%;
              height: 100%;
            }

            .figure-percentage {
              position: absolute;

              font-size: 6rem;
              line-height: 1;

              padding: 1rem;
            }

            .chart-context {
              position: relative;
              padding: 1rem;
              padding-bottom: 0;

              @media (min-width: 394px) {
                flex: 0 0 9rem;
              }

              p {
                font-size: 1.2rem;
                line-height: normal;
                text-align: center;

                text-transform: uppercase;
              }
            }

            &:nth-of-type(1) {
              min-width: 11.4rem;
              max-width: 11.4rem;
              width: 11.4rem;

              // min-height: 10.3rem;
              // max-height: 10.3rem;
              // height: 10.3rem;

              .background-container {
                background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-rates-of-infections-pink.svg');

                min-height: 10.3rem;
                max-height: 10.3rem;
                height: 10.3rem;

                // bottom: -10.3rem;
                background-position: center 10.3rem;
              }

              .figure-percentage {
                font-size: 3.5rem;

                @include for-phone-lrg-up {
                  margin-left: -2rem;
                }
              }

              .chart-context {
                @include for-phone-lrg-up {
                  padding-left: 1rem;

                  p {
                    text-align: left;
                  }
                }
              }
            }

            &:nth-of-type(2) {
              min-width: 21rem;
              max-width: 21rem;
              width: 21rem;

              // min-height: 19.2rem;
              // max-height: 19.2rem;
              // height: 19.2rem;

              .background-container {
                background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-rates-of-infections-blue.svg');

                min-height: 19.2rem;
                max-height: 19.2rem;
                height: 19.2rem;

                // bottom: -19.2rem;
                background-position: center 19.2rem;
              }

              .figure-percentage {
                font-size: 6.5rem;
              }

              .chart-context {
                @include for-phone-lrg-up {
                  p {
                    text-align: left;
                  }
                }

                @media (min-width: 394px) {
                  padding-left: 3rem;
                }
              }
            }

            &:nth-of-type(3) {
              min-width: 25.4rem;
              max-width: 25.4rem;
              width: 25.4rem;

              // min-height: 34rem;
              // max-height: 34rem;
              // height: 34rem;

              .background-container {
                background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-rates-of-infections-purple.svg');

                min-height: 34rem;
                max-height: 34rem;
                height: 34rem;

                // bottom: -34rem;
                background-position: center 34rem;
              }

              .figure-percentage {
                font-size: 10rem;
              }

              .chart-context {
                @include for-phone-lrg-up {
                  p {
                    text-align: left;
                  }
                }

                @media (min-width: 628px) {
                  padding-left: 5rem;
                }
              }
            }
          }

          .animated-item-container {
            .chart-context {
              opacity: 0;

              transition-property: opacity;
              transition-duration: 300ms;
              transition-timing-function: ease-out;
            }

            // @media (min-width: 800px) {
            //   transform: translateX(-5rem);
            // }

            .background-container {
              // transition-property: bottom, background;
              transition-property: background;
              transition-duration: 300ms;
              transition-timing-function: ease-out;
            }

            @for $i from 1 to 10 {
              &:nth-of-type(#{$i}) {
                .background-container {
                  transition-delay: 300ms + (($i - 1) * 250ms);
                }

                .chart-context {
                  transition-delay: (300ms + (($i - 1) * 250ms) + 300ms);
                }
              }
            }

            // .background-container {
            //   background-position-y: -100%;

            //   transition-property: background-position;
            //   transition-duration: 300ms;
            //   transition-timing-function: ease-out;

            //   @for $i from 1 to 10 {
            //     &:nth-of-type(#{$i}) {
            //       transition-delay: ($i - 1) * 250ms;
            //     }
            //   }
            // }
          }

          &.animation-triggered {
            .animated-item-container {
              .chart-context {
                opacity: 1;
              }

              .background-container {
                // bottom: 0;
                background-position: center 0;
              }

              // @media (min-width: 800px) {
              //   transform: translateX(0);
              // }

              // .background-container {
              //   background-position-y: 0;
              // }
            }
          }
        }
      }
    }
  }
</style>
