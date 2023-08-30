<template #trustedPartners>
  <section :id="data.id" class="section trusted-partners">
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
      <ImageList v-if="data?.images" :images="data.images" />
      <Risographs v-if="data?.risographs" :risographs="data.risographs" />
    </div>

    <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />
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

  .section.trusted-partners {
    // background-color: $--color-theme-navy-100;

    // min-height: 171.3rem;
    padding: 0;
    z-index: 3;

    // background: linear-gradient(
    //   180deg,
    //   $--color-theme-white 0%,
    //   $--color-theme-light-blue-100 100%
    // );
    // background-size: contain;

    .container {
      flex: 0 1 auto;
      flex-direction: column;
      row-gap: 1rem;
      padding: 4.5rem $--width-gutter-padding;
      min-height: 24rem;
      z-index: 2;
    }

    &:deep() {
      .copy-block {
        flex: 0 1 0;
      }

      .image-list-container {
        flex-wrap: wrap;
        // justify-content: space-around;
        row-gap: 2rem;
        column-gap: 2rem;
        max-width: 70%;

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

        // img {
        //   height: unset;
        // }

        // @include for-tablet-mid-up {
        //   align-content: center;
        //   align-items: center;
        //   column-gap: 4.4rem;
        // }
      }
    }
  }
</style>
