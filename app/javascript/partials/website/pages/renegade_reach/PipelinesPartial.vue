<template #pipelinesPartial>
  <section :id="data.id" class="section pipelines">
    <div class="container">
      <Cards
        v-if="data?.cards"
        :card-type="'adjacent-image-card'"
        :cards="data.cards"
        :classes="['stacked']"
      />

      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>
    </div>

    <!-- <Shape :image="shapeData" /> -->
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  // import Shape from '@/components/Shape.vue'
  import { IPageData } from '@/types/general'
  // import headerImgUrl from '@/assets/images/shape-common-section-background-alt.svg'

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
  // const style = '' //`background-image: url('${headerImgUrl}');`
  // const shapeData: IImage = {
  //   id: 'shape-pipelines-background',
  //   src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background-alt.svg',
  //   width: 2959,
  //   height: 1745,
  // }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.pipelines {
    background-color: $--color-theme-white;
    background-attachment: local, scroll;
    background-image: url(https://res.cloudinary.com/renegade-bio/image/upload/f_auto,q_auto,w_2959,h_1745/dpr_2.0/shapes/shape-common-section-background-alt);
    // background-image: url(http://base10proofs.info/temp/shape-common-section-background-alt.svg);
    background-repeat: repeat-y;
    background-position-x: center;
    background-position-y: 22.5rem;
    background-size: 295.9rem auto;

    @include for-desktop-mid-up {
      padding: 15rem 0;
    }

    &:deep() {
      .container {
        row-gap: 5rem;
        z-index: 30;

        @include for-desktop-mid-up {
          row-gap: 21rem;
        }
      }

      .cards {
        row-gap: 4rem;

        @include for-tablet-portrait-up {
          row-gap: 10rem;
        }

        @include for-desktop-mid-up {
          row-gap: 36rem;
        }
      }

      .card {
        row-gap: 1.3rem;
        padding-bottom: 5.3rem;
        padding-top: 5.3rem;

        .h2 {
          color: $--color-theme-navy-100;
          margin-bottom: 1rem;
        }

        .button {
          background-color: $--color-theme-sky-blue-100;
        }
      }

      #collaboration-stages {
        padding: 6.5rem;
      }

      #content-frame-developing-preventative-diagnostics-in-house-and-in-partnership {
        margin-top: -17rem;
      }

      #shape-pipelines-background {
        bottom: -46.5rem;
      }
    }
  }
</style>
