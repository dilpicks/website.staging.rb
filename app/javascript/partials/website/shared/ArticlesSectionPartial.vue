<template #articlesSection>
  <section :id="data.id" class="section articles">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <!-- <ArticleList v-if="articles" :article-list="articles" /> -->
      <ArticleList v-if="data?.articleList" :article-list="data.articleList" />
      <HtmlContent v-if="!data?.articleList?.articleItems" :content="noAvailableArticlesContent" />

      <!-- Contact Details -->
      <aside v-if="data?.accordionList" :class="['aside', 'content-frame']">
        <AccordionList v-if="data?.accordionList" :accordion-list="data.accordionList" />
      </aside>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import AccordionList from '@/components/AccordionList.vue'
  import ArticleList from '@/components/ArticleList.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  // import Image from '@/components/Image.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    // articles?: Array<IArticle> | undefined
    parent?: IPageData | null | undefined
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    // articles: () => [],
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
  const noAvailableArticlesContent = `
    <h3 class="h3">No Articles Are Available At This Time.</h3>
  `
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.articles {
    background-color: $--color-theme-white;
    gap: 5rem;

    // @include for-desktop-mid-up {
    //   padding-top: 10rem;
    // }

    .container {
      flex-direction: row;
      flex-wrap: wrap;
      column-gap: 3rem;
      row-gap: 3rem;

      padding: 2rem;

      @include for-desktop-narrow-to-mid-up {
        column-gap: 12.6rem;
      }

      @include for-desktop-narrow-up {
        padding: 6.2rem 2rem;
      }
    }

    :deep() {
      .aside {
        flex: 1;
        max-width: 40rem;

        @include for-desktop-narrow-to-mid-up {
          position: absolute;
          right: 0;
        }

        @include for-desktop-narrow-up {
          flex: 0 1 40rem;
        }

        .accordion-items {
          gap: 0;
        }

        .accordion-item {
          padding: 3.5rem 3rem;
          border-color: $--color-border;
          border-style: solid;
          border-width: 0 0 1px 0;

          &:last-of-type {
            border-width: 0;
          }

          @include for-phone-lrg-tablet-up {
            padding: 5rem;
          }
        }

        .accordion-item-content {
          flex: 1 1 auto;

          .ml-container {
            flex-wrap: wrap;
            row-gap: 2rem;
          }
        }

        .button-container {
          flex-wrap: wrap;
        }
      }
    }
  }
</style>
