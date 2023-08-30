<template #calloutPartial>
  <section :id="data.id" class="section our-technology-partners">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent
          v-if="copyBlock?.content && copyBlock?.id != 'collaboration-stages'"
          :content="copyBlock.content"
        />
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

        <!--  -->
        <AnimatedComponent :animation="data.animationBlock?.animation" class="animated-component">
          <HtmlContent :content="data.animationBlock.animation.content" />
        </AnimatedComponent>
      </div>

      <Cards v-if="data?.cards" :cards="data.cards" />

      <!-- eslint-disable-next-line prettier/prettier -->
      <Callout v-for="(callout, index) in data?.callouts" :key="index" :callout="callout" />
    </div>

    <Shape :image="shapeData" />
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import AnimatedComponent from '@/components/AnimatedComponent.vue'
  import Callout from '@/components/Callout.vue'
  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import Shape from '@/components/Shape.vue'
  import { IImage, IPageData } from '@/types/general'

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

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================
  const shapeData: IImage = {
    id: 'shape-our-technology-partners-background',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-background.svg',
    width: 2959,
    height: 1744,
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.our-technology-partners {
    background-color: $--color-theme-white;

    .container {
      row-gap: 8.5rem;
    }

    &:deep() {
      .card {
        row-gap: 1.3rem;
        padding-bottom: 5.3rem;
        padding-top: 5.3rem;

        .h2 {
          color: $--color-theme-navy-100;
          margin-bottom: 1rem;
        }

        .button {
          background-color: $--color-theme-sky-blue-100;
        }
      }

      // TODO responsive
      #collaboration-stages {
        padding: 2rem;

        @include for-tablet-landscape-up {
          padding: 4rem;
        }

        @include for-desktop-narrow-up {
          padding: 6.5rem;
        }

        .collaboration-stages-cards {
          align-content: flex-end;
          align-items: flex-end;
          flex-wrap: wrap;
          justify-content: center;
          row-gap: 2.1rem;

          margin-top: 3rem;
        }

        .animated-component {
          padding: 0 1.7rem;
        }

        .animation-container {
          .animated-item-container {
            position: relative;
            flex: 1 1 auto;
            justify-content: flex-start;
            align-items: flex-start;
            align-content: flex-start;

            margin-bottom: 0;
            min-width: 25.7rem;

            margin-left: -1.7rem;
            margin-right: -1.7rem;

            background-repeat: no-repeat;
            background-size: cover;
            border-radius: 2rem;

            mix-blend-mode: multiply;

            ul.unmarked-list {
              list-style: none;
              display: flex;
              flex-direction: column;
              margin: 0;
              padding: 1.7rem;
              row-gap: 1rem;

              @media (min-width: 800px) {
                padding: 4.3rem 7.2rem;
              }

              li {
                font: $--font-secondary-400;
                color: $--color-theme-white;
                font-size: 1.7rem;
                line-height: 3.9rem;

                @media (min-width: 800px) {
                  font-size: 2.5rem;
                  line-height: 3.9rem;
                }
              }
            }

            &#collaboration-stage-assessment-and-data-analysis {
              background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/graphics/collaboration-stages-assessment-and-data-analysis-background-square.svg');

              @media (min-width: 800px) {
                min-width: 40rem;
                height: 26.4rem;
              }

              ul.unmarked-list {
                @media (min-width: 800px) {
                  padding-left: 4.3rem;
                }
              }
            }

            &#collaboration-stage-protocol-development {
              background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/graphics/collaboration-stages-protocol-development-background-square.svg');

              @media (min-width: 800px) {
                min-width: 40rem;
                height: 30.4rem;
              }

              ul.unmarked-list {
              }
            }

            &#collaboration-stage-go-to-market-strategy {
              background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/graphics/collaboration-stages-go-to-market-strategy-background-square.svg');

              @media (min-width: 800px) {
                min-width: 40rem;
                height: 34.7rem;
              }

              ul.unmarked-list {
              }
            }
          }

          .animated-item-container {
            opacity: 0;

            @media (min-width: 800px) {
              transform: translateX(-5rem);
            }

            transition-property: opacity, transform;
            transition-duration: 300ms;
            transition-timing-function: ease-out;

            @for $i from 1 to 10 {
              &:nth-of-type(#{$i}) {
                transition-delay: ($i - 1) * 250ms;
              }
            }
          }

          &.animation-triggered {
            .animated-item-container {
              opacity: 1;

              @media (min-width: 800px) {
                transform: translateX(0);
              }
            }
          }
        }
      }

      #content-frame-developing-preventative-diagnostics-in-house-and-in-partnership {
        margin-top: -17rem;
      }

      #shape-our-technology-partners-background {
        bottom: -46.5rem;
      }
    }
  }
</style>
