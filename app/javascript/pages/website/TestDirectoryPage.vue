<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <TestsList :data="testsData" :parent="parent" />
    <CptStatement :data="cptStatementData" :parent="parent" />
    <ForProviders :data="forProvidersData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import {
    computed,
    // defineProps,
    // defineComponent,
    onMounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { storeToRefs } from 'pinia'
  import { showToast } from '@/utils/showToast'
  import { useTestsStore } from '@/stores/tests.store'

  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import TestsList from '@/partials/website/pages/test_directory/TestsListPartial.vue'
  import CptStatement from '@/partials/website/pages/test_directory/CptStatementPartial.vue'
  import ForProviders from '@/partials/website/pages/test_directory/ForProvidersPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'test-directory',
    title: 'Test Directory',
  }

  const testsStore = useTestsStore()
  // eslint-disable-next-line prettier/prettier
  const { available } = storeToRefs(testsStore)

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
            Test Directory
          </h5>

          <h1 class="h1 navy-100">
            Find the right test for your patients
          </h1>
        `,
      },
    ],
    images: [
      {
        id: 'purple-man-woman-and-child',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/purple-man-woman-and-child',
        title: 'purple man woman and child',
        alt: 'purple man woman and child',
        width: 2178,
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
  // Tests Section Data
  // ===========================================================================
  const testsData = computed(() => {
    const pageData: IPageData = {
      id: `${parent.id}-section-tests`,
      testList: {
        id: `${parent.id}-section-tests-test-list`,
        classes: [],
        testItems: available.value,
      },
    }

    return pageData
  })

  // ===========================================================================
  // CPT Statement Data
  // ===========================================================================
  const cptStatementData: IPageData = {
    id: `${parent.id}-section-cpt-statement`,
    copyBlocks: [
      {
        id: 'test-directory-legal',
        classes: ['legal-block'],
        content: `
          <p class="p4 navy-100">
            © 2022 renegade.bio, LLC. All Rights Reserved.
          </p>

          <p class="p4 navy-100">
            <a href="/ctp-statement">
              CPT Statement/Profile Statement
            </a>
          </p>
        `,
      },
    ],
  }

  // ===========================================================================
  // For Providers Data
  // ===========================================================================
  const forProvidersData: IPageData = {
    id: `${parent.id}-section-for-providers`,
    copyBlocks: [
      {
        id: 'test-directory-for-providers-cta',
        classes: ['content-frame', 'padded', 'cta-frame'],
        content: `
          <h3 class="h3 sky-blue-100">
            For Providers: Support Patients with Highly-Accurate Testing & Same-Day Onboarding
          </h3>
          <div class="buttons-container">
            <a href="https://reach.renegade.bio/provideronboarding" rel="noopener" target="_self" class="button pill-button lrg">Order Your Test Now</a>
          </div>
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
          <h3 class="h3 sky-blue-100">Keep up with our latest developments in test testing.</h3>
        `,
      },
    ],
  }

  // ===========================================================================
  // Methods
  // ===========================================================================
  const hydrate = () => {
    testsStore.index().catch((error) => {
      showToast(error, 'error')
    })
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    hydrate()
  })
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

      #test-directory-for-providers-cta {
        order: 1;
      }

      #test-directory-tests {
        order: 2;
      }

      #test-directory-legal {
        order: 3;
      }
    }

    .section.for-providers {
      .container {
        padding-bottom: 6.2rem;
      }
    }
  }
</style>
