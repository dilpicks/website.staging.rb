<template>
  <div :id="`${parent.id}-page`" class="page case-study-microgenesis">
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
            Hormones & Fertility Health
          </h1>
        `,
      },
    ],
    images: [
      {
        id: 'microgenesis-new-moms-and-babies',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/microgenesis-new-moms-and-babies',
        title: 'Microgenesis new moms and babies',
        alt: 'Microgenesis new moms and babies',
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
    id: `${parent.id}-section-case-study-microgenesis`,
    caseStudyDetails: {
      id: 'case-study-details-microgenesis',
      classes: [],
      company: 'Microgenesis',
      headquarters: 'San Francisco, California',
      content: `
        <h6 class="p3-bold eggplant-110 upcase">
          Key Wins
        </h6>
        <ul class="bullet-list">
          <li>Improved process turnaround time and accuracy through automation</li>
          <li>Provided unique insight into the inflammatory state of the reproductive system</li>
          <li>Offered a novel and more accessible pathway to parenthood</li>
        </ul>
      `,
      image: {
        id: 'microgenesis-logo',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/Microgenesis-logo',
        title: 'Microgenesis logo',
        alt: 'Microgenesis logo',
        width: 798,
        height: 164,
      },
    },
    copyBlocks: [
      {
        id: 'microgenesis-intro-block',
        content: `
          <h2 class="h1 navy-100">
            Microgenesis
          </h2>

          <p class="p2">
            Microgenesis transforms fertility health with unparalleled analysis and support of a balanced gut microbiome. Early data indicate that this test has the ability to drive up pregnancy rates in those experiencing unexplained infertility.
          </p>
        `,
      },

      {
        id: 'microgenesis-content-block',
        content: `
          <h3 class="h3 eggplant-100">
            Alignment
          </h3>
          <p class="p3">
            Through extensive research, Microgenesis developed a program to support a healthy pregnancy. Based in Argentina, they were looking for someone to bring their test to the US. In addition to assay validation, Microgenesis was looking for access to the US market and familiarity with regulatory pathways. They came to us at the pre-seed stage through the SOSV network. We worked to validate & verify their technology, improve precision & accuracy, and bring the assay to market.
          </p>

          <h3 class="h3 eggplant-100">
            The Problem
          </h3>
          <p class="p3">
            In the US, more than 50% of miscarriage cases remain unexplained. About 50% of those struggling to conceive are diagnosed with unexplained infertility, and 80% of those who can’t conceive on their own have a gut imbalance.
          </p>

          <h3 class="h3 eggplant-100">
            renegade science
          </h3>
          <p class="p3">
            The technology of Microgenesis is one-of-a-kind; using vaginal biomarkers combined with blood and salivary markers, they provide unique insight into the inflammatory state of the reproductive system. We helped identify verification and validation needs for the assay to be run in a clinical lab setting. To do so, we brought their CTO into our lab to operationalize and optimize the process in order to improve turnaround time and accuracy through automation. With our combined expertise in immunoassays and molecular biology, we’re able to provide high-quality results.
          </p>

          <h3 class="h3 eggplant-100">
            renegade reach
          </h3>
          <p class="p3">
            This kind of technology is a preemptive kind of healthcare, and we want to focus on those who have been overlooked and ignored. Women who find it difficult to become pregnant often exhaust many options at great expense. With Microgenesis, we are able to offer a novel and more accessible pathway to parenthood.
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
