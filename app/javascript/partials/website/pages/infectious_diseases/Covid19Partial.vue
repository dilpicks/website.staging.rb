<template #covid19Partial>
  <section :id="data.id" class="section covid-19">
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
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Props
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
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
</script>

<style setup lang="scss">
  .section.covid-19 {
    background-color: $--color-theme-white;
    // padding-top: 8rem;

    .container {
      row-gap: 8.5rem;
      z-index: 2;
    }

    .card {
      flex: 1 0 0%;
      row-gap: 1.3rem;
      padding: 5.3rem 3.1rem;

      // Overrides h3.h2
      .h2 {
        color: $--color-theme-navy-100;
        font: $--font-secondary-400;
        font-size: 3.2rem;
        line-height: 3.9rem;
        margin-bottom: 1rem;
      }

      .button {
        background-color: $--color-theme-sky-blue-100;
      }
    }
  }
</style>
