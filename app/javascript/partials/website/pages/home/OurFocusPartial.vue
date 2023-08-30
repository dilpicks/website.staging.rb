<template #ourFocus>
  <section :id="data.id" class="section our-focus">
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

      <ImageList v-if="data?.images" :images="data.images" />
      <Risographs v-if="data?.risographs" :risographs="data.risographs" />
      <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // computed,
    // defineComponent,
    // defineEmits,
    // defineProps,
    inject,
    // onBeforeMount,
    // onMounted,
    onUnmounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import ImageList from '@/components/ImageList.vue'
  import Risographs from '@/components/Risographs.vue'
  import Shape from '@/components/Shape.vue'
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
    parent?: IPageData | null
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let ourFocusScrollTrigger: ScrollTrigger | null

  let testTubes: Element | null
  let hospital: Element | null
  let swabs: Element | null

  const handleContentMounted = () => {
    ourFocusScrollTrigger = ScrollTrigger.create({
      trigger: '.our-focus',
      start: 'top top+=300',
      end: 'bottom bottom',
      onUpdate: (self) => {
        scrollTriggerProgressHandler(self)
      },
    })
  }

  const handleInlineSvgMounted = () => {
    testTubes = document.querySelector('#test-tubes')
    hospital = document.querySelector('#hospital')
    swabs = document.querySelector('#swabs')
  }

  // ===========================================================================
  // Methods
  // ===========================================================================
  const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
    if (testTubes && hospital && swabs) {
      if (trigger.progress > 0) {
        toggleElementShown(testTubes, 'shown')
      }

      if (trigger.progress > 0.5) {
        toggleElementShown(hospital, 'shown')
      }

      if (trigger.progress > 0.8) {
        toggleElementShown(swabs, 'shown')
      }
    }
  }

  const toggleElementShown = (element: Element, toggleClass: string) => {
    if (toggleClass == 'shown') {
      element.classList.add('shown')
    } else {
      element.classList.remove('shown')
    }
  }

  const emitter = inject('emitter') as Emitter<Events>
  emitter.on('htmlContentMounted', handleContentMounted)
  emitter.on('inlineSvgMounted', handleInlineSvgMounted)

  // ===========================================================================
  // Lifecycle
  // ===========================================================================
  onUnmounted(() => {
    emitter.off('htmlContentMounted', handleContentMounted)
    emitter.off('inlineSvgMounted', handleInlineSvgMounted)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.our-focus {
    min-height: 132rem;
    padding: 10rem 0;

    background: linear-gradient(
      180deg,
      $--color-theme-white 0%,
      $--color-theme-light-blue-100 100%
    );
    background-size: contain;

    .container {
      flex: 0 1 auto;
      row-gap: 1rem;
      z-index: 2;
      row-gap: $--height-headline-gap;
    }

    .scroll-trigger-pin {
      flex-direction: column;
    }

    &:deep() {
      .cards {
        .card {
          max-width: 75%;

          @include for-desktop-narrow-up {
            max-width: 56.6rem;
          }

          &.scroll-lock {
            opacity: 0;
            pointer-events: none;
            transition: opacity 250ms ease-out;

            &:last-of-type {
              position: absolute;
            }

            &.shown {
              opacity: 1;
              pointer-events: auto;
            }
          }
        }
      }

      .our-focus-block {
        flex: 0 1 auto;
      }

      .svg-shape-container {
        order: -1;
        width: auto;
        justify-content: center;

        position: static;

        min-height: 60rem;
        margin: -14rem 0 -6rem 0;

        @include for-desktop-narrow-up {
          justify-content: flex-end;

          order: initial;
          margin: 0;
          max-height: 100%;

          position: absolute;
          right: 2rem; // -15rem;
          top: 1rem; // 1.5rem;
        }

        svg {
          height: auto;
          max-width: 60vw;

          @include for-desktop-narrow-up {
            max-width: var(--max-width);
          }

          g.pathway-icon {
            opacity: 0;
            transition: opacity 250ms ease-out;

            &.shown {
              opacity: 1;
            }
          }
        }
      }

      .risograph-container {
      }
    }
  }
</style>
