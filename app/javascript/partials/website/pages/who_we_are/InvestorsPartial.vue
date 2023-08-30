<template #investorsPartial>
  <section :id="data.id" class="section investors">
    <!-- <Shape :image="shapeDataHeader" /> -->

    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />

        <ImageList v-if="data?.images" :images="data.images" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Props
  // ===========================================================================
  // import Cards from '@/components/Cards.vue'
  import ImageList from '@/components/ImageList.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  // import Shape from '@/components/Shape.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
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
  // const shapeDataHeader: IImage = {
  //   id: 'shape-investors-header',
  //   src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-footer-pink-sml.svg',
  //   width: 2959,
  //   height: 710,
  // }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.investors {
    background-color: $--color-theme-white;

    .container {
      row-gap: 8.5rem;
      z-index: 2;

      // padding: 0;

      margin-bottom: -6.5rem;

      @include for-tablet-mid-up {
        margin-bottom: -11.5rem;
      }
    }

    &:deep() {
      .card {
        flex: 1 0 0%;
        row-gap: 1.3rem;
        padding: 5.3rem 3.1rem;

        .image-container {
          img {
            height: var(--intrinsic-height);
          }
        }

        .h2,
        .h3 {
          color: $--color-theme-navy-100;
          font: $--font-secondary-400;
          font-size: 3.2rem;
          line-height: 3.9rem;
          margin-bottom: 1rem;
        }
      }

      #shape-investors-header {
        top: -52rem;
      }

      .image-list-container {
        flex-wrap: wrap;
        justify-content: space-around;
        row-gap: 2rem;
        column-gap: 2rem;

        margin: 5rem 0 0 0;

        @include for-tablet-mid-up {
          align-content: center;
          align-items: center;
        }

        @include for-desktop-mid-up {
          column-gap: 4rem;
        }

        .image-container {
          align-content: center;
          align-items: center;
          margin-bottom: 0;

          padding: 3rem 5rem;

          border-color: $--color-border;
          border-style: solid;
          border-width: 0;

          @media (min-width: 627px) {
            border-width: 0 1px 0 0;
          }

          &:last-of-type {
            border-width: 0;
          }

          img {
            // @include for-tablet-mid-up {
            //   max-width: 8rem;
            // }

            @include for-desktop-mid-up {
              max-width: var(--max-width);
            }
          }
        }
      }
    }
  }
</style>
