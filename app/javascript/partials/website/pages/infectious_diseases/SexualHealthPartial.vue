<template #sexualHealthPartial>
  <section :id="data.id" class="section sexual-health">
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

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.sexual-health {
    background-color: $--color-theme-white;
    gap: 5rem;

    @include for-desktop-mid-up {
      padding-top: 8rem;
    }

    &:deep() {
      .container {
        row-gap: 8.5rem;
        z-index: 2;
      }

      .card {
        flex: 1 0 0%;
        row-gap: 1.3rem;
        padding: 5.3rem 3.1rem;
      }
    }
  }
</style>
