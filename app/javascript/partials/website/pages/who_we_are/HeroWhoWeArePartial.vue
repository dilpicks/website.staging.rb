<template #heroWhoWeArePartial>
  <section :id="data.id" class="section hero-who-we-are">
    <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />
  </section>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineComponent,
    // defineEmits,
    // defineProps,
    inject,
    onBeforeMount,
    onMounted,
    onUnmounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import Shape from '@/components/Shape.vue'
  import { IPageData, Events } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null
    debug?: boolean
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  const wordRotatorLeadEntry = 'renegade is'
  const wordRotatorTailEntry = 'for everyone'

  const wordRotatorEntries = [
    'unpretentious science',
    'giving you access to your health data',
    'developing cutting edge diagnostics',
    'driving innovation in biotech',
    'creating pathways through healthcare',
    'building grassroots community partnerships',
    'demanding better health, and healthcare',
  ]

  const typeSpeed = 30
  const typePause = 2000

  let currentWordIndex = 0

  let wordRotatorLead: Element | null
  let wordRotatorTail: Element | null

  let wordRotatorVariableTextContainer: Element | null
  let wordRotatorVariableCursorContainer: HTMLElement | null

  const handleInlineSvgMounted = () => {
    handleWindowResize()

    wordRotatorLead = document.querySelector('#word-rotator-lead')
    wordRotatorTail = document.querySelector('#word-rotator-tail')

    // eslint-disable-next-line prettier/prettier
    wordRotatorVariableTextContainer = document.querySelector(
      '#word-rotator-text-node .text-content',
    )

    // eslint-disable-next-line prettier/prettier
    wordRotatorVariableCursorContainer = document.querySelector(
      '#word-rotator-text-node .text-cursor',
    )

    if (wordRotatorLead && wordRotatorTail) {
      wordRotatorLead.textContent = wordRotatorLeadEntry
      wordRotatorTail.textContent = wordRotatorTailEntry
    }

    typeText()
  }

  const typeText = () => {
    const textArray = wordRotatorEntries[currentWordIndex].split('')
    const typeTextInterval = setInterval(() => {
      if (wordRotatorVariableTextContainer) {
        if (!!textArray.length) {
          // ts-ignore because `textContent` is a method and we've already verified the existence of the element.
          // eslint-disable-next-line @typescript-eslint/ban-ts-comment
          // @ts-ignore
          wordRotatorVariableTextContainer.textContent += textArray.shift()
        } else {
          clearInterval(typeTextInterval)

          if (wordRotatorVariableCursorContainer) {
            wordRotatorVariableCursorContainer.classList.add('blink')
          }

          setTimeout(() => {
            if (wordRotatorVariableCursorContainer) {
              wordRotatorVariableCursorContainer.classList.remove('blink')
            }

            deleteText()
          }, typePause)
        }
      }
    }, typeSpeed)
  }

  const deleteText = () => {
    if (wordRotatorVariableTextContainer?.textContent) {
      const textArray = wordRotatorVariableTextContainer.textContent.split('')

      const deleteTextInterval = setInterval(() => {
        if (!!textArray.length && wordRotatorVariableTextContainer) {
          textArray.pop()
          wordRotatorVariableTextContainer.textContent = textArray.join('')
        } else {
          clearInterval(deleteTextInterval)

          if (wordRotatorEntries.length > currentWordIndex + 1) {
            currentWordIndex++
          } else {
            currentWordIndex = 0
          }

          typeText()
        }
      }, typeSpeed)
    }
  }

  const handleWindowResize = () => {
    const shapeSizeReferenceAnchor = document.querySelector('#shape-size-reference-anchor')
    const whoWeAreSection = document.querySelector(
      '#who-we-are-section-hero-who-we-are',
    ) as HTMLElement

    // eslint-disable-next-line prettier/prettier
    if (whoWeAreSection && shapeSizeReferenceAnchor?.getBoundingClientRect()?.height) {
      // eslint-disable-next-line prettier/prettier
      whoWeAreSection.style.minHeight = `${
        shapeSizeReferenceAnchor.getBoundingClientRect().height
      }px`
    }
  }

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================
  const emitter = inject('emitter') as Emitter<Events>

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onBeforeMount(() => {
    window.addEventListener('resize', handleWindowResize)
    emitter.on('inlineSvgMounted', handleInlineSvgMounted)
  })

  onMounted(() => {
    handleWindowResize()
  })

  onUnmounted(() => {
    window.removeEventListener('resize', handleWindowResize)
    emitter.off('inlineSvgMounted', handleInlineSvgMounted)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.hero-who-we-are {
    :deep() {
      .svg-shape-container {
        align-items: center;
        max-height: 100%;

        svg {
          min-width: 203vw;

          @include for-phone-up {
            min-width: 205vw;
          }

          @include for-phone-lrg-up {
            min-width: 210vw;
          }

          @include for-phone-lrg-tablet-up {
            min-width: 215vw;
          }

          @include for-tablet-mid-up {
            min-width: 220vw;
          }

          @include for-tablet-landscape-up {
            min-width: 222vw;
          }

          @include for-desktop-narrow-to-mid-up {
            min-width: 225vw;
          }

          @include for-desktop-up {
            min-width: 295.9rem;
            height: auto;
          }
        }
      }

      .word-rotator-anchor {
        fill: $--color-theme-white;
        font: $--font-secondary-400;
        font-size: 4rem;
      }

      .word-rotator-variable {
        fill: $--color-theme-sky-blue-100;
        font: $--font-secondary-400;
        font-size: 6.2rem;

        .text-cursor {
          fill: $--color-theme-white;
          font: $--font-primary-200;
          font-size: 6.2rem;

          &.blink {
            animation: blink 1000ms ease-in infinite;
          }
        }

        @for $i from 1 to 10 {
          &:nth-of-type(#{$i}) {
            animation-delay: ($i - 1) * 1800ms;
          }
        }
      }

      #word-rotator-group {
        transform: scale(1) translate(0px, 0px);
      }
    }
  }

  @keyframes blink {
    0% {
      opacity: 0;
    }

    50% {
      opacity: 0;
    }

    51% {
      opacity: 1;
    }

    100% {
      opacity: 1;
    }
  }

  .section.hero-who-we-are {
    box-sizing: content-box;
    z-index: 2;

    @include for-tablet-mid-up {
      min-height: unset;
    }
  }
</style>
