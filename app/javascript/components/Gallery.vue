<template #gallery>
  <div
    ref="gallery"
    class="gallery"
    @mouseenter="toggleAutoScroll(false)"
    @mouseleave="toggleAutoScroll(true)"
  >
    <div class="control chevron-left" @click.prevent="previousItemHandler" />
    <div class="gallery-items-wrapper">
      <div ref="slider" class="gallery-items">
        <GalleryItem
          v-for="galleryItem in galleryItems"
          :ref="(el) => (elementRefs[`gallery-item-${galleryItem.id}`] = el)"
          :key="galleryItem.id"
          :gallery-item="galleryItem"
        />
      </div>
    </div>
    <div class="control chevron-right" @click.prevent="nextItemHandler" />
  </div>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineProps,
    // defineComponent,
    onMounted,
    ref,
  } from 'vue'

  // import Vue from 'vue'
  import { gsap } from 'gsap'

  import GalleryItem from '@/components/GalleryItem.vue'
  import { IGalleryItem, IElementRefs } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    id: string
    galleryItems: Array<IGalleryItem>
    autoScrollEnabled?: boolean
    autoScrollDelay?: number
    transitionDuration?: number
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    autoScrollEnabled: true,
    autoScrollDelay: 3,
    transitionDuration: 1,

    debug: false,
  })

  // ===========================================================================
  // Data
  // ===========================================================================
  const slider = ref<HTMLElement | null>(null)
  const currentItemId = ref<string>(props.galleryItems[0].id)
  const elementRefs = ref<IElementRefs>({})
  const autoScrollInterval = ref<number | null>(null)
  const autoScrollActive = ref<boolean | null>(props.autoScrollEnabled)

  // ===========================================================================
  // Computed
  // ===========================================================================
  // const ponyImageUrl = computed(() => `/pony-${props.ponyModel.color}${props.isRunning ? '-running' : ''}.gif`);

  // ===========================================================================
  // Methods
  // ===========================================================================
  const autoScoll = () => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Gallery.vue::autoScroll - running `autoScoll`...')
      console.log('--------------------------------------')
      console.log('Gallery.vue::autoScroll - props.autoScrollEnabled: ', props.autoScrollEnabled)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (props.autoScrollEnabled) {
      if (props.debug) {
        console.log('')
        console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        console.log('Gallery.vue::autoScroll - running `autoScrollInterval`...')
        console.log('--------------------------------------')
        // eslint-disable-next-line prettier/prettier
        console.log(
          'Gallery.vue::autoScroll - (1000 * props.autoScrollDelay): ',
          1000 * props.autoScrollDelay,
        )
        console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        console.log('')
      }

      autoScrollInterval.value = setInterval(() => {
        if (!!autoScrollActive.value) {
          nextItemHandler()
        }
        // eslint-disable-next-line prettier/prettier
      }, 1000 * props.autoScrollDelay + props.autoScrollDelay)
    }
  }

  const toggleAutoScroll = (active: boolean) => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Gallery.vue::autoScroll - toggleAutoScroll - active: ', active)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    autoScrollActive.value = active
  }

  const previousItemHandler = () => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Gallery.vue - previousItemHandler...')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    let itemElementId = props.galleryItems[getItemIndex() - 1]?.id

    if (currentItemId.value === props.galleryItems[0].id) {
      itemElementId = props.galleryItems[props.galleryItems.length - 1]?.id
    }

    loadItem(itemElementId)
  }

  const nextItemHandler = () => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Gallery.vue - nextItemHandler...')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    let itemElementId = props.galleryItems[getItemIndex() + 1]?.id

    if (currentItemId.value === props.galleryItems[props.galleryItems.length - 1]?.id) {
      itemElementId = props.galleryItems[0].id
    }

    loadItem(itemElementId)
  }

  const getItemIndex = () => {
    return props.galleryItems.findIndex((itemData) => itemData.id === currentItemId.value)
  }

  const loadItem = (itemId: string) => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Gallery.vue - loadItem - itemId: ', itemId)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (props.galleryItems.length > 1) {
      // const previousItemIndex = getItemIndex()
      const previousItem: HTMLDivElement | null = elementRefs.value[
        `gallery-item-${currentItemId.value}`
      ]?.root as HTMLDivElement | null

      currentItemId.value = itemId

      const nextItemIndex = getItemIndex()
      const nextItem: HTMLDivElement | null = elementRefs.value[
        `gallery-item-${currentItemId.value}`
      ]?.root as HTMLDivElement | null

      if (previousItem && nextItem) {
        // eslint-disable-next-line prettier/prettier
        const transitionToX = 0 - nextItem.offsetWidth * nextItemIndex

        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('Gallery.vue - nextItem: ', nextItem)
          console.log('Gallery.vue - nextItem.offsetWidth: ', nextItem.offsetWidth)
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }

        if (slider.value) {
          gsap.to(slider.value, {
            x: transitionToX,
          })
        }

        if (previousItem) {
          gsap.to(previousItem, {
            opacity: 0,
          })
        }

        if (nextItem) {
          gsap.to(nextItem, {
            opacity: 1,
          })
        }
      }
    }
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    // Then setup the interval to refresh every `props.autoScrollDelay` n seconds (default is 3 seconds)
    autoScoll()
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .gallery {
    // align-items: flex-end;
    align-items: center;
    justify-content: space-between;

    // @wip
    width: calc(100vw - 4rem);

    // @include for-tablet-mid-up {
    //   align-items: center;
    // }

    .control {
      flex: 0 1 0;
    }

    .gallery-items-wrapper {
      flex: 0 1 auto;
      align-items: center;
      align-content: center;
      justify-content: flex-start;
      max-width: 106.8rem;
      overflow: hidden;
    }

    .gallery-items {
      // @wip
      width: 100%;
    }

    .control {
      min-width: 2.4rem;
      height: 2.4rem;
      cursor: pointer;

      // margin-bottom: 83%;
      // margin-bottom: 5rem;

      @include for-phone-lrg-up {
        min-width: 4.8rem;
        height: 4.8rem;
      }

      @include for-tablet-mid-up {
        min-width: 7.8rem;
        height: 7.8rem;
        // margin-bottom: unset;
      }
    }

    .chevron-right {
      background-image: url(https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-chevron-right.svg);
      background-position: center center;
      background-repeat: no-repeat;
      background-size: contain;
    }

    .chevron-left {
      background-image: url(https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-chevron-left.svg);
      background-position: center center;
      background-repeat: no-repeat;
      background-size: contain;
    }
  }
</style>
