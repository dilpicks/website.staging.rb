<template #peoplePlanetProfitPartial>
  <section :id="data.id" class="section people-planet-profit">
    <Shape :image="shapeDataHeader" />

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
    // onBeforeMount,
    onMounted,
    onUnmounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  // ===========================================================================
  // Components
  // ===========================================================================
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import Shape from '@/components/Shape.vue'
  import { IImage, IPageData, Events } from '@/types/general'

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

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  let inViewport = false
  let animationInitiated = false
  let counterGroupSize: number | undefined

  const counterAnimations: Array<HTMLElement> = []

  // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
  const handleEmitReceived = (value: any) => {
    // eslint-disable-next-line prettier/prettier
    const counterAnimationElements: NodeListOf<HTMLElement> =
      document.querySelectorAll('.counter-animation')

    counterAnimationElements.forEach((counterAnimationElement: HTMLElement) => {
      if (!counterGroupSize && counterAnimationElement?.dataset?.counterGroupSize) {
        counterGroupSize = parseInt(counterAnimationElement.dataset.counterGroupSize)
      }

      if (!counterAnimations.includes(counterAnimationElement)) {
        counterAnimations.push(counterAnimationElement)
      }

      initCounterAnimation()
    })
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let ourFocusScrollTrigger: ScrollTrigger | null

  const initCounterAnimation = () => {
    if (canAnimate() && !animationInitiated) {
      animationInitiated = true

      counterAnimations.forEach((counterAnimationElement: HTMLElement) => {
        const dataset = counterAnimationElement?.dataset

        if (dataset && dataset?.counterStart && dataset?.counterEnd && dataset?.counterDuration) {
          const counterStart = parseFloat(dataset.counterStart)
          const counterEnd = parseFloat(dataset.counterEnd)
          const counterDuration = parseFloat(dataset.counterDuration)

          let startTime: number | undefined

          // get the current timestamp and assign it to the currentTime variable
          // eslint-disable-next-line @typescript-eslint/no-unused-vars
          const currentTime: number = Date.now().valueOf()

          // pass the current timestamp to the step function
          const step: FrameRequestCallback = (currentTime: number) => {
            // if the start time is null, assign the current time to startTime
            if (!startTime) {
              startTime = currentTime
            }

            // calculate the value to be used in calculating the number to be displayed
            const progress = Math.min((currentTime - startTime) / counterDuration, 1)

            // calculate what to be displayed using the value gotten above
            const content = Math.floor(progress * (counterEnd - counterStart) + counterStart)

            counterAnimationElement.innerHTML = content.toLocaleString('en-US')

            // checking to make sure the counter does not exceed the last value(counterEnd)
            if (progress < 1) {
              window.requestAnimationFrame(step)
            }
          }

          // start animating
          window.requestAnimationFrame(step)
        }
      })
    }
  }

  const canAnimate = () => {
    return inViewport && counterGroupSize && counterAnimations.length === counterGroupSize
  }

  // ===========================================================================
  // Methods
  // ===========================================================================
  const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
    if (trigger.progress > 0.2) {
      inViewport = true
      initCounterAnimation()
    }
  }

  const emitter = inject('emitter') as Emitter<Events>
  emitter.on('htmlContentMounted', handleEmitReceived)

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    ourFocusScrollTrigger = ScrollTrigger.create({
      trigger: '.people-planet-profit',
      start: 'top top+=300',
      end: 'bottom bottom',
      onUpdate: (self) => {
        scrollTriggerProgressHandler(self)
      },
    })
  })

  onUnmounted(() => {
    emitter.off('htmlContentMounted', handleEmitReceived)
  })

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
  const shapeDataHeader: IImage = {
    id: 'shape-people-planet-profit-header',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-header-helix-with-background.svg',
    width: 2959,
    height: 1899,
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.people-planet-profit {
    .container {
      row-gap: 8.5rem;
      z-index: 2;
    }

    &:deep() {
      .cards {
        justify-content: space-around;
      }

      .card {
        flex: 1 0 0%;
        row-gap: 0rem;
        padding: 0;
        overflow: hidden;

        @include for-phone-lrg-up {
          width: 40.8rem;
          min-width: 40.8rem;
          max-width: 40.8rem;
        }

        .image-container {
          img {
            border-radius: 0;
          }
        }

        .h1 {
          margin-bottom: 0.3rem;

          & + p {
            margin-bottom: 4.3rem;
          }

          &:first-of-type {
            margin-bottom: 6rem;
          }
        }

        &.padded {
          .ml-container {
            padding: 6.4rem 5.8rem;
          }
        }

        p {
          &:last-of-type {
            margin-bottom: 0;
          }
        }

        .h1,
        p {
          text-align: center;
        }

        @include for-tablet-landscape-up {
          .h1,
          p {
            text-align: left;
          }
        }
      }

      #content-frame-people-planet-profit {
        @include for-tablet-landscape-up {
          margin-top: -18rem;
        }
      }

      #shape-people-planet-profit-header {
        top: -96rem;
      }

      #shape-people-planet-profit-footer {
        bottom: -79.5rem;
      }
    }
  }
</style>
