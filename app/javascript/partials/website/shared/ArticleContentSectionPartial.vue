<template #articleContentSection>
  <section
    :id="data.id"
    :class="[
      'section',
      'article',
      'show',
      'article-content-partial',
      { 'with-hero-image': data.attributes?.image },
    ]"
  >
    <div class="container">
      <!-- <h2>Hi! I'm article {{ data.id }}!</h2> -->
      <!-- Article Content -->
      <div class="content-container">
        <div
          v-for="(copyBlock, index) in data.attributes.copyBlocks"
          :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
          :key="index"
          :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
        >
          <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import HtmlContent from '@/components/HtmlContent.vue'
  // import Image from '@/components/Image.vue'
  // import Link from '@/components/Link.vue'
  import { IArticle, IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IArticle
    parent?: IPageData | null | undefined
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.article-content-partial {
    background-color: $--color-theme-white;

    &.with-hero-image {
      @include for-desktop-narrow-up {
        padding-top: 19rem;
        // margin-top: 20rem;
      }
    }

    .container {
      flex-direction: row;
      flex-wrap: wrap;
      justify-content: center;
      column-gap: 3rem;
      row-gap: 3rem;

      padding: 2rem;

      @include for-desktop-narrow-up {
        padding: 6.2rem 2rem;
      }

      :deep() {
        .aside {
          flex: 1;

          @include for-desktop-narrow-up {
            flex: 0 1 30rem;
          }

          .padded-container {
            padding: 3rem;
            flex-wrap: wrap;
            row-gap: 2rem;

            .case-study-details-info-block {
              flex-direction: column;
              flex: 1 1 100%;
            }
          }

          .image-container {
            padding: 2.9rem;

            @include for-phone-up {
              padding: 3.9rem;
            }

            background-color: $--color-theme-navy-100;
            border-radius: 2rem 2rem 0 0;

            align-items: center;
            justify-content: center;

            img {
              width: 100%;
            }
          }
        }

        .content-container {
          flex: 1 1 auto;
          flex-wrap: wrap;

          row-gap: 3rem;

          max-width: 85rem;

          @include for-desktop-narrow-up {
            flex: 1 1 0;
          }

          .copy-block {
            flex: 1 1 100%;

            .h3 {
              margin-bottom: 0.5rem;
            }
          }

          h6 {
            & + p,
            & + ul {
              margin-top: 0.5rem;
            }
          }
        }
      }
    }
  }
</style>
