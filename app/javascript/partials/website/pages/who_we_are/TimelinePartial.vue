<template #timelinePartial>
  <section :id="data.id" class="section timeline">
    <ImageList
      v-if="data?.images"
      :id="'timeline-image-list'"
      :images="data.images"
      :classes="['card']"
    />

    <div class="container timeline-background-container">
      <Shape :image="shapeData" />
    </div>

    <div class="container">
      <div class="timeline-container">
        <h2 class="h1 navy-100 timeline-title">A brief history</h2>
        <div
          v-for="(copyBlock, index) in data.copyBlocks"
          :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
          :key="index"
          :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
        >
          <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
        </div>

        <div
          v-if="data?.eventCollection"
          :id="data.eventCollection?.id"
          :class="[
            'event-collections-container',
            ...(data.eventCollection?.classes ? data.eventCollection.classes : []),
          ]"
        >
          <TimelineYearsEventGroup
            v-for="(eventGroup, index) in data.eventCollection.eventGroups"
            :key="index"
            :data="eventGroup"
            :group-index="index"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Vue
  // ===========================================================================
  import {
    // computed,
    // defineComponent,
    // inject,
    onBeforeMount,
    onMounted,
    onUnmounted,
    // ref,
  } from 'vue'

  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import TimelineYearsEventGroup from '@/components/TimelineYearsEventGroup.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import ImageList from '@/components/ImageList.vue'
  import { IPageData, IImage } from '@/types/general'
  import Shape from '@/components/Shape.vue'

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

  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================

  const shapeData: IImage = {
    id: 'shape-who-we-are-timeline',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-who-we-are-timeline-light-blue-bg-no-blue-line.svg',
    width: 2959,
    height: 10000,
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let scrollTrigger: ScrollTrigger

  // ===========================================================================
  // Methods
  // ===========================================================================
  const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
    // console.log(`#${props?.data?.id} - progress: `, trigger.progress)
    const imageContainers = document.querySelectorAll<HTMLElement>(
      `#timeline-image-list .image-container`,
    )

    if (imageContainers) {
      if (trigger.progress < 0.075 || trigger.progress >= 0.7) {
        imageContainers.forEach((imageContainer: HTMLElement) => {
          imageContainer.classList.remove('animate')
        })
      } else if (trigger.progress >= 0.075 && trigger.progress < 0.21) {
        imageContainers[0].classList.add('animate')
      } else if (trigger.progress >= 0.21 && trigger.progress < 0.41) {
        imageContainers[1].classList.add('animate')
      } else if (trigger.progress >= 0.41 && trigger.progress < 0.7) {
        imageContainers[2].classList.add('animate')
      }
    }

    // const imageContainer = document.querySelector(`#timeline-image-list .image-container`)

    // if (imageContainer) {
    //   if (trigger.progress < 0.15 || trigger.progress > 0.7) {
    //     imageContainer.classList.remove('animate')
    //   } else if (trigger.progress > 0.15) {
    //     imageContainer.classList.add('animate')
    //   }
    // }
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onBeforeMount(() => {
    // window.addEventListener('resize', handleWindowResize)
    // emitter.on('elementHeightChange', handleElementHeightChange)
  })

  onMounted(() => {
    // handleWindowResize()
    // rebuildScrollTrigger()

    scrollTrigger = ScrollTrigger.create({
      trigger: `#${props?.data?.id}`,
      start: 'top bottom',
      end: 'bottom bottom',
      // markers: true,
      // id: props?.data?.id,
      onUpdate: (self) => {
        scrollTriggerProgressHandler(self)
      },
    })
  })

  onUnmounted(() => {
    // window.removeEventListener('resize', handleWindowResize)
    // emitter.off('elementHeightChange', handleElementHeightChange)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.timeline {
    padding-top: 0;
    background-color: $--color-theme-background-primary;

    margin-top: -20rem;

    min-height: 347.4rem;
    overflow: visible;

    .container {
      align-content: center;
      align-items: center;
      flex-direction: column;
      row-gap: 8.5rem;
      padding-top: 80rem;

      z-index: auto;

      @include for-phone-up {
        padding-top: 84rem;
      }
    }

    .timeline-background-container {
      margin-top: -64rem;
      padding-top: 0;

      width: 100%;

      @include for-desktop-narrow-up {
        max-width: $--width-site-max;
      }
    }

    .timeline-container {
      flex-direction: column;
      max-width: 100%;
      position: relative;

      @include for-phone-lrg-tablet-up {
        margin-left: 0rem;
      }

      @include for-tablet-mid-up {
        margin-left: 2rem;
      }

      @include for-desktop-narrow-up {
        row-gap: 15rem;
        margin-right: -54rem;
        width: 80rem;
      }

      .timeline-title {
        margin-left: 5rem;
        margin-bottom: 5rem;

        @include for-phone-up {
          margin-left: 10rem;
          margin-bottom: 5rem;
          text-align: center;
        }

        @media (min-width: 655px) {
          margin-left: 26%;
        }

        @include for-desktop-narrow-up {
          text-align: left;
          margin-left: 0rem;
        }

        @include for-desktop-wide-up {
          margin-left: 26rem;
          margin-bottom: -5rem;
        }
      }
    }

    .timeline-path {
      position: absolute;
      left: 0rem;
      top: 0rem;

      background-color: $--color-theme-magenta-100;
      width: 18.6rem;
      min-width: 18.6rem;
      max-width: 18.6rem;
      height: 100%;
    }

    .event-collections-container {
      flex-direction: column;
      row-gap: 3rem;

      @include for-desktop-narrow-up {
        max-width: 80%;
        row-gap: 15rem;
      }
    }
  }

  :deep() {
    #shape-who-we-are-timeline {
      background-position-y: -64rem;
      left: -60%;

      @include for-phone-up {
        left: -55%;
      }

      @include for-phone-lrg-up {
        left: -50%;
      }

      @include for-phone-lrg-tablet-up {
        left: -38%;
      }

      @include for-tablet-portrait-up {
        left: -36%;
      }

      @include for-tablet-landscape-up {
        left: -36%;
      }

      @include for-desktop-narrow-up {
        background-position-y: 0rem;
        left: 0;
      }

      @include for-desktop-narrow-to-mid-up {
        left: 0;
      }
    }

    #timeline-image-list {
      display: none;

      @include for-desktop-narrow-up {
        display: flex;
      }

      align-self: center;
      align-items: center;
      justify-content: center;
      width: 2959px;
      min-width: 2959px;

      position: fixed;
      // top: 143rem;
      top: 15rem;
      bottom: 15rem;

      flex-direction: column;
      row-gap: 34.2rem;

      margin-left: -95rem;

      .image-container {
        opacity: 0;
        position: absolute;

        transition: opacity 500ms ease-out;

        &.animate {
          opacity: 1;
        }
      }
    }
  }
</style>
