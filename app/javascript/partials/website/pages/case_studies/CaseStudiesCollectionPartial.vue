<template #caseStudiesCollectionPartial>
  <section :id="data.id" class="section case-studies-collection">
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

      <TabCollection
        v-if="data?.tabCollection"
        :id="data.tabCollection.id"
        :tab-list="data.tabCollection.tabList"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import TabCollection from '@/components/TabCollection.vue'
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
    id: 'shape-case-studies-collection-header',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background-multi-helix-with-bg.svg',
    width: 2959,
    height: 1952,
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.case-studies-collection {
    background-color: $--color-theme-white;
    min-height: 57.3rem;
    z-index: 20;

    .container {
      justify-content: center;

      &:first-of-type {
        padding-left: 12.6rem;
        padding-right: 12.6rem;
      }
    }

    &:deep() {
      .h1 {
        display: flex;
        color: $--color-theme-sky-blue-100;
        text-align: center;
      }

      .p1 {
        text-align: center;
      }

      .tab-list {
        margin-top: -11.5rem;
      }

      #shape-case-studies-collection-header {
        $top-offset: -47rem;

        @include for-tablet-mid-up {
          $top-offset: -40rem;
        }

        @include for-tablet-landscape-up {
          $top-offset: -30rem;
        }

        @include for-desktop-mid-up {
          $top-offset: -29.5rem;
        }

        top: $top-offset;
        max-height: calc(100% + 15.5rem);
        background-position-y: top;
      }
    }
  }
</style>
