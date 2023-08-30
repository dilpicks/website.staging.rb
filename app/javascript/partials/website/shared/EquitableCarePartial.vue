<template #equitableCarePartial>
  <section :id="data.id" class="section equitable-care">
    <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />

    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <div
        v-if="data?.animationBlock"
        :id="data?.animationBlock.id"
        :class="[
          'animation-block',
          // eslint-disable-next-line prettier/prettier
          ...(data.animationBlock?.classes ? data.animationBlock.classes : []),
        ]"
      >
        <!-- Animation Header -->
        <div
          v-for="(copyBlock, index) in data.animationBlock?.copyBlocks"
          :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
          :key="index"
          :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
        >
          <HtmlContent :content="copyBlock.content" />
        </div>

        <AnimatedComponent :animation="data.animationBlock?.animation" class="animated-component">
          <HtmlContent :content="data.animationBlock.animation.content" />
        </AnimatedComponent>
      </div>

      <Cards v-if="data?.cards" :cards="data.cards" :classes="['stacked']" />
      <!-- <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" /> -->
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    onMounted,
    // ref
  } from 'vue'

  import AnimatedComponent from '@/components/AnimatedComponent.vue'
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import Shape from '@/components/Shape.vue'
  import { IPageData } from '@/types/general'

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
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('EquitableCarePartial.vue - props: ', props)
      console.log('EquitableCarePartial.vue - props.data: ', props.data)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.equitable-care {
    background-color: $--color-theme-navy-100;
    padding: 0rem;

    &:deep() {
      .container {
        row-gap: 8.5rem;
        z-index: 2;

        column-gap: 4rem;

        @include for-desktop-narrow-to-mid-up {
          column-gap: 6rem;
        }

        @include for-desktop-narrow-to-mid-up {
          column-gap: 11rem;
        }
      }

      .cards {
        flex: 1 1 0%;
      }

      .card {
        flex: 1 0 0%;
        row-gap: 1.3rem;
        padding: 5.3rem 3.1rem;
      }

      // .animated-chart-frame {
      //   flex: 1 1 auto;
      //   padding: 2.5rem;

      //   @include for-tablet-landscape-up {
      //     flex: 0 1 auto;
      //     padding: 2.5rem;
      //   }

      //   @include for-desktop-narrow-up {
      //     flex: 0 1 auto;
      //     padding: 3.5rem;
      //   }

      //   .animated-chart-container {
      //     align-content: center;
      //     align-items: center;
      //     flex-wrap: wrap;
      //     justify-content: center;
      //     row-gap: 2.1rem;

      //     margin-top: 3rem;
      //   }

      //   .animated-component {
      //     padding: 0 1rem;
      //   }

      //   .animation-container {
      //     .animated-item-container {
      //       position: relative;

      //       flex: 1 1 auto;
      //       justify-content: center;
      //       align-items: center;
      //       align-content: center;
      //       flex-direction: column;

      //       margin-bottom: 0;
      //       min-width: 25.7rem;

      //       margin-left: -1rem;
      //       margin-right: -1rem;

      //       background-repeat: no-repeat;
      //       background-size: cover;
      //       border-radius: 2rem;

      //       mix-blend-mode: multiply;

      //       .figure-percentage {
      //         font-size: 6rem;
      //         line-height: 1;

      //         padding-top: 1rem;
      //       }

      //       &:nth-of-type(1) {
      //         background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-prevalence-of-preeclampsia-by-race-pink.svg');

      //         // @media (min-width: 800px) {}
      //         min-width: 22.1rem;
      //         max-width: 22.1rem;
      //         width: 22.1rem;

      //         min-height: 22.1rem;
      //         max-height: 22.1rem;
      //         height: 22.1rem;
      //       }

      //       &:nth-of-type(2) {
      //         background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-prevalence-of-preeclampsia-by-race-blue.svg');

      //         // @media (min-width: 800px) {}
      //         min-width: 17.9rem;
      //         max-width: 17.9rem;
      //         width: 17.9rem;

      //         min-height: 17.9rem;
      //         max-height: 17.9rem;
      //         height: 17.9rem;

      //         .figure-percentage {
      //           font-size: 5rem;
      //         }
      //       }

      //       &:nth-of-type(3) {
      //         background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/charts/chart-prevalence-of-preeclampsia-by-race-purple.svg');

      //         // @media (min-width: 800px) {}
      //         min-width: 16.7rem;
      //         max-width: 16.7rem;
      //         width: 16.7rem;

      //         min-height: 16.7rem;
      //         max-height: 16.7rem;
      //         height: 16.7rem;

      //         .figure-percentage {
      //           font-size: 4rem;
      //         }
      //       }
      //     }

      //     .animated-item-container {
      //       opacity: 0;

      //       @media (min-width: 800px) {
      //         transform: translateX(-5rem);
      //       }

      //       transition-property: opacity, transform;
      //       transition-duration: 300ms;
      //       transition-timing-function: ease-out;

      //       @for $i from 1 to 10 {
      //         &:nth-of-type(#{$i}) {
      //           transition-delay: ($i - 1) * 250ms;
      //         }
      //       }
      //     }

      //     &.animation-triggered {
      //       .animated-item-container {
      //         opacity: 1;

      //         @media (min-width: 800px) {
      //           transform: translateX(0);
      //         }
      //       }
      //     }
      //   }
      // }

      #shape-section-equitable-care-background {
        @include for-phone-sml-up {
          background-image: none;
        }

        @include for-desktop-narrow-up {
          background-image: var(--image-src);
          background-position-x: -51rem;
          background-position-y: -72rem;
          height: 100%;
        }
      }
    }
  }
</style>
