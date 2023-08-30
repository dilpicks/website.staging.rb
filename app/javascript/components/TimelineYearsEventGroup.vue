<template #timelineYearsEventGroup>
  <div :id="data?.id" :class="['event-group-container', ...(data?.classes ? data.classes : [])]">
    <div v-if="data?.title" class="event-group-title timeline-year-title">
      <h3>{{ data.title }}</h3>
      <div class="title-bg" />
    </div>

    <div v-if="data?.eventGroups" class="event-groups-container">
      <EventGroup
        v-for="(eventGroup, index) in data.eventGroups"
        :key="index"
        :data="eventGroup"
        :group-index="groupIndex"
      />
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
    // nextTick,
    onBeforeMount,
    onMounted,
    onUnmounted,
    // ref,
  } from 'vue'

  import { Emitter } from 'mitt'

  import EventGroup from '@/components/EventGroup.vue'
  import { IEventGroup, Events } from '@/types/general'

  // eslint-disable-next-line import/no-named-as-default, import/order
  import gsap from 'gsap'
  // eslint-disable-next-line import/no-named-as-default, import/order
  import ScrollTrigger from 'gsap/ScrollTrigger'
  gsap.registerPlugin(ScrollTrigger)

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IEventGroup
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
    // console.log(`#${props?.data?.id} - progress: `, trigger.progress)
    const yearBubble = document.querySelector(`#${props?.data?.id}`)

    if (yearBubble) {
      if (trigger.progress > 0) {
        yearBubble.classList.add('animate')
      }
    }
  }

  // const scrollTriggerProgressHandler = (trigger: ScrollTrigger) => {
  //   console.log(`#${props?.data?.id} - progress: `, trigger.progress)
  //   const yearBubble = document.querySelector(`#${props?.data?.id}`)

  //   if (yearBubble) {
  //     if (trigger.progress < 0.3 || trigger.progress > 0.99) {
  //       console.log(`#${props?.data?.id} - REMOVE ANIMATE...`)
  //       yearBubble.classList.remove('animate')
  //     } else {
  //       yearBubble.classList.add('animate')
  //     }
  //   }
  // }

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
        // eslint-disable-next-line prettier/prettier
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
      end: 'bottom bottom-=20%',
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

  .event-group-container.timeline-year {
    flex-direction: column;
    align-items: flex-start;
    column-gap: 2rem;
    row-gap: 2.2rem;

    flex-wrap: wrap;

    width: 100%;

    @include for-phone-up {
      flex: 1 1 auto;
      flex-wrap: wrap;
    }

    &.adjacent {
      @include for-desktop-narrow-up {
        flex-direction: row;
        justify-content: flex-start;
      }

      :deep() {
        .event-groups-container {
          padding-left: 0;

          @include for-desktop-narrow-up {
            padding-top: 7rem;
          }

          .event-group-container {
            &.timeline-month {
              .timeline-event {
                @include for-desktop-narrow-up {
                  margin-left: 1rem;
                }

                strong {
                  text-transform: uppercase;
                }
              }
            }
          }
        }
      }
    }

    .event-group-title {
      display: flex;
      align-content: center;
      align-items: center;
      justify-content: center;
      position: relative;

      margin-left: -5rem;

      @include for-phone-lrg-tablet-up {
        margin-left: 0;
      }

      @include for-desktop-narrow-up {
        flex: 0 0 26rem;
      }

      h3 {
        color: $--color-theme-white;
        word-break: break-all;
        position: absolute;

        font-size: 4.8rem;
        line-height: 5rem;
        max-width: 5rem;

        opacity: 0;
        transform: scale(0);

        transition: all $timeline-year-bubble-animation-duration
          $timeline-year-bubble-animation-ease;

        @include for-desktop-narrow-up {
          font-size: 9.6rem;
          line-height: 9rem;
          max-width: 10rem;
        }
      }

      .title-bg {
        background-color: $--color-theme-sky-blue-100;
        mix-blend-mode: multiply;

        opacity: 0;
        transform: scale(0);

        transition: all $timeline-year-bubble-animation-duration
          $timeline-year-bubble-animation-ease;

        width: 14.4rem;
        min-width: 14.4rem;
        max-width: 14.4rem;

        height: 14.4rem;
        min-height: 14.4rem;
        max-height: 14.4rem;

        border-radius: 50%;

        @include for-desktop-narrow-up {
          width: 26rem;
          min-width: 26rem;
          max-width: 26rem;

          height: 26rem;
          min-height: 26rem;
          max-height: 26rem;
        }
      }
    }

    &.animate {
      .timeline-year-title {
        h3,
        .title-bg {
          opacity: 1;
          transform: scale(1);
        }
      }
    }

    .event-groups-container {
      flex-direction: column;
      width: 100%;

      @include for-desktop-narrow-up {
        padding-left: 12rem;
        row-gap: 6rem;
      }
    }

    :deep() {
      .event-group-container {
        &.timeline-month {
          @include for-desktop-narrow-up {
            flex-direction: row;
          }

          .event-group-title {
            font-size: 3rem;
            text-align: right;
            color: $--color-theme-light-blue-100;

            width: 5.5rem;
            min-width: 5.5rem;
            max-width: 5.5rem;

            @include for-phone-lrg-up {
              font-size: 5rem;
              line-height: 5rem;

              width: 7rem;
              min-width: 7rem;
              max-width: 7rem;
            }

            @include for-phone-lrg-tablet-up {
              font-size: 6.4rem;
              line-height: 6.4rem;

              width: 14.2rem;
              min-width: 14.2rem;
              max-width: 14.2rem;
            }

            @include for-desktop-narrow-up {
              font-size: 6.4rem;
              line-height: 6.4rem;

              width: 10.2rem;
              min-width: 10.2rem;
              max-width: 10.2rem;
            }
          }

          .events-container {
            row-gap: 2rem;

            margin-left: 15%;

            @include for-phone-lrg-up {
              margin-left: 19%;
            }

            @include for-phone-lrg-tablet-up {
              margin-left: 29%;
            }

            @include for-tablet-portrait-up {
              margin-left: 28%;
            }

            @include for-tablet-portrait-mid-up {
              margin-left: 28%;
            }

            @media (min-width: 700px) {
              margin-left: 26%;
            }

            @include for-tablet-mid-up {
              margin-left: 23%;
            }

            @media (min-width: 825px) {
              margin-left: 22%;
            }

            @include for-tablet-landscape-up {
              margin-left: 22%;
            }

            @include for-desktop-narrow-up {
              margin-left: 0;
            }
          }

          .event-title {
            color: $--color-theme-eggplant-100;
            text-transform: uppercase;
            font-size: 1.3rem;

            @include for-desktop-narrow-up {
              font-size: 1.8rem;
            }
          }

          .timeline-event {
            flex-direction: column;
            margin-left: 5rem;
            position: relative;
            mix-blend-mode: multiply;

            &:before {
              display: block;
              position: absolute;
              left: -5.7rem;
              top: 1.1rem;
              content: '';
              width: 4.7rem;
              height: 0.5rem;
              background-color: $--color-theme-sky-blue-100;
            }

            .timeline-event-copy {
              font-size: 1.3rem;
              line-height: 2.15rem;

              @include for-desktop-narrow-up {
                font-size: 1.8rem;
                line-height: 2.7rem;
              }
            }
          }
        }
      }
    }
  }
</style>
