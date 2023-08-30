<template #diagnosticSolutions>
  <section :id="data.id" class="section diagnostic-solutions">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <Cards v-if="data?.cards" :cards="data.cards" :classes="['stacked']" />
      <ImageList v-if="data?.images" :images="data.images" />
      <Risographs v-if="data?.risographs" :risographs="data.risographs" />
      <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />
    </div>

    <div v-if="data?.tabCollection" class="container">
      <TabCollection
        :id="data.tabCollection.id"
        :class="[...(data.tabCollection?.classes ? data.tabCollection.classes : [])]"
        :tab-list="data.tabCollection.tabList"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import ImageList from '@/components/ImageList.vue'
  import Risographs from '@/components/Risographs.vue'
  import Shape from '@/components/Shape.vue'
  import TabCollection from '@/components/TabCollection.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.diagnostic-solutions {
    background-color: $--color-theme-light-blue-100;
    min-height: 57.3rem;

    .container {
      justify-content: center;

      .copy-block {
        @include for-tablet-landscape-up {
          padding-left: 10.6rem;
          padding-right: 10.6rem;
        }
      }
    }
  }
</style>
