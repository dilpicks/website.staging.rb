<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <Diagnostics :data="diagnosticsData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import Diagnostics from '@/partials/website/pages/innovations_in_diagnostics/DiagnosticsPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'innovations-in-diagnostics',
    title: 'Innovation In Diagnostics',
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
            Innovation in Diagnostics
          </h1>

          <p class="p2">
            With an eye on innovation around disease prevention, we conduct R&D to explore human and planetary diagnostic solutions outside our target disease spaces.
          </p>
        `,
      },
    ],
    images: [
      {
        id: 'purple-lab-technician-with-pipette',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/purple-lab-technician-with-pipette',
        title: 'renegade lab diagnostics',
        alt: 'renegade lab diagnostics',
        width: 2186,
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
  // Diagnostics Section Data
  // ===========================================================================
  const diagnosticsData: IPageData = {
    id: `${parent.id}-section-sexual-health`,
    cards: [
      // PCR/qRT-PCR / ThermoFisher
      {
        id: 'card-pcr-qrt-pcr',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-top', 'align-left'],
          content: `
            <h3 class="h3 magenta-100">
              PCR/qRT-PCR
            </h3>
            <p class="p3">
              PCR/qRT-PCR are methods utilized for amplifying small concentrations of DNA and RNA, respectively. RNA is reverse transcribed and cDNA is amplified from a target sequence cDNA using primers and enzymes. Sometimes abbreviated as NAAT (nucleic acid amplification test), this method can be used to detect and amplify bacterial, viral, fungal, or other disease DNA or RNA molecules.
            </p>
          `,
          shape: {
            id: 'card-image-pcr-qrt-pcr',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/animated-logo-box-thermo-fisher-scientific.svg',
            width: 617,
            height: 278,
            renderAsSVG: true,
          },
        },
      },

      // LCMS / Agilent
      {
        id: 'card-lcms',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-top', 'align-right'],
          content: `
            <h3 class="h3 eggplant-100">
              LCMS
            </h3>
            <p class="p3">
              Liquid chromatography-mass spectrometry is an analytical chemistry technique that combines the physical separation capabilities of liquid chromatography (or HPLC) with the mass analysis capabilities of mass spectrometry (MS) allowing us to determine with great precision the concentration and molecular composition of key biomarkers in living systems.
            </p>
          `,
          shape: {
            id: 'card-image-lcms',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/animated-logo-box-agilent-technologies.svg',
            width: 617,
            height: 278,
            renderAsSVG: true,
          },
        },
      },

      // NGS / Illumina
      {
        id: 'card-ngs',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-top', 'align-left'],
          content: `
            <h3 class="h3 sky-blue-100">
              NGS
            </h3>
            <p class="p3">
              Next-generation sequencing (NGS) is a massively parallel sequencing technology, which offers ultra-high throughput, scalability, and speed. The technology is used to determine the order of nucleotides in entire genomes or targeted regions of DNA or RNA. NGS has revolutionized the biological sciences, allowing labs to perform a wide variety of applications and study biological systems at a level never before possible.
            </p>
            <p class="p3">
              Today’s complex genomics questions demand a depth of information beyond the capacity of traditional DNA sequencing technologies. NGS has filled that gap and become an everyday tool to address these questions.
            </p>
          `,
          shape: {
            id: 'card-image-ngs',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/animated-logo-box-illumina.svg',
            width: 617,
            height: 278,
            renderAsSVG: true,
          },
        },
      },

      // Cobas / Cobas
      {
        id: 'card-cobas',
        componentType: 'adjacent-image-card',
        attributes: {
          classes: ['align-top', 'align-right'],
          content: `
            <h3 class="h3 magenta-100">
              Cobas
            </h3>
            <p class="p3">
              Cobas facilitates a completely automated lab sample processing flow. Together with Roche, we develop assays for the Cobas platform that accelerates scaling and brings novel diagnostics to market with fewer regulatory hurdles.
            </p>
            <p class="p3">
              The platform also provides increased clinical sensitivity and specificity, an extensive assay menu, fast turnaround time, and high-throughput—with up to 4400 tests in 24 hours. We can handle high-priority samples quickly and easily with a dedicated priority lane. Mixed testing optimizes sample utilization, processing up to three different tests from a single patient sample.
            </p>
          `,
          shape: {
            id: 'card-image-cobas',
            classes: ['content-frame'],
            src: 'https://res.cloudinary.com/renegade-bio/image/upload/logos/animated-logo-box-cobas.svg',
            width: 617,
            height: 278,
            renderAsSVG: true,
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
  }
</style>
