<template>
  <div :id="`${parent.id}-page`" class="page">
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
            Creating a diagnostic distribution strategy with Umoja Health
          </h1>
        `,
      },
    ],
    images: [
      {
        id: 'umoja-health-sf-bay-area-family-health',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/umoja-health-sf-bay-area-family-health',
        title: 'umoja health sf bay area family health',
        alt: 'umoja health sf bay area family health',
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
    id: `${parent.id}-section-case-study-umoja-health`,
    caseStudyDetails: {
      id: 'case-study-details-umoja-health',
      classes: [],
      company: 'Umoja Health',
      headquarters: 'East Oakland, California',
      content: `
        <h6 class="p3-bold eggplant-110 upcase">
          Key Wins
        </h6>
        <ul class="bullet-list">
          <li>Over 921 tests administered in 2021</li>
          <li>Expanded test distribution in underserved neighborhoods</li>
          <li>Increased overall testing confidence within the community</li>
        </ul>
      `,
      image: {
        id: 'umoja-health-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Umoja-Health-logo',
        title: 'Umoja Health logo',
        alt: 'Umoja Health logo',
        width: 666,
        height: 698,
      },
    },
    copyBlocks: [
      {
        id: 'umoja-health-intro-block',
        content: `
          <h2 class="h1 navy-100">
            Umoja Health
          </h2>

          <p class="p2">
            COVID-19 has unequally affected many racial and ethnic minority groups, putting them more at risk of getting sick and dying. People of Color experience higher rates of infection, hospitalization and death.
          </p>

          <p class="p2">
            In working with community group Umoja Health, we were able to tailor our diagnostic distribution strategy to reflect community needs, increasing testing across East Oakland, California.
          </p>
        `,
      },

      {
        id: 'umoja-health-content-block',
        content: `
          <h3 class="h3 eggplant-100">
            Alignment
          </h3>
          <p class="p3">
            In order to reach people within the community and increase testing and overall vaccine confidence, we partnered with trusted groups to learn how to address specific community concerns around testing, reaching people within those communities. One example of this kind of alignment is our partnership with Umoja Health, based in East Oakland, California.
          </p>
          <p class="p3">
            Umoja Health in Oakland is part of the UCSF COVID-19 Community Public Health Initiative, which aims to address and improve access to testing and vaccinations to reduce the spread of SARS-CoV-2 in minority communities that experience high rates of infection, hospitalization and death. Umoja Health uses innovative strategies to deliver COVID-19 testing and vaccination at pop-up events for Black communities in Alameda County.
          </p>

          <h3 class="h3 eggplant-100">
            The Problem
          </h3>
          <p class="p3">
            The CDC reports Black people are at 2.5x greater risk for hospitalization and 1.7x greater risk for death than their White peers. Many factors contribute to this disparity, but access to affordable diagnostic tests was noted across notable reports from public health officials. Together with Umoja Health, we focused our attention on East Oakland’s Black community, which makes up nearly 50% of its population. According to founder Dr. Kim Rhoads, residents in underserved Black communities were also apprehensive about invasive nasal swab collection methods—making people less likely to participate in testing.
          </p>

          <h3 class="h3 eggplant-100">
            renegade science
          </h3>
          <p class="p3">
            Renegade.bio offered a solution: the SalivaDirect™ assay developed by Yale School of Medicine, a qRT-PCR test which uses a small saliva sample to detect SARS-CoV-2, versus the more invasive nasal swab. It also provides greater sensitivity and specificity compared to the CDC’s assay.
          </p>

          <h3 class="h3 eggplant-100">
            renegade reach
          </h3>
          <p class="p3">
            Together with Umoja, we made testing more accessible to East Oakland communities, providing 921 tests in 2021. Beyond testing, in a joint effort with Umoja, renegade.bio provided space within existing collection site infrastructure to expand vaccine distribution in underserved neighborhoods.
          </p>
          <p class="p3">
            This partnership directly aligns with renegade.bio’s mission as it helps bridge the gap in access to testing and vaccine rates experienced by local Latinx and Black communities. It is a key example of how renegade.bio is leveraging community partnerships to increase diagnostics in the Bay Area.
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
