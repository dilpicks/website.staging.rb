<template #noCostSolutionsPartial>
  <section :id="data.id" class="section no-cost-solutions">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <AccordionList v-if="data?.accordionList" :accordion-list="data.accordionList" />
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Props
  // ===========================================================================
  import AccordionList from '@/components/AccordionList.vue'
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

  .section.no-cost-solutions {
    min-height: 94rem;

    .container {
      row-gap: 8rem;
      position: relative;

      &:deep() {
        > .copy-block {
          p {
            @include for-desktop-mid-up {
              max-width: 50%;
            }
          }
        }

        // #no-cost-solutions-list {
        //   position: static;
        // }

        .content-frame {
          top: 22.5rem;
        }
      }
    }
  }
</style>
