<template #teamBiosPartial>
  <section :id="data.id" class="section team-bios">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <Cards v-if="data?.cards" :cards="data.cards" :debug="debug" />
      <ImageList v-if="data?.images" :images="data.images" />
      <Risographs v-if="data?.risographs" :risographs="data.risographs" />
      <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineProps,
    // defineComponent,
    onMounted,
    // reactive,
    // ref,
    toRaw,
  } from 'vue'

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

  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('TeamBiosPartial.vue - onMounted - props.data.cards: ', toRaw(props.data.cards))
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.team-bios {
    background-color: $--color-theme-white;

    .container {
      row-gap: $--height-headline-gap;
    }

    :deep() {
      .cards {
        justify-content: space-around;

        @media (min-width: 1298px) {
          justify-content: flex-start;
        }

        .card.profile-card {
          flex: 1 1 auto;

          @media (min-width: 872px) {
            flex: 0 1 0;
          }

          .image-container.card-header-image {
            justify-content: center;
          }
        }
      }
    }
  }
</style>
