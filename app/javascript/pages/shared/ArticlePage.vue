<template>
  <div v-if="article" :id="`${article.id}-page`" class="page">
    <Hero :data="heroData" :parent="pageData" />
    <ArticleContentSection :data="article" :parent="pageData" />
    <MailingListSignUp :data="mailingListData" :parent="pageData" />
  </div>
</template>

<script setup lang="ts">
  import {
    computed,
    // defineProps,
    // defineComponent,
    // onMounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { useRoute } from 'vue-router'
  import { storeToRefs } from 'pinia'
  import { showToast } from '@/utils/showToast'
  import { useArticlesStore } from '@/stores/articles.store'

  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import ArticleContentSection from '@/partials/website/shared/ArticleContentSectionPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData, IImage } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    // parent?: IPageData | null | undefined
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    loading: false,
    post: null,
    error: null,
    debug: false,
  })

  const route = useRoute()
  const articlesStore = useArticlesStore()
  const { article } = storeToRefs(articlesStore)

  // ===========================================================================
  // Methods
  // ===========================================================================
  // const fetchData = () => {
  //   console.log(`Fetching Data for ${route.params.id}`)
  // }

  const pageData: IPageData = {
    id: 'article',
    title: 'Article',
  }

  // ===========================================================================
  // Hero Section Data
  // ===========================================================================
  const heroData = computed(() => {
    // console.log('article.value: ', toRaw(article.value))

    const pageData: IPageData = {
      id: `${article?.value?.id}-section-hero`,
      copyBlocks: [
        {
          classes: ['hero-block'],
          content: `
            <h1 class="h1 navy-100">
              ${article?.value?.attributes?.title}
            </h1>
          `,
        },
      ],
      shapes: [
        {
          id: 'shape-section-hero-header-background',
          src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background-multi-helix-xl.svg',
          width: 6387,
          height: 1952,
        },
      ],
    }

    if (article?.value?.attributes?.image) {
      const image: IImage = article?.value?.attributes?.image

      if (!image.id && article?.value?.id) {
        image.id = `${article?.value?.id}-section-hero-image`
      }

      pageData.images = [image]
    }

    return pageData
  })

  // ===========================================================================
  // Mailing List Sign Up Data
  // ===========================================================================
  const mailingListData = computed(() => {
    return {
      id: `${article?.value?.id}-section-mailing-list-sign-up`,
      copyBlocks: [
        {
          content: `
            <h3 class="h3 sky-blue-100">Keep up with the latest <span class="magenta-100">renegade.bio</span> news</h3>
          `,
        },
      ],
    }
  })

  // ===========================================================================
  // Methods
  // ===========================================================================
  const hydrate = () => {
    console.log(`Fetching Data for ${route?.params?.id}`)

    articlesStore.show(route?.params?.id).catch((error) => {
      showToast(error, 'error')
    })
  }

  // ===========================================================================
  // Created
  // ===========================================================================
  hydrate()
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section {
      &.hero {
        padding: 0;
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

          // opacity: 0.5;

          max-width: unset;
          max-height: calc(100% + 12rem);
          width: 638.7rem;
          background-position-x: 0rem;
          background-position-y: -18rem;

          transform: translateX(9%);

          @include for-desktop-mid-up {
            // opacity: 1;

            transform: translateX(-50%);
            left: 168rem;
            background-position-y: -20rem;
          }
        }
      }
    }

    .section.article.show {
      background-color: $--color-theme-white;

      .container {
        // width: 100%;

        .copy-block {
          width: 100%;

          .ml-container {
            width: 100%;

            .sub-section {
              width: 100%;

              // .figure,
              // .image-container {
              //   opacity: 0.5 !important;
              //   width: 100%;
              // }

              figure {
                width: 100%;

                .image-container {
                  width: 100%;

                  img {
                    max-width: 100%;
                    width: auto;
                    height: fit-content;
                  }
                }
              }
            }
          }
        }
      }
    }

    // #newsroom-section-in-the-news {
    //   padding-top: 10rem;
    // }
  }
</style>
