<template #forEveryonesHealth>
  <section :id="data.id" class="section for-everyones-health">
    <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />

    <!-- For testing -->
    <!-- <div id="shape-home-for-everyones-health" class="shape svg-shape-container">
      <svg
        id="shape-home-hero"
        role="img"
        aria-labelledby="aria-label-shape-home-hero"
        x="0"
        y="0"
        width="2959"
        height="2080"
        viewBox="0 0 2959 2080"
        version="1.1"
        xml:space="preserve"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink">

        <title id="aria-label-shape-home-hero">shape home hero</title>

        <path fill="#001542" class="--color-brand-tertiary background-fill" d="M2137.273,1497.142l-392.482-250.017L0,1117.382v-89.657h2958.778l0.222-44.597L2137.273,1497.142z" />
        <path fill="#2808b5" class="--color-brand-blend" d="M2276.484 1458.604c-33.656-27.147-67.83-54.368-102.892-81.219-9.172-7.027-18.344-13.98-27.665-20.933-.148-.148-.296-.222-.444-.37-.148-.074-.222-.148-.37-.296-14.868-11.095-29.958-22.117-45.269-33.064-35.505 28.256-71.085 55.699-107.404 82.106-25.445 18.492-51.261 36.467-77.668 53.702 64.131 41.941 124.713 87.802 184.998 135.808 61.763-43.938 119.832-89.873 176.714-135.734z" />
        <path fill="#20b4f0" class="--color-brand-secondary" d="M1857.669 1177.002c-28.404-13.758-57.326-26.333-86.544-38.168-19.602 7.915-39.5 15.46-59.545 22.487-8.581 3.033-17.235 5.992-25.889 8.802-20.194 6.657-40.683 12.945-61.321 18.714-26.555 7.471-53.48 14.202-80.849 20.194l-9.098 1.997c-112.729 24.114-232.19 36.023-359.935 36.023 226.642 0 413.711 39.648 588.797 124.713 53.628 26.111 103.483 55.403 151.415 86.692 26.407-17.309 52.223-35.209 77.668-53.702 36.319-26.407 71.898-53.85 107.404-82.106-74.119-52.667-153.488-102.522-242.103-145.646zm455.947 311.633c-12.279-9.986-24.706-19.972-37.133-30.031-56.809 45.861-114.948 91.796-176.639 135.808 25.889 20.563 51.705 41.423 77.89 62.578 136.399 110.51 277.385 224.793 455.948 311.559 28.404 13.758 57.252 26.333 86.47 38.168 76.41 30.919 155.854 55.107 238.847 72.712v-221.612c-80.552-20.194-156.889-48.08-231.007-84.103-156.222-75.967-281.675-177.527-414.376-285.079z"/>
        <path fill="#2808b5" class="--color-brand-blend" id="shape-size-reference-anchor" d="M861.3 1247.125h313.187c127.745 0 247.206-11.909 359.935-36.023l9.098-1.997c27.369-5.992 54.294-12.797 80.849-20.194 20.637-5.77 41.127-12.057 61.321-18.714 8.654-2.885 17.309-5.844 25.889-8.802 20.046-7.027 39.87-14.572 59.545-22.487-179.524-72.638-375.617-108.291-596.638-108.291H0v216.509h861.3v-.001z" />
        <path fill="#ff10c7" class="--color-brand-primary" d="M2085.716 694.574s-186.276 140.594-322.432 211.33c-175.086 85.139-362.154 124.712-588.797 124.712 220.947 0 417.04 35.653 596.638 108.291 29.218-11.835 58.14-24.41 86.544-38.168 177.675-86.396 318.143-199.939 453.95-310.006.666-.518 646.567-522.964 646.567-522.964L2958.778 0c-6.213 4.364-872.914 694.426-873.062 694.574zm634.437 215.842c-29.218 11.835-58.14 24.41-86.544 38.168-178.488 86.766-319.548 201.049-455.948 311.559-26.185 21.155-52 42.015-77.89 62.578 17.258 11.024 142.828 107.38 176.64 135.882 12.427-9.986 24.854-20.046 37.133-30.031 132.775-107.552 258.153-209.186 414.377-285.152 74.117-36.023 150.38-63.91 230.932-84.103V837.26c-100.748 21.525-180.116 49.264-238.7 73.156z"/>

        <g id="word-rotator-group">
          <g id="word-rotator-container-lead">
            <text x="845" y="1165" id="word-rotator-for" class="word-rotator-word word-rotator-anchor">For</text>
          </g>

          <g id="word-rotator-variables-container" class="word-rotator-container">
            <text x="940" y="1165" id="word-rotator-variable-everyones" class="word-rotator-word word-rotator-variable">everyone’s</text>
            <text x="940" y="1165" id="word-rotator-variable-her" class="word-rotator-word word-rotator-variable">her</text>
            <text x="940" y="1165" id="word-rotator-variable-his" class="word-rotator-word word-rotator-variable">his</text>
            <text x="940" y="1165" id="word-rotator-variable-your" class="word-rotator-word word-rotator-variable">your</text>
            <text x="940" y="1165" id="word-rotator-variable-their" class="word-rotator-word word-rotator-variable">their</text>
            <text x="940" y="1165" id="word-rotator-variable-our" class="word-rotator-word word-rotator-variable">our</text>
            <text x="940" y="1165" id="word-rotator-variable-my" class="word-rotator-word word-rotator-variable">my</text>
          </g>

          <g id="word-rotator-container-tail" class="word-rotator-container">
            <text x="1075" y="1165" id="word-rotator-health" class="word-rotator-word word-rotator-anchor">health</text>
          </g>
        </g>
      </svg>
    </div> -->
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
    onBeforeMount,
    onMounted,
    onUnmounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  // import Cards from '@/components/Cards.vue'
  // import HtmlContent from '@/components/HtmlContent.vue'
  // import ImageList from '@/components/ImageList.vue'
  // import Risographs from '@/components/Risographs.vue'
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

  withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
  const handleEmitReceived = (value: any) => {
    handleWindowResize()
  }

  const handleWindowResize = () => {
    const shapeSizeReferenceAnchor = document.querySelector('#shape-size-reference-anchor')
    const sectionForEveryonesHealth = document.querySelector(
      '.section.for-everyones-health',
    ) as HTMLElement

    // eslint-disable-next-line prettier/prettier
    if (
      sectionForEveryonesHealth &&
      shapeSizeReferenceAnchor &&
      shapeSizeReferenceAnchor.getBoundingClientRect()?.height
    ) {
      // eslint-disable-next-line prettier/prettier
      sectionForEveryonesHealth.style.minHeight = `${
        shapeSizeReferenceAnchor.getBoundingClientRect().height
      }px`
    }
  }

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================
  const emitter = inject('emitter') as Emitter<Events>
  emitter.on('inlineSvgMounted', handleEmitReceived)

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onBeforeMount(() => {
    window.addEventListener('resize', handleWindowResize)
  })

  onMounted(() => {
    handleWindowResize()
  })

  onUnmounted(() => {
    window.removeEventListener('resize', handleWindowResize)
    emitter.off('inlineSvgMounted', handleEmitReceived)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.for-everyones-health {
    :deep() {
      .svg-shape-container {
        top: -103.6rem;

        @include for-tablet-portrait-up {
          top: -103.3rem;
        }

        svg {
          min-width: 350%;

          .background-fill {
            display: none;
          }

          @include for-tablet-mid-up {
            min-width: 218vw;

            .background-fill {
              display: initial;
            }
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
        font-size: 6.4rem;
      }

      .word-rotator-variable {
        opacity: 0;
        fill: $--color-theme-sky-blue-100;
        font: $--font-secondary-400;
        font-size: 9.6rem;
        animation: fadeInOut 12000ms ease-in infinite;

        @for $i from 1 to 10 {
          &:nth-of-type(#{$i}) {
            animation-delay: ($i - 1) * 1800ms;
          }
        }
      }

      #word-rotator-group {
        transform: scale(0.8) translate(521px, 285px);

        @include for-tablet-mid-up {
          transform: scale(1) translate(0px, 0px);
        }
      }

      // For testing
      // #word-rotator-for,
      // #word-rotator-variable-everyones {
      //   opacity: 1;
      // }

      #word-rotator-health {
        transform: translateX(305px);
        animation: adjustAnchorWordPositionX 12000ms ease-out infinite;
      }
    }
  }

  @keyframes fadeInOut {
    0% {
      transform: translate(0, -20px);
      opacity: 0;
    }

    5% {
      transform: translate(0, 0px);
      opacity: 1;
    }

    10% {
      transform: translate(0, 0px);
      opacity: 1;
    }

    15% {
      transform: translate(0, 20px);
      opacity: 0;
    }
  }

  @keyframes adjustAnchorWordPositionX {
    // For testing to help with placement
    // 0% { transform: translateX(0px); }
    // 100% { transform: translateX(0px); }

    // Initial Position - `everyone's`
    0% {
      transform: translateX(0px);
    }

    4% {
      transform: translateX(305px);
    } // Move to word bound
    14% {
      transform: translateX(305px);
    } // Hold

    // Transition to `her`
    18% {
      transform: translateX(10px);
    } // Move to next word bound
    28% {
      transform: translateX(10px);
    } // Hold

    // Transition to `his`
    32% {
      transform: translateX(0px);
    } // Move to next word bound
    42% {
      transform: translateX(0px);
    } // Hold

    // Transition to `your`
    46% {
      transform: translateX(55px);
    } // Move to next word bound
    56% {
      transform: translateX(55px);
    } // Hold

    // Transition to `their`
    60% {
      transform: translateX(65px);
    } // Move to next word bound
    72% {
      transform: translateX(65px);
    } // Hold

    // Transition to `our`
    76% {
      transform: translateX(10px);
    } // Move to next word bound
    86% {
      transform: translateX(10px);
    } // Hold

    // Transition to `my`
    90% {
      transform: translateX(0px);
    } // Move to next word bound

    //Final Position - Transition back to `everyone's`
    100% {
      transform: translateX(0px);
    } // Hold & Repeat
  }

  .section.for-everyones-health {
    background-color: $--color-theme-white;
    padding-top: 0;
    z-index: 2;

    @include for-tablet-mid-up {
      min-height: unset;
    }
  }
</style>
