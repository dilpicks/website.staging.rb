<template #overlappingImageCard>
  <div
    :id="card.id"
    :class="[
      'overlapping-image-card',
      ...(card?.attributes?.classes ? card.attributes.classes : []),
    ]"
  >
    <Image v-if="card?.attributes?.image" :image="card.attributes.image" />

    <div v-if="card?.attributes?.content" class="copy-block">
      <HtmlContent :class="['overlapping-image-card-content']" :content="card.attributes.content" />
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
  // "Frozen" Constants
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

  .overlapping-image-card {
    align-items: center;
    flex: 0 1 auto;
    flex-direction: row;
    row-gap: 3.5rem;

    flex-wrap: wrap;

    @include for-tablet-portrait-up {
      row-gap: 5rem;
    }

    @include for-desktop-mid-up {
      row-gap: 0;
    }

    &.content-frame {
      flex: 0 1 0;
      width: fit-content;

      &.padded {
        padding: 2.7rem 2.4rem;

        @include for-tablet-portrait-up {
          padding: 5.3rem 4.9rem;
        }

        @include for-desktop-mid-up {
        }
      }
    }

    &.align-right,
    &:nth-of-type(odd) {
      justify-content: flex-start;

      .image-container {
        right: 0;
      }
    }

    &.align-left,
    &:nth-of-type(even) {
      align-self: flex-end;

      .image-container {
        left: 0;
      }
    }

    &:deep() {
      .image-container {
        flex: 0 1 auto;
        border-radius: 2rem;
        overflow: hidden;

        right: 0;

        width: fit-content;

        @include for-desktop-mid-up {
          position: absolute;
          z-index: -1;

          margin: 0 2rem;
        }

        img {
          width: 100%;
          max-width: calc(100vw - 4rem);

          @include for-desktop-mid-up {
            max-width: var(--max-width);
          }
        }
      }

      .copy-block {
        max-width: 65rem;
        // margin: 10rem 0;

        .p3 {
          width: 96%;
        }
      }
    }
  }
</style>
