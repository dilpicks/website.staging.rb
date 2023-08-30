<template #testimonials>
  <section :id="data.id" class="section testimonials">
    <div class="container">
      <Gallery
        v-if="data?.galleryItems"
        :id="'gallery-testimonials'"
        :gallery-items="data.galleryItems"
        :auto-scroll-delay="15"
        :auto-scroll-enabled="false"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  // import Cards from '@/components/Cards.vue'
  // import HtmlContent from '@/components/HtmlContent.vue'
  // import ImageList from '@/components/ImageList.vue'
  // import Risographs from '@/components/Risographs.vue'
  // import Shape from '@/components/Shape.vue'
  import Gallery from '@/components/Gallery.vue'
  import { IPageData } from '@/types/general'

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
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.testimonials {
    background-color: $--color-theme-background-secondary-dark;
    min-height: 57.3rem;
  }

  :deep() {
    .gallery-item {
      q {
      }
    }
  }
</style>
