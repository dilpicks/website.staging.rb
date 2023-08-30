<template #accessAcrossthePipelinePartial>
  <section :id="data.id" class="section access-across-the-pipeline">
    <Shape :image="shapeDataHeader" />

    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <Cards v-if="data?.cards" :cards="data.cards" />
    </div>

    <Shape :image="shapeDataFooter" />
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Props
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
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
    id: 'shape-access-across-the-pipeline-header',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-header-pink.svg',
    width: 2959,
    height: 711,
  }

  const shapeDataFooter: IImage = {
    id: 'shape-access-across-the-pipeline-footer',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-footer-pink.svg',
    width: 2959,
    height: 1006,
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.access-across-the-pipeline {
    background-color: $--color-theme-background-secondary-dark;
    z-index: 20;
    margin-bottom: 6.1rem;

    .container {
      row-gap: 8.5rem;
      z-index: 2;
    }

    // .risograph-container {
    //   width: 100%;
    // }

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

      #content-frame-increasing-access {
        margin-top: -13rem;
      }

      #shape-access-across-the-pipeline-header {
        top: -42rem;
      }

      #shape-access-across-the-pipeline-footer {
        bottom: -79.5rem; //-100.5rem;
      }
    }
  }
</style>
