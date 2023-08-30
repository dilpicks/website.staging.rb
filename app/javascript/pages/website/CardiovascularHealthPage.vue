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
    id: 'cardiovascular-health',
    title: 'Cardiovascular Health',
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
            Cardiovascular Health
          </h1>

          <p class="p2">
            By creating tests to help predict the risk of cardiovascular disease, we can improve health outcomes for the #1 killer in the United States.
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
            Cardiovascular Disease
          </h2>

          <p class="p3">
            Our R&D team is currently developing a diagnostic solution to address Cardiovascular Disease (CVD). By leveraging the power of small molecules, we are working to predict cardiovascular disease risk, enabling clinicians and physicians to intervene in this deadly disease much earlier.
          </p>
          <p class="p3">
            655,000 people in the U.S. die annually from cardiovascular conditions; and CVD is the #1 killer in the U.S. Cardiovascular disease is a complex disease with a common root cause—Dislipidemia. From the perspective of prevention and treatment, the biomarkers currently used to detect cardiac disorders are late-stage–which makes it too late to intervene and improve health outcomes. With Long-COVID, we also anticipate the development of acute coronary syndromes as well.
          </p>
          <p class="p3">
            To more appropriately address cardiovascular diseases risk and drive early intervention, we must look at the genetic contributors and external factors that drive cardiovascular diseases. Diet and exercise alone, while key components to CVD risk mitigation, cannot offset a genetic predisposition for CVD. By exploring the small molecules regulating cardiovascular diseases, we can potentially target better cures and support earlier adoption of prophylactics.
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
              655k
            </h3>
            <p class="p3">
              people in the U.S. die annually from cardiovascular conditions
            </p>

            <h3 class="h1 eggplant-100">
              #1
            </h3>
            <p class="p3">
              CVS is the #1 killer in the U.S.
            </p>

            <h3 class="h1 sky-blue-100">
              30m
            </h3>
            <p class="p3">
              Americans are affected by heart disease
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
          classes: [''],
          content: `
            <h3 class="h2 magenta-100">
              Heart diseases disportionately affect certain populations.
            </h3>

            <ul class="arrow-list p3 magenta-100">
              <li class="white p3">
                Heart diseases affect more than 30 million Americans and are the leading cause of death for both men and women.
              </li>
              <li class="white p3">
                Yet, <strong>Black Americans are 30% more likely to die from heart disease</strong> than white Americans.
              </li>
              <li class="white p3">
                Black patients are more likely to have high blood pressure, and it is often more advanced and diagnosed at <strong>an earlier age</strong> than other groups.
              </li>
              <li class="white p3">
                Black patients are also more likely to suffer from health inequities as a result of social determinants of health including <strong>structural and social inequities, distrust in the medical system,</strong> a <strong>lack of nutritious food options</strong> (living in food deserts), and <strong>poor access to medical care.</strong> All can have a direct link to the development of heart disease and heart failure.
              </li>
            </ul>
          `,
          image: {
            id: 'card-image-chart-equitable-care',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-death-rate-by-race.svg',
            title: 'Death Rate by Race Chart',
            alt: 'Death Rate by Race Chart',
            width: 620,
            height: 545,
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
