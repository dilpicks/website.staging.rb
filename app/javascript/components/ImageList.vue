<template #imageList>
  <div :id="id" :class="['image-list-container', ...classes]">
    <Image v-for="(image, index) in images" :key="index" :image="image" />
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  // import {
  //   // computed
  //   // defineComponent
  //   // onMounted,
  //   // ref
  // } from 'vue'

  import Image from '@/components/Image.vue'
  import { IImage } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    images: Array<IImage>
    id?: string | undefined
    classes?: Array<string> | null
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    id: undefined,
    classes: () => [],
    debug: false,
  })

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .image-list-container {
    column-gap: 2rem;
    row-gap: 8.6rem;

    max-width: 100%;

    @include for-phone-up {
      flex: 1 1 auto;
      flex-wrap: wrap;
    }

    &.stacked {
      flex-direction: column;
    }
  }
</style>
