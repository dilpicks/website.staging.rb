<template #manifestoPartial>
  <section :id="data.id" class="section manifesto">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineComponent,
    // inject,
    // nextTick,
    onBeforeMount,
    onMounted,
    onUnmounted,
    // ref,
  } from 'vue'

  // ===========================================================================
  // Props
  // ===========================================================================
  import HtmlContent from '@/components/HtmlContent.vue'
  import { IPageData } from '@/types/general'

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

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let scrollTrigger: ScrollTrigger

  // ===========================================================================
  // Methods
  // ===========================================================================
  const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
    // console.log(`#${props?.data?.id} - progress: `, trigger.progress)
    const copyBlockContainers = document.querySelectorAll<HTMLElement>(`.manifesto .copy-block`)

    if (copyBlockContainers) {
      if (trigger.progress < 0 || trigger.progress >= 1) {
        // copyBlockContainers.forEach((copyBlockContainer: HTMLElement) => {
        //   copyBlockContainer.classList.remove('animate')
        // })
      } else if (trigger.progress >= 0.0 && trigger.progress < 0.33) {
        copyBlockContainers[0].classList.add('animate')
      } else if (trigger.progress >= 0.33 && trigger.progress < 0.66) {
        copyBlockContainers[1].classList.add('animate')
      } else if (trigger.progress >= 0.66 && trigger.progress < 1.0) {
        copyBlockContainers[2].classList.add('animate')
      }
    }
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
      start: 'top center',
      end: 'bottom bottom',
      // markers: true,
      // id: props?.data?.id,
      onUpdate: (self) => {
        scrollTriggerProgressHandler(self)
      },
    })

    const copyBlockContainers = document.querySelectorAll<HTMLElement>(`.manifesto .copy-block`)
    copyBlockContainers.forEach((copyBlockContainer: HTMLElement) => {
      if (ScrollTrigger.isInViewport(copyBlockContainer)) {
        copyBlockContainer.classList.add('animate')
      }
    })
  })

  onUnmounted(() => {
    // window.removeEventListener('resize', handleWindowResize)
    // emitter.off('elementHeightChange', handleElementHeightChange)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.manifesto {
    .container {
      position: relative;

      row-gap: 6rem;

      @include for-tablet-landscape-up {
        row-gap: 1rem;
      }

      :deep() {
        > .copy-block {
          .ml-container {
            @include for-tablet-landscape-up {
              max-width: 50%;
            }
          }

          .prehead {
            opacity: 0;
            transform: translateX(-3rem);
            transition: all 500ms ease-out;
          }

          .h1 {
            opacity: 0;
            transform: translateX(-3rem);
            transition: all 500ms ease-out;
          }

          ul.unmarked-list {
            flex-direction: column;
            padding-left: 4rem;

            opacity: 0;
            transform: translateX(-3rem);
            transition: all 500ms ease-out;
            transition-delay: 250ms;

            @include for-tablet-portrait-up {
              padding-left: 7rem;
            }

            @include for-tablet-mid-up {
              padding-left: 10rem;
            }
          }

          &:nth-of-type(odd) {
            align-content: flex-start;

            .prehead {
              transform: translateX(3rem);
            }

            .h1 {
              transform: translateX(3rem);
            }

            ul.unmarked-list {
              transform: translateX(3rem);
            }
          }

          &:nth-of-type(even) {
            align-content: flex-end;
          }

          &.animate {
            .prehead {
              opacity: 1;
              transform: translateX(0rem);
            }

            .h1 {
              opacity: 1;
              transform: translateX(0rem);
            }

            ul.unmarked-list {
              opacity: 1;
              transform: translateX(0rem);
            }
          }
        }

        .content-frame {
          top: 22.5rem;
        }
      }
    }
  }
</style>
