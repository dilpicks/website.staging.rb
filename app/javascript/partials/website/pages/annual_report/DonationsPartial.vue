<template #donationsPartial>
  <section :id="data.id" class="section donations">
    <Shape :image="shapeDataHeader" />

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
  import Shape from '@/components/Shape.vue'
  import { IImage, IPageData } from '@/types/general'

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
  const shapeDataHeader: IImage = {
    id: 'shape-donations-header',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-footer-pink-sml.svg',
    width: 2959,
    height: 710,
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.donations {
    background-color: $--color-theme-background-secondary-dark;

    .container {
      row-gap: 8.5rem;
      z-index: 2;
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

      #shape-donations-header {
        top: -52rem;
      }

      .image-list-container {
        flex-wrap: wrap;
        justify-content: space-around;
        row-gap: 2rem;
        column-gap: 2rem;
        // max-width: 70%;

        @include for-tablet-mid-up {
          align-content: center;
          align-items: center;
          // column-gap: 1rem;
        }

        @include for-desktop-mid-up {
          column-gap: 4rem;
        }

        .image-container {
          align-content: center;
          align-items: center;

          img {
            @include for-tablet-mid-up {
              max-width: 8rem;
            }

            @include for-desktop-mid-up {
              max-width: var(--max-width);
            }
          }
        }
      }
    }
  }
</style>
