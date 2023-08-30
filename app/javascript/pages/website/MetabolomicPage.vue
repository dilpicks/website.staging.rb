<template>
  <div :id="`${parent.id}-page`" class="page case-study-metabolomic">
    <Hero :data="heroData" :parent="parent" />
    <CaseStudyContent :data="caseStudyData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import CaseStudyContent from '@/partials/website/pages/case_studies/CaseStudyContentPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'

  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'case-study',
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
            Maternal Health
          </h1>
        `,
      },
    ],
    images: [
      {
        id: 'metabolomic-healthy-family',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/metabolomic-healthy-family',
        title: 'Metabolomic Dx healthy family',
        alt: 'Metabolomic Dx healthy family',
        width: 3792,
        height: 1398,
      },
    ],
    shapes: [
      {
        id: 'shape-section-hero-header-background',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background-multi-helix.svg',
        width: 2959,
        height: 1952,
      },
    ],
  }

  // ===========================================================================
  // Case Studies Collection Section Data
  // ===========================================================================
  const caseStudyData: IPageData = {
    id: `${parent.id}-section-case-study-metabolomic`,
    caseStudyDetails: {
      id: 'case-study-details-metabolomic',
      classes: [],
      company: 'Metabolomic Dx',
      headquarters: 'Little Island, Country Cork, Ireland',
      content: `
        <h6 class="p3-bold eggplant-110 upcase">
          Key Wins
        </h6>
        <ul class="bullet-list">
          <li>PrePsia USA is the 1st test of its kind on the US market</li>
          <li>Focused on underrepresented biomarkers associated with preeclampsia</li>
          <li>Determined preeclampsia risk as early as week 13 of pregnancy</li>
        </ul>
      `,
      image: {
        id: 'metabolomic-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Metabolomic-Dx-logo',
        title: 'Metabolomic Dx logo',
        alt: 'Metabolomic Dx logo',
        width: 562,
        height: 142,
      },
    },
    copyBlocks: [
      {
        id: 'metabolomic-intro-block',
        content: `
          <h2 class="h1 navy-100">
            Metabolomic Dx
          </h2>

          <p class="p2">
            PrePsia USA, developed in partnership with Metabolomic Dx, is a comprehensive assessment of biomarkers that allows detection of preeclampsia risks as early as 13 weeks of pregnancy. By more readily detecting preeclampsia risk, we can reduce mortality by 62%.
          </p>
        `,
      },

      {
        id: 'metabolomic-content-block',
        content: `
          <h3 class="h3 eggplant-100">
            Alignment
          </h3>
          <p class="p3">
            As part of the larger SOSV network, Metabolomic was looking to expand into the US market and  improve resolution of the algorithm through inclusion of US pregnancies. Their product has been in development for 8 years, and they were searching for a partner. In collaboration with renegade.bio, PrePsia USA will be the first test of its kind on the market.
          </p>

          <h3 class="h3 eggplant-100">
            The Problem
          </h3>
          <p class="p3">
            Preeclampsia occurs in 5% of all first time pregnancies, and is the leading cause of morbidity and mortality for both the mother and fetus/child. Preeclampsia is one of the leading causes of maternal deaths worldwide, which affects approximately 1 in 25 pregnancies in the U.S. and 65,000 women and child deaths annually during childbirth. Black women in particular are three to four times (12%) more likely to die from pregnancy-related causes than white women, according to the U.S. Centers for Disease Control and Prevention.
          </p>

          <h3 class="h3 eggplant-100">
            renegade science
          </h3>
          <p class="p3">
            Metabolomic Dx developed an effective pipeline to identify diagnostic biomarker panels and translate these into clinical assays ready for application in the clinical laboratory. This pipeline combines the biomarker multiplexing capabilities of Mass Spectrometry (LCMS), a powerful analytical technology, with informatics and statistics solutions to deliver diagnostic innovation.
          </p>
          <p class="p3">
            Leveraging the power of LCMS allows us to focus on underrepresented biomarkers associated with preeclampsia. Assessing risk for preeclampsia requires a comprehensive dive into the metabolome. When assessed and calculated correctly, preeclampsia risk can be determined as early as week 13 of pregnancy. Through this partnership, we identified a new technology in need of a pathway to market.
          </p>

          <h3 class="h3 eggplant-100">
            renegade reach
          </h3>
          <p class="p3">
            Every year 70,000 mothers and 500,000 infants die as a direct effect of preeclampsia—affecting approximately 1 in 25 pregnancies in the U.S. Beyond fatality, there are other complications and life-long impacts of preeclampsia for both mother and baby.
          </p>
          <p class="p3">
            Black women specifically are three to four times more likely to die from pregnancy-related causes than White women, according to the U.S. Centers for Disease Control and Prevention. Through our community partnerships, renegade.bio is able to support traditionally underrepresented communities and mitigate loss of life during childbirth and ongoing impacts to health.
          </p>
        `,
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
      &.hero {
        min-height: unset;

        .container {
          row-gap: 3rem;

          @include for-tablet-portrait-up {
            row-gap: 6rem;
          }

          .copy-block,
          > .image-container {
            z-index: 2;
          }

          .hero-block {
            flex: 0 1 100%;

            p {
              max-width: 79%;
            }

            .ml-container {
              width: 100%;
            }
          }
        }

        .image-container {
          flex: 1 1 auto;

          @include for-desktop-narrow-up {
            margin-bottom: -19rem;
          }

          img {
            width: 100%;
          }
        }

        #shape-section-hero-header-background {
          top: -12rem;
          left: unset;

          max-height: calc(100% + 12rem);
          width: 198.3rem;
          background-position-x: 18rem;
          background-position-y: -18rem;

          @include for-tablet-portrait-mid-up {
            background-position-x: 0rem;
          }

          @include for-desktop-mid-up {
            left: 34rem;
            background-position-y: -20rem;
          }
        }
      }
    }
  }
</style>
