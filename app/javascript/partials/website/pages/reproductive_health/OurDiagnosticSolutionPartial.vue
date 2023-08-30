<template #ourDiagnosticSolutionPartial>
  <section :id="data.id" class="section our-diagnostic-solution">
    <div class="container">
      <Image v-for="(image, index) in data.images" :key="index" :image="image" />

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
  import Image from '@/components/Image.vue'
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

  .section.our-diagnostic-solution {
    background-color: $--color-theme-white;

    .container {
      $gap: 3.5rem;

      @include for-tablet-mid-up {
        // $gap: 8.5rem;
      }

      column-gap: $gap;
      row-gap: $gap;
      z-index: 2;
    }

    :deep() {
      .image-container {
        &.content-frame {
          overflow: hidden;
          flex: 1 1 auto;
          align-items: center;
          height: 7rem;

          @include for-phone-lrg-up {
            height: 9rem;
          }

          @include for-phone-lrg-tablet-up {
            height: 11rem;
          }

          @include for-tablet-portrait-up {
            height: 15rem;
          }

          @include for-tablet-mid-up {
            height: auto;
            margin-bottom: 2.5rem;
          }

          img {
            width: min-content;
            min-height: 7.3rem;
            height: 100%;
          }
        }
      }

      .copy-block {
        flex: 1 1 0;
      }

      .cards {
        flex: 1 1 auto;
        flex-wrap: wrap;
        row-gap: 5rem;
        column-gap: 12rem;
      }

      .card {
        flex: 1 0 0%;
        row-gap: 1.3rem;
        padding: 0;

        // Overrides h3.h2
        .h2 {
          color: $--color-theme-navy-100;
          font: $--font-secondary-400;
          font-size: 3.2rem;
          line-height: 3.9rem;
          margin-bottom: 1rem;
        }
      }
    }
  }
</style>
