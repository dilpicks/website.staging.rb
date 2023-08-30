<template #card="{ card }">
  <div :class="['card', ...(card?.attributes?.classes ? card.attributes.classes : [])]">
    <Image
      v-if="imageShown"
      :image="imageWithDefaults(card.attributes)"
      :class="['card-header-image']"
    />

    <div class="copy-block">
      <h5 v-if="card?.attributes?.prehead" class="prehead card-prehead">
        {{ card.attributes.prehead }}
      </h5>

      <h3 v-if="card?.attributes?.title" :class="['h3', 'card-title', card?.attributes?.color]">
        {{ card.attributes.title }}
      </h3>

      <HtmlContent
        v-if="card?.attributes?.content"
        :class="['card-content']"
        :content="card.attributes.content"
      />
    </div>
    <div v-if="card?.attributes?.link" class="buttons-container">
      <Link :link="linkWithDefaults(card.attributes.link)" :debug="false">
        {{ card.attributes.link?.content || 'Read More' }}
      </Link>
    </div>
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    computed,
    // defineComponent
    onMounted,
    // ref,
    toRaw,
  } from 'vue'

  import HtmlContent from '@/components/HtmlContent.vue'
  import Image from '@/components/Image.vue'
  import Link from '@/components/Link.vue'
  import { ILink, ICard, ICardAttributes, IImage } from '@/types/general'

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

  const imageShown = computed(() => {
    return props?.card?.attributes?.thumbnail || props?.card?.attributes?.image
  })

  const linkWithDefaults = (link: ILink) => {
    return {
      ...link,
      type: link?.type ? link.type : 'anchor-link',
      classes: ['button', 'button-pill', ...(link?.classes ? link.classes : [])],
    }
  }

  const imageWithDefaults = (attributes: ICardAttributes) => {
    // Typescript is ignored here because there is already a `v-if` check on the element which
    // ensures that either the `thumbnail` or the `image` property exists in order to render
    // the `Image.vue` component.
    // The only other option would be to create a placeholder image, which is a lot of extra
    // work just to appease typescript
    //
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    const compiledImage: IImage = attributes?.thumbnail ? attributes.thumbnail : attributes.image

    if (!compiledImage.width) {
      compiledImage.width = 1224
    }

    if (!compiledImage.height) {
      compiledImage.height = 711
    }

    return compiledImage
  }

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
      console.log('Card.vue - props?.card: ', toRaw(props?.card))
      console.log('Card.vue - props?.card?.componentType: ', props?.card?.componentType)
      console.log('Card.vue - props?.card?.attributes?.link: ', props?.card?.attributes?.link)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .card {
    flex: 1 1 0%;
    flex-direction: column;
    row-gap: 3.5rem;
    width: calc(100% - 4rem);
    min-width: 28rem;
    // max-width: 40.8rem;
    max-width: calc(100vw - 4rem);

    // @wip
    // flex: 1;
    // flex-direction: row;
    // flex-wrap: wrap;
    // row-gap: 3.5rem;
    // min-width: 28rem;

    @include for-phone-up {
      min-width: calc(100% - 4rem);
    }

    @include for-phone-lrg-tablet-up {
      max-width: unset;
    }

    @include for-tablet-mid-up {
      min-width: unset;
    }

    @include for-tablet-landscape-up {
    }

    @include for-desktop-up {
    }

    &.align-center {
      align-content: center;
      align-items: center;
      text-align: center;

      * {
        // align-content: center;
        // align-items: center;
        text-align: center;
      }

      .copy-block {
        align-content: center;
        align-items: center;
        text-align: center;
      }
    }

    &.adjacent-image {
      max-width: 72.9rem;
      padding: 5.3rem 4.9rem;
      margin: 10rem 0;

      .image-container {
        position: absolute;
        z-index: -1;
      }

      .align-right,
      &:nth-of-type(odd) {
        margin-right: 56rem;
        .image-container {
          transform: translateX(70%);
        }
      }

      .align-left,
      &:nth-of-type(even) {
        margin-left: 56rem;
        .image-container {
          transform: translateX(-70%);
        }
      }
    }

    &:deep() {
      .copy-block {
        .prehead {
          margin-bottom: 0.4rem; // -1.5rem;
          text-transform: uppercase;
        }
      }

      .image-container {
        flex: 0 1 auto;
        // opacity: 0.5;

        // &.card-header-image {
        //   img {
        //     width: 100%;
        //     // height: auto;

        //     height: var(--intrinsic-height) !important;
        //     min-width: 40.8rem; //var(--intrinsic-width) !important;

        //     @include for-phone-up {
        //       flex: 1 1 auto;
        //     }
        //   }
        // }
      }
    }
  }
</style>
