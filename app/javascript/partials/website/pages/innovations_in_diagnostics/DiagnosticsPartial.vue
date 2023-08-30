<template #diagnosticsPartial>
  <section :id="data.id" class="section diagnostics">
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
  import {
    // computed,
    // defineComponent,
    // defineEmits,
    // defineProps,
    inject,
    // onMounted,
    onUnmounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  // ===========================================================================
  // Imports
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import { IPageData, Events } from '@/types/general'

  // eslint-disable-next-line import/no-named-as-default, import/order
  import gsap from 'gsap'
  // eslint-disable-next-line import/no-named-as-default, import/order
  import ScrollTrigger from 'gsap/ScrollTrigger'
  gsap.registerPlugin(ScrollTrigger)

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

  let helixBackgrounds: NodeListOf<HTMLElement>
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let helixScrollTrigger: ScrollTrigger | null

  // ===========================================================================
  // Methods
  // ===========================================================================
  const handleInlineSvgMounted = () => {
    console.log('handleInlineSvgMounted')
    helixBackgrounds = document.querySelectorAll('.background-helix')

    helixScrollTrigger = ScrollTrigger.create({
      trigger: '.diagnostics',
      start: 'top top+=300',
      end: 'bottom bottom',
      onUpdate: (self) => {
        scrollTriggerProgressHandler(self)
      },
    })
  }

  const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
    helixBackgrounds.forEach((helixBackground: HTMLElement) => {
      helixBackground.style.transform = `translateX(${trigger.progress * 50}rem)`
    })
  }

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
  const emitter = inject('emitter') as Emitter<Events>
  emitter.on('inlineSvgMounted', handleInlineSvgMounted)

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onUnmounted(() => {
    emitter.off('inlineSvgMounted', handleInlineSvgMounted)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.diagnostics {
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

      .cards {
        gap: 5rem;

        @include for-desktop-narrow-to-mid-up {
          gap: 8rem;
        }

        @include for-desktop-mid-up {
          gap: 13rem;
        }

        .card,
        .adjacent-image-card {
          flex: 1 0 0%;
          row-gap: 5rem;
          column-gap: 12rem;

          .image-container {
            @include for-desktop-narrow-to-mid-up {
              flex: 0 1 calc(60% - 9.6rem);
            }

            img {
              max-width: unset;
            }
          }
        }
      }
    }
  }
</style>
