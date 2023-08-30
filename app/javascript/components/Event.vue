<template #event>
  <div :id="data.id" :class="['event-container', ...data.classes]">
    <h5 v-if="data?.title" class="p3-bold event-title">{{ data.title }}</h5>
    <div
      v-for="(copyBlock, index) in data.copyBlocks"
      :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
      :key="index"
      :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
    >
      <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
    </div>
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // computed,
    // defineComponent,
    inject,
    onBeforeMount,
    onMounted,
    onUnmounted,
    // ref,
  } from 'vue'

  import { Emitter } from 'mitt'

  import HtmlContent from '@/components/HtmlContent.vue'
  import { IEvent, Events } from '@/types/general'

  // eslint-disable-next-line import/no-named-as-default, import/order
  import gsap from 'gsap'
  // eslint-disable-next-line import/no-named-as-default, import/order
  import ScrollTrigger from 'gsap/ScrollTrigger'
  gsap.registerPlugin(ScrollTrigger)

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IEvent
    debug?: boolean
    groupIndex?: number
  }

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
    groupIndex: 0,
  })

  const emitter = inject('emitter') as Emitter<Events>

  let scrollTrigger: ScrollTrigger

  // ===========================================================================
  // Methods
  // ===========================================================================
  const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
    const eventContainer = document.querySelector(`#${props?.data?.id}`)

    if (trigger.progress > 0) {
      if (eventContainer) {
        eventContainer.classList.add('animate')
      }
    }
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
  const handleElementHeightChange = (value: any) => {
    rebuildScrollTrigger()
  }

  let scrollTriggerStartZoomAdjustment = `top bottom-=20%`
  const handleWindowResize = () => {
    const body = document.querySelector('body')
    const previousValue = scrollTriggerStartZoomAdjustment

    if (body) {
      const computedStyle = window.getComputedStyle(body)

      if (computedStyle && parseFloat(computedStyle.getPropertyValue('zoom')) < 1) {
        scrollTriggerStartZoomAdjustment = `top top+=${200 + props.groupIndex * 10}%`
      } else {
        scrollTriggerStartZoomAdjustment = `top bottom-=20%`
      }
    } else {
      scrollTriggerStartZoomAdjustment = `top bottom-=20%`
    }

    if (previousValue != scrollTriggerStartZoomAdjustment) {
      rebuildScrollTrigger()
    }
  }

  const createScrollTrigger = () => {
    scrollTrigger = ScrollTrigger.create({
      trigger: `#${props?.data?.id}`,
      start: scrollTriggerStartZoomAdjustment,
      end: 'bottom bottom',
      // markers: true,
      // id: props?.data?.id,
      onUpdate: (self) => {
        scrollTriggerProgressHandler(self)
      },
    })
  }

  const rebuildScrollTrigger = () => {
    if (scrollTrigger) {
      scrollTrigger.kill()
    }

    createScrollTrigger()
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onBeforeMount(() => {
    window.addEventListener('resize', handleWindowResize)
    emitter.on('elementHeightChange', handleElementHeightChange)
  })

  onMounted(() => {
    handleWindowResize()
    rebuildScrollTrigger()
  })

  onUnmounted(() => {
    window.removeEventListener('resize', handleWindowResize)
    emitter.off('elementHeightChange', handleElementHeightChange)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .events-container {
    flex-direction: column;
    column-gap: 2rem;
    row-gap: 8.6rem;

    max-width: 100%;

    @include for-phone-up {
      flex: 1 1 auto;
      flex-wrap: wrap;
    }

    &:deep() {
    }

    // $timeline-year-bubble-animation-duration: 500ms;
    // $timeline-year-bubble-animation-ease: cubic-bezier(0.1, 1.25, 1, 1.25);

    .event-container {
      opacity: 0;
      transform: translateX(2rem);

      transition: all $timeline-year-bubble-animation-duration $timeline-year-bubble-animation-ease;

      &.animate {
        opacity: 1;
        transform: translateX(0);
      }
    }
  }
</style>
