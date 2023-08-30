<template #gallery-item="{ gallery-item }">
  <div :id="`gallery-item-${galleryItem.id}`" ref="root" class="gallery-item">
    <div
      v-for="(copyBlock, index) in galleryItem.copyBlocks"
      :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
      :key="index"
      :class="[
        'copy-block',
        'gallery-item-content-container',
        ...(copyBlock?.classes ? copyBlock.classes : []),
      ]"
    >
      <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
    </div>

    <div class="gallery-item-attribution-container">
      <h5 :class="['p2-bold', 'gallery-item-attribution']">{{ galleryItem.attibution }}</h5>
    </div>
    <Image v-if="galleryItem.image" :image="galleryItem.image" />
  </div>
</template>

<script setup lang="ts">
  import {
    // defineProps,
    // defineComponent
    onMounted,
    ref,
  } from 'vue'

  import HtmlContent from '@/components/HtmlContent.vue'
  import Image from '@/components/Image.vue'
  import { IGalleryItem } from '@/types/general'

  interface Props {
    galleryItem: IGalleryItem
    debug?: boolean
  }

  // const props = defineProps<Props>()
  const root = ref(null)

  withDefaults(defineProps<Props>(), {
    debug: false,
  })

  defineExpose({
    root,
  })

  onMounted(() => {
    // the DOM element will be assigned to the ref after initial render
    // console.log(root.value) // this is your $el
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .gallery-item {
    align-items: center;
    align-content: center;
    flex: 0 1 100%;
    flex-wrap: wrap;
    justify-content: center;
    row-gap: 4rem;
    min-width: 100%;
    opacity: 0;

    &:first-of-type {
      opacity: 1;
    }

    .gallery-item-content-container {
      flex: 1 1 100%;
    }

    .gallery-item-attribution-container {
      display: flex;
      flex: 1 1 100%;
      justify-content: center;
    }

    &:deep() {
      p {
        color: $--color-theme-white;
        text-align: center;
      }

      .gallery-item-attribution {
        color: $--color-theme-sky-blue-100;
        text-align: center;
        text-transform: uppercase;

        // max-width: 70%;
      }

      q {
        quotes: '“' '”' '‘' '’';
      }

      q::before {
        content: open-quote;
      }

      q::after {
        content: close-quote;
      }

      .image-container {
        flex: 0 1 15rem;
        justify-content: center;
        align-items: center;

        @include for-phone-lrg-up {
          flex: 0 1 20rem;
        }

        &.profile {
          border-radius: 50%;
          max-width: 11.5rem;
          max-height: 11.5rem;
          overflow: hidden;
        }
      }
    }
  }
</style>
