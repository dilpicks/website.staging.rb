<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <ArticlesSection :data="inTheNewsData" :parent="parent" />
    <ArticlesSection :data="pressReleasesData" :parent="parent" />
    <Publications :data="publicationsData" :parent="parent" />
    <ArticlesSection :data="awardsData" :parent="parent" />
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
  } from 'vue'

  // import { useRoute } from 'vue-router'
  import { storeToRefs } from 'pinia'
  import { showToast } from '@/utils/showToast'
  import { useArticlesStore } from '@/stores/articles.store'

  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import ArticlesSection from '@/partials/website/shared/ArticlesSectionPartial.vue'
  import Publications from '@/partials/website/pages/newsroom/PublicationsPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'

  import { ICard, IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'newsroom',
    title: 'Newsroom',
  }

  const articlesStore = useArticlesStore()
  // eslint-disable-next-line prettier/prettier
  const { news, pressReleases, publications, awards } = storeToRefs(articlesStore)

  // ===========================================================================
  // Hero Section Data
  // ===========================================================================
  const heroData: IPageData = {
    id: `${parent.id}-section-hero`,
    copyBlocks: [
      {
        classes: ['hero-block'],
        content: `
          <h5 class="prehead eggplant-100">
            The Latest
          </h5>

          <h1 class="h1 navy-100">
            Newsroom
          </h1>
        `,
      },
    ],
    // images: [
    //   {
    //     id: 'purple-couple-embracing',
    //     src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/purple-couple-embracing.png',
    //     title: 'purple couple embracing',
    //     alt: 'purple couple embracing',
    //     width: 2175,
    //     height: 1842,
    //   },
    // ],
    shapes: [
      {
        id: 'shape-section-hero-header-background',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background-multi-helix-xl.svg',
        width: 6387,
        height: 1951,
      },
    ],
  }

  // ===========================================================================
  // In The News Section Data
  // ===========================================================================
  const inTheNewsData = computed(() => {
    const pageData: IPageData = {
      id: `${parent.id}-section-in-the-news`,
      copyBlocks: [
        {
          classes: ['in-the-news-block'],
          content: `
            <h2 class="h1 sky-blue-100">
              In The News
            </h2>
          `,
        },
      ],
      accordionList: {
        id: `${parent.id}-section-in-the-news-aside`,
        classes: [],
        accordionItems: [
          {
            id: 'in-the-news-press-inquiries',
            classes: ['sky-blue-100', 'active'],
            inert: true,
            title: 'For press or media inquiries, contact',
            content: `
              <div class="button-container">
                <a href="mailto:press@renegade.bio" rel="noopener" target="_blank" class="button button-pill sky-blue-100">
                  press@renegade.bio
                </a>

                <a href="tel:8554800771" rel="noopener" target="_blank" class="button button-pill transparent">
                  <span class="sky-blue-100">or call +1.855.480.0771</span>
                </a>
              </div>
            `,
          },

          {
            id: 'in-the-news-media-kit',
            classes: ['magenta-100', 'active'],
            inert: true,
            title: 'Media Kit',
            content: `
              <p class="p3">
                Official logos, photos, and other resources.
              </p>

              <div class="button-container">
                <a href="mailto:marketing@renegade.bio" rel="noopener" target="_blank" class="button button-pill magenta-100">
                  marketing@renegade.bio
                </a>
              </div>
            `,
            // content: `
            //   <p class="p3">
            //     Official logos, photos, and other resources.
            //   </p>

            //   <div class="button-container">
            //     <a href="#" class="button button-pill magenta-100">
            //       Download Now
            //     </a>
            //   </div>
            // `,
          },
        ],
      },
      articleList: {
        id: `${parent.id}-section-in-the-news-articles`,
        classes: [],
        articleItems: news.value,
      },
    }

    return pageData
  })

  // ===========================================================================
  // Press Releases Section Data
  // ===========================================================================
  const pressReleasesData = computed(() => {
    const pageData: IPageData = {
      id: `${parent.id}-section-press-releases`,
      copyBlocks: [
        {
          classes: ['press-releases-block'],
          content: `
            <h2 class="h1 magenta-100">
              Press Releases
            </h2>
          `,
        },
      ],
      articleList: {
        id: `${parent.id}-section-press-releases-articles`,
        classes: [],
        articleItems: pressReleases.value,
      },
    }

    return pageData
  })

  // ===========================================================================
  // Publications Section Data
  // ===========================================================================
  const publicationsData = computed(() => {
    const pageData: IPageData = {
      id: `${parent.id}-section-publications`,
      copyBlocks: [
        {
          classes: ['publications-block'],
          content: `
            <h2 class="h1 eggplant-100">
              Publications
            </h2>
          `,
        },
      ],
      cards: publications.value as Array<ICard>,
    }

    return pageData
  })

  // ===========================================================================
  // Awards & Recognition Section Data
  // ===========================================================================
  const awardsData = computed(() => {
    const pageData: IPageData = {
      id: `${parent.id}-section-awards`,
      copyBlocks: [
        {
          classes: ['awards-block'],
          content: `
            <h2 class="h1 sky-blue-100">
              Awards & Recognition
            </h2>
          `,
        },
      ],
      articleList: {
        id: `${parent.id}-section-awards-articles`,
        classes: [],
        articleItems: awards.value,
      },
    }

    return pageData
  })

  // ===========================================================================
  // Mailing List Sign Up Data
  // ===========================================================================
  const mailingListData: IPageData = {
    id: `${parent.id}-section-mailing-list-sign-up`,
    copyBlocks: [
      {
        content: `
          <h3 class="h3 sky-blue-100">Keep up with the latest <span class="magenta-100">renegade.bio</span> news</h3>
        `,
      },
    ],
  }

  // ===========================================================================
  // Methods
  // ===========================================================================
  const hydrate = () => {
    // console.log(`Fetching Data for ${route?.params}...`)

    articlesStore.index().catch((error) => {
      showToast(error, 'error')
    })

    console.log('news: ', news)
  }

  // ===========================================================================
  // Mounted
  // ===========================================================================
  onMounted(() => {
    console.log('articlesStore: ', articlesStore)

    // if (!articles || !articles.value || !articles.value?.all?.length) {
    //   hydrate()
    // }

    hydrate()
  })

  // ===========================================================================
  // Created
  // ===========================================================================
  // hydrate()
</script>

<!-- <style lang="scss">
  #renegade-content-wrapper {
    background: linear-gradient(0deg, $--color-theme-white 0%, $--color-theme-light-blue-100 100%);
  }
</style> -->

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section.hero {
      gap: 4.6rem;
      min-height: unset;
      background-color: transparent;

      $container-gap: 4.6rem;
      $image-container-bias: 60%;

      .container {
        justify-content: space-between;
        max-height: none;
        gap: $container-gap;
        z-index: auto;

        @include for-desktop-mid-up {
          max-height: 60rem;
        }

        .copy-block {
          .ml-container {
            width: 100%;
          }
        }

        // .copy-block,
        // > .image-container {
        //   z-index: 2;
        // }
      }

      // .copy-block {
      //   &.hero-block {
      //     flex: 1 1 auto;

      //     @include for-desktop-mid-up {
      //       flex: 0 1 calc(100% - $image-container-bias);
      //     }
      //   }
      // }

      #shape-section-hero-header-background {
        // top: -98rem;
        // width: 295.9rem;
        // transform: rotate(229deg);
        // z-index: 2;

        // top: -89rem;
        // width: 295.9rem;
        // transform: rotate(223deg);
        // z-index: 2;
        // margin-left: 22rem;

        top: -60rem;
        width: 638.7rem;
        left: -143rem;
        transform: rotate(240deg);
        z-index: 2;
        max-width: unset;
      }
    }

    .section.publications {
      .cards {
        .card {
          .card-title {
            @include for-tablet-portrait-mid-up {
              min-height: 7.8rem;
            }
          }
        }
      }
    }

    #newsroom-section-in-the-news {
      padding-top: 10rem;
    }
  }
</style>
