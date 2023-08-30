<template #adjacentImageCard>
  <div
    :id="card.id"
    :class="['adjacent-image-card', ...(card?.attributes?.classes ? card.attributes.classes : [])]"
  >
    <Shape v-if="card?.attributes?.shape" :image="card.attributes.shape" />
    <Image v-if="card?.attributes?.image" :image="card.attributes.image" />

    <div v-if="card?.attributes?.content" class="copy-block">
      <HtmlContent :class="['adjacent-image-card-content']" :content="card.attributes.content" />
    </div>
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // defineProps,
    // defineComponent
    onMounted,
    // ref
  } from 'vue'

  import HtmlContent from '@/components/HtmlContent.vue'
  import Shape from '@/components/Shape.vue'
  import Image from '@/components/Image.vue'
  import { ICard } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    card: ICard
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  // ===========================================================================
  // Methods
  // ===========================================================================

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Card.vue - props: ', props)
      console.log('Card.vue - props.card: ', props.card)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .adjacent-image-card {
    align-content: flex-start;
    align-items: flex-start;
    flex: 1 1 auto;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;

    column-gap: 3.5rem;
    row-gap: 3.5rem;

    @include for-tablet-landscape-up {
      flex: 0 1 auto;
    }

    @include for-desktop-narrow-to-mid-up {
      column-gap: 5rem;
      flex-wrap: nowrap;
    }

    @include for-desktop-mid-up {
      column-gap: 10rem;
    }

    &.align-top {
      .image-container,
      .svg-shape-container {
        align-self: flex-start;
      }
    }

    &.align-right,
    &:nth-of-type(odd) {
      flex-direction: row;

      &.align-left {
        flex-direction: row-reverse;
      }

      .image-container,
      .svg-shape-container {
        right: 0;
      }

      .content-frame {
      }
    }

    &.align-left,
    &:nth-of-type(even) {
      flex-direction: row-reverse;

      &.align-right {
        flex-direction: row;
      }

      .image-container,
      .svg-shape-container {
        left: 0;
      }

      .content-frame {
      }
    }

    &:deep() {
      $container-gap: 4.6rem;
      $image-container-bias: 60%;

      .image-container,
      .svg-shape-container {
        justify-content: center;
        align-self: center;
        flex: 1 1 auto;

        @include for-desktop-narrow-to-mid-up {
          justify-content: flex-end;
          flex: 0 1 calc($image-container-bias - $container-gap);
        }

        img,
        svg {
          width: 100%;
        }

        svg {
          height: auto;
        }

        &.content-frame {
          overflow: hidden;

          align-items: center;
        }
      }

      .svg-shape-container {
        position: relative;
      }

      .copy-block {
        width: 100%;

        @include for-desktop-narrow-up {
          width: 44%;
        }
      }

      .content-block {
        width: 100%;
      }

      .adjacent-image-card-content {
        .h1 {
          margin-bottom: 0.3rem;
        }

        .p3 {
          margin-bottom: 3.5rem;

          &:last-child {
            margin-bottom: 0rem;
          }
        }

        ul {
          li {
            &.p3 {
              margin-bottom: 0rem;
            }
          }
        }
      }
    }
  }
</style>
