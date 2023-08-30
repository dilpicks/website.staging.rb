<template #heroPartial>
  <section :id="data.id" class="section hero">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <Image v-for="(image, index) in data?.images" :key="index" :image="image" />
      <Risographs v-if="data?.risographs" :risographs="data.risographs" />
      <Shape v-for="(shape, index) in data?.shapes" :key="index" :image="shape" />
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineComponent,
    // defineEmits,
    // defineProps,
    inject,
    onMounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  // ===========================================================================
  // Props
  // ===========================================================================
  import HtmlContent from '@/components/HtmlContent.vue'
  import Image from '@/components/Image.vue'
  import Risographs from '@/components/Risographs.vue'
  import Shape from '@/components/Shape.vue'
  import { IPageData, Events } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  const emitter = inject('emitter') as Emitter<Events>

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================

  // ===========================================================================
  // Mounted
  // ===========================================================================
  onMounted(() => {
    emitter.emit('heroMounted', { id: props.data.id })
  })
</script>

<style setup lang="scss">
  @import '@/assets/css/breakpoints';

  .section.hero {
    background-color: $--color-theme-background-primary;
    padding: 0;

    @include for-desktop-mid-up {
      min-height: 88.9rem;
    }

    .container {
      align-content: space-between;
      justify-content: center;
      padding: 2rem 2rem;

      row-gap: 5rem;

      @include for-desktop-mid-up {
        align-content: flex-start;
        justify-content: flex-start;
      }

      @include for-desktop-up {
        padding: 6.2rem 2rem;
      }
    }

    .copy-block {
      justify-content: center;
      row-gap: 0.5rem;
      flex: 0 1 auto;

      @include for-tablet-mid-up {
        justify-content: flex-start;
      }

      @include for-desktop-mid-up {
        flex: 0 1 46%;
      }

      .ml-container {
        justify-content: center;

        @include for-tablet-mid-up {
          justify-content: flex-start;
        }
      }

      .prehead {
        margin-bottom: 0;
        text-align: center;

        font-size: 1.3rem;
        line-height: normal;

        @include for-phone-lrg-up {
          font-size: 1.8rem;
          line-height: normal;
        }

        @include for-tablet-mid-up {
          text-align: left;
          font-size: 2.4rem;
          line-height: normal;
        }
      }

      .h1 {
        text-align: center;

        @include for-tablet-mid-up {
          text-align: left;
        }
      }

      .p2 {
        text-align: center;

        @include for-tablet-mid-up {
          text-align: left;
        }
      }
    }

    .image-container {
      img {
        border-radius: 2rem;
      }
    }

    .risograph-container {
      justify-content: flex-end;
      margin: auto;
      position: relative;

      width: calc(100% / var(--scaling-factor));

      --scaling-factor: 0.3;

      transform: scale(var(--scaling-factor));
      min-width: calc(100% / var(--scaling-factor));
      height: calc(var(--scaling-factor) * 81rem);
      transform-origin: bottom center;

      @include for-phone-lrg-up {
        --scaling-factor: 0.4;
      }

      @include for-phone-lrg-tablet-up {
        --scaling-factor: 0.45;
      }

      @include for-tablet-portrait-up {
        --scaling-factor: 0.5;
      }

      @include for-tablet-portrait-mid-up {
        --scaling-factor: 0.65;
      }

      @include for-tablet-mid-up {
        --scaling-factor: 0.75;
      }

      @include for-desktop-mid-up {
        position: absolute;

        transform: scale(1);
        height: 66.6rem;
        min-width: 73.4rem;
        width: 100%;
      }

      .risograph {
        width: var(--intrinsic-width);
        height: var(--intrinsic-height);
        max-height: var(--intrinsic-height);

        right: 0;
        bottom: 0;

        @include for-desktop-mid-up {
          width: var(--intrinsic-width);
          height: var(--intrinsic-height);
          max-height: unset;
        }
      }
    }
  }
</style>
