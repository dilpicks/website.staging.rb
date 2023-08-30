<template #forProvidersPartial>
  <section :id="data.id" class="section for-providers">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
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

  .section.for-providers {
    background-color: $--color-theme-white;
    gap: 5rem;

    &:deep() {
      .container {
        row-gap: 8.5rem;
        z-index: 2;

        padding: 2rem;
      }
    }
  }
</style>
