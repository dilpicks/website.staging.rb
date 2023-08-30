<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <DevelopingNovelDiagnostics :data="developingNovelDiagnosticsData" :parent="parent" />
    <OurTechnologyPartners :data="ourTechnologyPartnersData" :parent="parent" />
    <FocusedOnSpecificBiotechnologies
      :data="focusedOnSpecificBiotechnologiesData"
      :parent="parent"
    />
    <LetsInnovateTogether :data="letsInnovateTogetherData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import DevelopingNovelDiagnostics from '@/partials/website/pages/renegade_science/DevelopingNovelDiagnosticsPartial.vue'
  import OurTechnologyPartners from '@/partials/website/pages/renegade_science/OurTechnologyPartnersPartial.vue'
  import FocusedOnSpecificBiotechnologies from '@/partials/website/pages/renegade_science/FocusedOnSpecificBiotechnologiesPartial.vue'
  import LetsInnovateTogether from '@/partials/website/shared/LetsInnovateTogetherPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'renegade-science',
    title: 'Renegade Science',
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
          <h1 class="h1 sky-blue-100">
            renegade science
          </h1>
          <p class="p2">
            Within renegade.bio, we have two areas of focus that work in tandem to successfully develop and distribute diagnostics to people: <strong>renegade science</strong> and <a href="/renegade-reach" class="magenta-100"><strong>renegade reach</strong></a>.
          </p>
        `,
      },
    ],
    risographs: [
      {
        id: 'pink-man-in-hat',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/pink-man-in-hat',
        title: 'pink-man-in-hat',
        alt: 'pink man in hat',
        width: 3516,
        height: 2539,
      },

      {
        id: 'blue-pregnant-woman',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-pregnant-woman',
        title: 'blue-pregnant-woman',
        alt: 'blue pregnant woman',
        width: 1688,
        height: 2645,
      },
    ],
  }

  // ===========================================================================
  // Developing Novel Diagnostics Section Data
  // ===========================================================================
  const developingNovelDiagnosticsData: IPageData = {
    id: `${parent.id}-section-developing-novel-diagnostics`,
    copyBlocks: [
      {
        id: 'content-frame-developing-preventative-diagnostics-in-house-and-in-partnership',
        classes: ['content-frame', 'padded', 'align-center'],
        content: `
          <h2 class="h2 sky-blue-100">
            Developing preventative diagnostics in-house and in partnership.
          </h2>
          <p class="p2">
            <strong>Renegade science</strong> develops and seeks out proactive solutions across the diagnostic space. The healthcare industry is positioned to be reactive, costly, and slow—often treating diseases too late. <strong>We can do better</strong>.
          </p>
          <p class="p2">
            We develop proprietary assays internally and with our biotechnology partners, and deploy these assays through our clinical laboratory.
          </p>
        `,
      },

      {
        classes: ['align-center', 'white-text'],
        content: `
          <h2 class="h1 sky-blue-100">
            Developing Novel Diagnostics
          </h2>
          <p class="p2">
            Our in-house R&D team develops novel diagnostics and assays that support drug development, leveraging capabilities and experience in biomarker discovery, PCR, NGS, and LCMS. We strive to make these diagnostics available on high-throughput platforms, which operate within the renegade network of laboratories.
          </p>
          <p class="p2">
            Our focus within the diagnostics space centers on:
          </p>
        `,
      },
    ],
    cards: [
      // Infectious Diseases
      {
        id: 'card-infectious-diseases',
        attributes: {
          classes: ['content-frame', 'padded', 'align-center'],
          title: 'Infectious Diseases',
          image: {
            id: 'card-image-infectious-diseases',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-virus.svg',
            title: 'Infectious Diseases - Virus Icon',
            alt: 'Virus Icon',
            width: 128,
            height: 128,
          },
          link: {
            id: 'link-infectious-diseases-learn-more',
            classes: ['sky-blue-100'],
            type: 'route-link',
            href: 'infectious-diseases',
            content: 'Learn More',
          },
        },
      },

      // Hormones & Fertility Health
      {
        id: 'card-hormones-and-fertility-health',
        attributes: {
          classes: ['content-frame', 'padded', 'align-center'],
          title: 'Hormones & Fertility Health',
          image: {
            id: 'card-image-hormones-and-fertility-health',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-dna.svg',
            title: 'Hormones & Fertility Health - DNA Icon',
            alt: 'DNA Icon',
            width: 155,
            height: 128,
          },
          link: {
            id: 'link-hormones-and-fertility-health-learn-more',
            classes: ['sky-blue-100'],
            type: 'route-link',
            href: 'reproductive-health',
            content: 'Learn More',
          },
        },
      },

      // // Metabolic & Cardiovascular Health
      // {
      //   id: 'card-metabolic-and-cardiovascular-health',
      //   attributes: {
      //     classes: ['content-frame', 'padded', 'align-center'],
      //     title: 'Metabolic & Cardiovascular Health',
      //     image: {
      //       id: 'card-image-metabolic-and-cardiovascular-health',
      //       src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-heart.svg',
      //       title: 'Metabolic & Cardiovascular Health - Heart Icon',
      //       alt: 'Heart Icon',
      //       width: 128,
      //       height: 128,
      //     },
      //     link: {
      //       id: 'link-metabolic-and-cardiovascular-health-learn-more',
      //       classes: ['sky-blue-100'],
      //       type: 'route-link',
      //       href: 'cardiovascular-health',
      //       content: 'Learn More',
      //     },
      //   },
      // },

      // PrEP Testing
      {
        id: 'card-PrEP-testing',
        attributes: {
          classes: ['content-frame', 'padded', 'align-center'],
          title: 'PrEP Testing',
          image: {
            id: 'card-image-PrEP-testing',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-heart.svg',
            title: 'PrEP Testing - Heart Icon',
            alt: 'Heart Icon',
            width: 128,
            height: 128,
          },
          link: {
            id: 'link-PrEP-testing-learn-more',
            classes: ['sky-blue-100'],
            type: 'route-link',
            href: 'prep-testing',
            content: 'Learn More',
          },
        },
      },
    ],
  }

  // ===========================================================================
  // Our Technology Partners Section Data
  // ===========================================================================
  const ourTechnologyPartnersData: IPageData = {
    id: `${parent.id}-section-our-technology-partners`,
    copyBlocks: [
      {
        content: `
          <h2 class="h1 eggplant-100">
            Our Technology Partners
          </h2>
          <p class="p1">
            We partner with novel diagnostic developers to bring their tests to the US market.
          </p>
          <p class="p2">
            We manage assay validation, as well as distribution and back-end data collection for our partners. Our expertise ranges across clinical research, protocol development, clinical studies, regulatory navigation, analysis and reporting.
          </p>
        `,
      },
    ],
    callouts: [
      {
        id: 'diagnostics-to-market-cta',
        classes: [],
        content: `
          <h3 class="h3 sky-blue-100">
            Interested in partnering to bring your diagnostics to market?
          </h2>
          <div class="buttons-container">
            <a href="https://reach.renegade.bio/request_call" rel="noopener" target="_blank" class="button pill-button lrg">Get Started</a>
          </div>
        `,
      },
    ],
    animationBlock: {
      id: 'collaboration-stages',
      classes: ['content-frame', 'padded'],
      copyBlocks: [
        {
          id: 'collaboration-stages-header',
          classes: [],
          content: `
            <h2 class="h2 navy-100">
              Collaboration Stages
            </h2>
            <p class="p2">
              While each partnership is unique, we generally approach our collaboration as stages from assessment through product deployment and publication.
            </p>
          `,
        },
      ],
      animation: {
        type: 'fade',
        name: 'collaboration-stages-animation',
        classes: [],
        content: `
          <div class="collaboration-stages-cards">
            <div class="animated-item-container" id="collaboration-stage-assessment-and-data-analysis">
              <ul class="unmarked-list">
                <li>Assessment & Data Analysis</li>
                <li>Proposal for Partnership</li>
                <li>Regulatory & Ethics Review</li>
                <li>IRB Submission</li>
              </ul>
            </div>

            <div class="animated-item-container" id="collaboration-stage-protocol-development">
              <ul class="unmarked-list">
                <li>Protocol Development</li>
                <li>Clinical Trials</li>
                <li>Analysis of Results</li>
              </ul>
            </div>

            <div class="animated-item-container" id="collaboration-stage-go-to-market-strategy">
              <ul class="unmarked-list">
                <li>Go-to-Market Strategy</li>
                <li>Product Development</li>
                <li>Publication</li>
              </ul>
            </div>
          </div>
        `,
      },
    },
  }

  // ===========================================================================
  // Focused On Specific Biotechnologies Section Data
  // ===========================================================================
  const focusedOnSpecificBiotechnologiesData: IPageData = {
    id: `${parent.id}-section-our-technology-partners`,
    copyBlocks: [
      {
        content: `
          <h2 class="h1 sky-blue-100">
            Focused on Specific Biotechnologies
          </h2>
          <p class="p1">
            Our technology pipelines support diagnostic and therapeutic applications by providing the tools we need to create and implement novel assays.
          </p>
        `,
      },
    ],
    cards: [
      // Molecular Diagnostics
      {
        id: 'card-molecular-diagnostics',
        attributes: {
          title: 'Molecular Diagnostics',
          image: {
            id: 'card-image-molecular-diagnostics',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-molecule.svg',
            title: 'Molecular Diagnostics - Molecule Icon',
            alt: 'Molecule Icon',
            width: 128,
            height: 128,
          },
          content: `
            <h6 class="p3-bold sky-blue-100">Small RNA & miRNA</h6>
            <p class="p3">Looking at small regulatory RNAs as symptoms of early disease</p>

            <h6 class="p3-bold sky-blue-100">PCR / RT-PCR Multiplexing (renegadeXP™)</h6>
            <p class="p3">Designing assays with multiple targets to expedite testing</p>

            <h6 class="p3-bold sky-blue-100">Sequencing & Genomics</h6>
            <p class="p3">Getting to the root of disease by diving deep into the underlying code of life</p>

            <h6 class="p3-bold sky-blue-100">Transcriptomics</h6>
            <p class="p3">Determining how the genetic code translates into disease signatures</p>
          `,
        },
      },

      // Biochemistry
      {
        id: 'card-biochemistry',
        attributes: {
          title: 'Biochemistry',
          image: {
            id: 'card-image-biochemistry',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-dna.svg',
            title: 'Biochemistry - DNA Icon',
            alt: 'DNA Icon',
            width: 141,
            height: 128,
          },
          content: `
            <h6 class="p3-bold sky-blue-100">Proteomics</h6>
            <p class="p3">A level out from Molecular Diagnostics, we look at the levels of resultant proteins and determine their correlation to disease.</p>

            <h6 class="p3-bold sky-blue-100">Metabolomics</h6>
            <p class="p3">Evaluating the multitude of metabolites circulating through the body as signatures of disease risk.</p>
          `,
        },
      },

      // Microbiology
      {
        id: 'card-microbiology',
        attributes: {
          title: 'Microbiology',
          image: {
            id: 'card-image-microbiology',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-stomach.svg',
            title: 'Microbiology - Stomach Icon',
            alt: 'Stomach Icon',
            width: 141,
            height: 128,
          },
          content: `
            <h6 class="p3-bold sky-blue-100">Vaginal and Gut Microbiome (16s, ITS)</h6>
            <p class="p3">Understanding and restoring vaginal and gut microbiome health.</p>

          `,
        },
      },

      // Immunology
      {
        id: 'card-immunology',
        attributes: {
          title: 'Immunology',
          image: {
            id: 'card-image-immunology',
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-immunology.svg',
            title: 'Immunology - Immunology Icon',
            alt: 'Immunology Icon',
            width: 141,
            height: 128,
          },
          content: `
            <h6 class="p3-bold sky-blue-100">Proteomics</h6>
            <p class="p3">A level out from Molecular Diagnostics, we look at the levels of resultant proteins and determine their correlation to disease.</p>

            <h6 class="p3-bold sky-blue-100">Metabolomics</h6>
            <p class="p3">Evaluating the multitude of metabolites circulating through the body as signatures of disease risk.</p>
          `,
        },
      },
    ],
  }

  // ===========================================================================
  // Lets Innovate Together Section Data
  // ===========================================================================
  const letsInnovateTogetherData: IPageData = {
    id: `${parent.id}-section-lets-innovate-together`,
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .image-container.collaboration-stages-cards {
    display: flex;
    width: 100%;
    flex: 1;

    img {
      flex: 1;
      margin: -5px;
    }
  }

  .section.hero {
    &:deep() {
      .container {
        row-gap: 6rem;

        @include for-phone-lrg-up {
          row-gap: 8rem;
        }

        @include for-tablet-portrait-mid-up {
          row-gap: 15rem;
        }
      }

      .copy-block {
        @include for-desktop-mid-up {
          flex: 0 1 45%;
        }

        .h1 {
          animation: fadeIn 1s ease-out forwards;
          transform: translate(3rem, 0rem) scale(1);
          transform-origin: center;
          opacity: 0;
        }
      }

      .risograph-container {
        justify-content: flex-end;
        z-index: -1;

        .risograph {
          animation: fadeIn 1s ease-out forwards;
          opacity: 0;
        }

        #pink-man-in-hat {
          position: relative;
          right: unset;
          bottom: 0;

          animation-delay: 0ms;

          @include for-desktop-mid-up {
            position: absolute;
            right: -16rem;
            bottom: 1rem;
          }
        }

        #blue-pregnant-woman {
          right: 0rem;
          bottom: 0rem;

          animation-delay: 600ms;

          @include for-desktop-mid-up {
            right: -13rem;
            bottom: -14rem;
          }
        }
      }
    }
  }
</style>
