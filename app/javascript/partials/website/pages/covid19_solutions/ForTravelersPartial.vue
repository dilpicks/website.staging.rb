<template #forTravelersPartial>
  <section :id="data.id" class="section for-travelers">
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

  .section.for-travelers {
    min-height: 96rem;

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

        #for-travelers-list {
          // position: static;

          .accordion-item {
            @include for-desktop-mid-up {
              max-width: 55%;
            }
          }

          .button-container {
            flex-wrap: wrap;
          }
        }

        .content-frame {
          top: 22.5rem;
        }
      }
    }
  }
</style>
