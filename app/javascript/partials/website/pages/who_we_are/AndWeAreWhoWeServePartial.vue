<template #andWeAreWhoWeServePartial>
  <section :id="data.id" class="section and-we-are-who-we-serve">
    <div class="container">
      <div id="floating-image-left-container" class="card">
        <Image v-if="floatingImageLeft" :image="floatingImageLeft" />
      </div>

      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <div id="floating-image-right-container" class="card">
        <Image v-if="floatingImageRightForeground" :image="floatingImageRightForeground" />
        <Image v-if="floatingImageRightBackground" :image="floatingImageRightBackground" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineProps,
    // defineComponent,
    // inject,
    // onBeforeMount,
    onMounted,
    // onUpdated,
    // onUnmounted,
    // reactive,
    // ref,
  } from 'vue'

  // ===========================================================================
  // Props
  // ===========================================================================
  import Image from '@/components/Image.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import { IPageData, IImage } from '@/types/general'

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

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
  const floatingImageLeft: IImage = {
    id: 'and-we-are-who-we-serve-floating-image-left',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/sf-pride-2022-openhouse',
    width: 1192,
    height: 1146,
  }

  const floatingImageRightForeground: IImage = {
    id: 'and-we-are-who-we-serve-image-floating-image-right-foreground',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/covid-testing-checkin-pride-2020',
    width: 1192,
    height: 1146,
    classes: ['foreground'],
  }

  const floatingImageRightBackground: IImage = {
    id: 'and-we-are-who-we-serve-image-floating-image-right-background',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/heinz-lab-build-team',
    width: 814,
    height: 783,
    classes: ['background'],
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  // onBeforeMount(() => {
  //   const tempInterval = setInterval(() => {
  //     const partialBoundingBox = document.getElementById(props?.data?.id).getBoundingClientRect()
  //     console.log(`AndWeAreWhoWeServePartial[${props?.data?.id}] - partialBoundingBox.height (INTERVAL): `, partialBoundingBox.height)
  //     console.log(`AndWeAreWhoWeServePartial[${props?.data?.id}] - partialBoundingBox.y (INTERVAL): `, partialBoundingBox.y)

  //     if (partialBoundingBox.height > 1000) {
  //       clearInterval(tempInterval)
  //     }
  //   }, 1)
  // })

  onMounted(() => {
    // console.log('AndWeAreWhoWeServePartial - onMounted...')
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.and-we-are-who-we-serve {
    .container {
      position: relative;

      #floating-image-left-container {
        justify-content: center;

        @include for-desktop-narrow-up {
          position: absolute;
          left: -38rem;
          top: 15rem;
        }

        @include for-desktop-narrow-to-mid-up {
          left: -33rem;
        }

        @include for-desktop-mid-up {
          left: -27rem;
        }

        :deep() {
          .image-container {
            img {
              max-width: calc(100vw - 4rem);

              @include for-desktop-narrow-up {
                max-width: var(--max-width);
              }
            }
          }
        }
      }

      #floating-image-right-container {
        position: absolute;
        left: 107rem;
        top: 14rem;

        :deep() {
          .image-container {
            position: absolute;

            // Foreground
            &.foreground {
              z-index: 2;
              left: 1rem;
              top: 20rem;
            }

            // Background
            &.background {
              z-index: 1;
              left: 7em;
              top: 0rem;
            }
          }
        }
      }

      :deep() {
        > .copy-block {
          margin-top: 2rem;
          align-content: center;

          @include for-phone-lrg-up {
            margin-top: 5.7rem;
          }

          @include for-tablet-portrait-mid-up {
            margin-top: 8rem;
          }

          @include for-desktop-narrow-up {
            margin-top: 0rem;
          }

          @include for-desktop-mid-up {
            margin-top: 12.3rem;
          }

          .ml-container {
            align-items: center;

            p {
              @include for-tablet-landscape-up {
                max-width: 60%;
              }
            }
          }

          ul.unmarked-list {
            flex-direction: column;
            padding-left: 10rem;
          }
        }

        .content-frame {
          top: 22.5rem;
        }
      }
    }
  }
</style>
