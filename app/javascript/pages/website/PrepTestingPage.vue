<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <CardiovascularDisease :data="preeclampsiaData" :parent="parent" />
    <EquitableCare :data="equitableCareData" :parent="parent" :debug="false" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import CardiovascularDisease from '@/partials/website/pages/cardiovascular_health/CardiovascularDiseasePartial.vue'
  import EquitableCare from '@/partials/website/shared/EquitableCarePartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'prep-testing',
    title: 'PrEP Testing',
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
          <h1 class="h1 magenta-100">
            PrEP Testing
          </h1>

          <p class="p2">
            By providing regular, low-cost and accessible STI testing to everyone, we can help to reduce HIV and STI related health disparities and inequities.
          </p>
        `,
      },
    ],
    images: [
      {
        id: 'pink-doctor-and-patient',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/pink-doctor-and-patient',
        title: 'pink doctor and patient',
        alt: 'pink doctor and patient',
        width: 1905,
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
  // Cardiovascular Disease Section Data
  // ===========================================================================
  const preeclampsiaData: IPageData = {
    id: `${parent.id}-section-cardiovascular-disease`,
    copyBlocks: [
      {
        classes: ['cardiovascular-disease-block'],
        content: `
          <h2 class="h1 eggplant-100">
            STIs & HIV
          </h2>

          <p class="p3">
            Every year, STIs cost the US healthcare system billions of dollars. According to the CDC, in recent years there have been more reported STI cases than ever before—and this number continues to climb higher each year. The lifetime costs for new STI incidences is estimated at $16 billion in 2018 alone.
          </p>

          <p class="p3">
            While STIs are on the rise in many communities, disparities persist among racial and ethnic communities that create higher rates of infection compared to their non-hispanic, white peers. Gay and bisexual men, transgender women, and non-binary people also experience greater incidences of STI and HIV infections. Those who experience intersectional discrimination due to race or ethnicity are at an especially high risk.
          </p>

          <p class="p3">
            Our R&D team is currently developing a new PCR test panel for people on PrEP that will be able to detect a range of common and not-so-common STIs, including HIV, chlamydia, gonorrhea, and syphilis. This test will reduce the current barriers to STI testing, such as cost, time to results, and access. Our tests will also provide better data with more than 45 STIs included which could reduce annual PrEP testing costs from $626M down to $168M.
          </p>

          <p class="p3">
            By accelerating the time to results, we can make STI and PrEP testing more accessible, affordable, and improve the health of people everywhere by reducing the long-term costs and impacts of STIs.
          </p>
        `,
      },
    ],
    cards: [
      // Cardiovascular Disease
      {
        id: 'card-chart-cardiovascular-disease',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['content-frame', 'padded'],
          content: `
            <h3 class="h1 magenta-100">
              ≥ 70%
            </h3>
            <p class="p3">
              of new HIV infections in the US occur in Black + Brown People, and/or gay + bisexual men
            </p>

            <h3 class="h1 eggplant-100">
              3x
            </h3>
            <p class="p3">
              greater prevalence of new HIV cases in Black trans women
            </p>

            <h3 class="h1 sky-blue-100">
              49%
            </h3>
            <p class="p3">
              of new HPV infections in young people aged 15-24
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
            <h3 class="h2 magenta-100">
              STIs & HIV disportionately affect certain populations.
            </h3>

            <h4 class="h4 magenta-100">LGBTQIA+</h5>
            <p class="p3 white">
              Heart diseases affect more than 30 million Americans and are the leading cause of death for both men and women.
            </p>

            <h4 class="h4 magenta-100">Minority Racial & Ethnic Communities</h5>
            <p class="p3 white">
              While STIs are on the rise, we know disparities persist in racial groups that create higher infection rates compared to their non-Hispanic white peers.
            </p>

            <h4 class="h4 magenta-100">At-Risk Age Groups</h5>
            <p class="p3 white">
              Young people, ages 15–24, are disproportionately affected by STIs, while people over 55 are the fastest growing demographic of those with STIs.
            </p>

            <h4 class="h4 magenta-100">Low-Income & Underserved</h5>
            <p class="p3 white">
              Due to a variety of factors—lack of insurance, transportation, or time off from work—many people are unable to access proper healthcare.
            </p>
          `,
          image: {
            id: 'card-image-chart-stis-hiv-disproportionately-affect-certain-populations',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-stis-hiv-disproportionately-affect-certain-populations.svg',
            title: 'STIs and HIV Disproportionately Affect Certain Populations chart',
            alt: 'STIs and HIV Disproportionately Affect Certain Populations chart',
            width: 620,
            height: 530,
          },
        },
      },
    ],
    shapes: [
      {
        id: 'shape-section-equitable-care-background',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-site-double-helix-with-bg.svg',
        width: 1194,
        height: 3053,
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
      $image-container-bias: 53%;

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
  }
</style>
