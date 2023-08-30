<template #profileCard>
  <div
    :class="['card', 'profile-card', ...(card?.attributes?.classes ? card.attributes.classes : [])]"
  >
    <Image
      v-if="imageShown"
      :image="imageWithDefaults(card.attributes)"
      :class="['card-header-image']"
    />

    <div class="copy-block">
      <h3
        v-if="card?.attributes?.name"
        :class="['h3', 'card-name', 'eggplant-100', card?.attributes?.color]"
      >
        {{ card.attributes.name }}
      </h3>

      <h5 v-if="card?.attributes?.title" class="p3-bold title card-title navy-100">
        {{ card.attributes.title }}
      </h5>

      <HtmlContent
        v-if="card?.attributes?.content"
        :class="['card-content']"
        :content="card.attributes.content"
      />
    </div>
    <div v-if="card?.attributes?.link" class="buttons-container">
      <Link :link="linkWithDefaults(card.attributes.link)" :debug="false">
        <!-- {{ card.attributes.link?.content || 'Read More' }} -->
        <Image :image="linkedInIcon" :class="['linkedin-icon']" />
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
    // ref
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

  const linkedInIcon = computed(() => {
    return {
      src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-linkedin.svg',
      width: 25,
      height: 24,
      alt: 'Link to LinkedIn profile',
      title: 'LinkedIn profile',
    }
  })

  const linkWithDefaults = (link: ILink) => {
    return {
      ...link,
      type: link?.type ? link.type : 'anchor-link',
      classes: [...(link?.classes ? link.classes : [])],
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
      console.log('ProfileCard.vue - props: ', props)
      console.log('ProfileCard.vue - props?.card: ', props?.card)
      console.log(
        'ProfileCard.vue - props?.card?.attributes?.link: ',
        props?.card?.attributes?.link,
      )
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
    max-width: calc(100vw - 4rem);

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

    .copy-block {
      h3.h3 {
        margin-bottom: 0.5rem;
      }

      h5.p3-bold {
        & + .ml-container {
          margin-top: 2rem;
        }
      }
    }

    &.align-center {
      align-content: center;
      align-items: center;
      text-align: center;

      * {
        text-align: center;
      }

      .copy-block {
        align-content: center;
        align-items: center;
        text-align: center;
      }
    }

    &:deep() {
      .copy-block {
        .title {
          margin-bottom: 0.4rem; // -1.5rem;
          text-transform: uppercase;
        }
      }

      .image-container {
        flex: 0 1 auto;

        img {
          border-radius: 1rem;
        }
      }

      .buttons-container {
        .image-container {
          img {
            border-radius: 0;
          }
        }
      }
    }
  }
</style>
