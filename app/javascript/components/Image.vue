<template>
  <div :class="['image-container', ...(!!image?.classes ? image.classes : [])]">
    <a
      v-if="image?.link"
      :id="image.link?.id"
      :class="image.link?.classes"
      :href="propOrDefault(image.link.href, '#')"
      :rel="propOrDefault(image.link.rel, 'noopener')"
      :target="propOrDefault(image.link.target, '_blank')"
    >
      <img
        :id="image.id"
        :src="getClSrc(image)"
        :title="image.title"
        :alt="image.alt"
        :width="getBaseDimension(image.width)"
        :height="getBaseDimension(image.height)"
        :style="`
          --intrinsic-width: ${getBaseDimension(image.width / 10)}rem;
          --intrinsic-height: ${getBaseDimension(image.height / 10)}rem;
          --max-width: ${getBaseDimension(image.width) / 10}rem;
        `"
      />
    </a>

    <img
      v-if="!image?.link"
      :id="image.id"
      :src="getClSrc(image)"
      :title="image.title"
      :alt="image.alt"
      :width="getBaseDimension(image.width)"
      :height="getBaseDimension(image.height)"
      :style="`
        --intrinsic-width: ${getBaseDimension(image.width / 10)}rem;
        --intrinsic-height: ${getBaseDimension(image.height / 10)}rem;
        --max-width: ${getBaseDimension(image.width) / 10}rem;
      `"
    />
  </div>
</template>

<script setup lang="ts">
  import {
    computed,
    // defineProps,
    // ref,
    toRaw,
  } from 'vue'
  // import Link from '@/components/Link.vue'
  import { IImage } from '@/types/general'

  interface Props {
    image: IImage
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  // ===========================================================================
  // Computed
  // ===========================================================================
  const isSVG = computed(() => {
    if (props?.image?.src) {
      const svgParts = props.image.src.split('.svg')

      return svgParts && svgParts.length == 2
    } else {
      return false
    }
  })

  // ===========================================================================
  // Methods
  // ===========================================================================
  const getClSrc = (imageData: IImage) => {
    let src = imageData.src

    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Image.vue::getClSrc - props: ', props)
      console.log('--------------------------------------')
      console.log('Image.vue::getClSrc - toRaw(props.image): ', toRaw(props.image))
      console.log('--------------------------------------')
      console.log('Image.vue::getClSrc - props.image.src: ', props.image.src)
      console.log('--------------------------------------')
      console.log('Image.vue::getClSrc - isSVG: ', isSVG)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (!isSVG.value) {
      // eslint-disable-next-line prettier/prettier
      const calculatedWidth = getBaseDimension(imageData.width)
      const calculatedHeight = getBaseDimension(imageData.height)
      const clConfig = `upload/f_auto,q_auto,w_${calculatedWidth},h_${calculatedHeight}/dpr_2.0/`

      src = imageData.src.replace('upload/', clConfig)
    }

    return src
  }

  // const isSVG = (src: string) => {
  //   return !!(src.split('.svg').length == 1)
  // }

  const getBaseDimension = (dimension: number) => {
    return isSVG.value ? dimension : Math.round(dimension / 3)
  }

  // Temp, needs refactor to use slots
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const propOrDefault = (prop: any, fallback: any) => {
    if (prop) {
      return prop
    } else {
      return fallback
    }
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .image-container {
    flex: 0 1 0;

    img {
      max-width: var(--max-width);

      // width: 100%;
      width: auto;
      // height: auto;
      height: fit-content;

      // @include for-phone-up {
      //   max-width: 100vw;
      // }
    }

    &.responsive {
      height: 100%;

      img {
        width: auto;
        max-width: 100vw;
        height: auto;
        max-height: 100%;
      }
    }
  }
</style>
