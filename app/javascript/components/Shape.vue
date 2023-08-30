<template>
  <div
    v-if="!image?.renderAsSVG"
    :id="image.id"
    :class="['shape', ...(image?.classes ? image.classes : [])]"
    :style="`
      --image-width: ${getBaseDimension(image.width)};
      --image-height: ${getBaseDimension(image.height)};
      --image-src: url('${getClSrc(image)}');
    `"
  />

  <div
    v-if="image?.renderAsSVG"
    :id="image.id"
    ref="svgContainer"
    :class="['shape', 'svg-shape-container', ...(image?.classes ? image.classes : [])]"
  />
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  // eslint-disable-next-line prettier/prettier
  import {
    computed,
    // defineComponent,
    // defineEmits,
    // defineProps,
    inject,
    onMounted,
    // reactive,
    ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'
  import { IShapeImage, Events } from '@/types/general'

  interface Props {
    image: IShapeImage
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  const svgContainer = ref<HTMLElement | null>(null)
  const root = ref(null)
  const emitter = inject('emitter') as Emitter<Events>

  defineExpose({
    root,
  })

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Shape.vue - props.image: ', props.image)
      console.log('Shape.vue - props.debug: ', props.debug)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (props?.image?.renderAsSVG) {
      getSrcAsSVG(props.image)
    }

    emitter.emit('shapeMounted', { id: props.image.id })
  })

  // ===========================================================================
  // Computed
  // ===========================================================================
  const isSVG = computed(() => props.image.src.split('.svg').length == 2)

  // ===========================================================================
  // Methods
  // ===========================================================================
  const getClSrc = (imageData: IShapeImage) => {
    let src = imageData.src

    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Shape.vue::getClSrc - props.image.src: ', props.image.src)
      console.log('--------------------------------------')
      console.log('Shape.vue::getClSrc - isSVG: ', isSVG)
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

  const getSrcAsSVG = (imageData: IShapeImage) => {
    const url = getClSrc(imageData)
    const xhr = new XMLHttpRequest()
    // Making our connection
    xhr.open('GET', url, true)

    // function execute after request is successful
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4 && xhr.status == 200) {
        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('Shape.vue::getSrcAsSVG - xhr.responseText: ', xhr.responseText)
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }

        if (svgContainer?.value) {
          svgContainer.value.innerHTML = xhr.responseText

          emitter.emit('inlineSvgMounted', { id: props.image.id })
        }
      }
    }

    // Sending our request
    xhr.send()
  }

  const getBaseDimension = (dimension: number) => {
    return isSVG.value ? dimension : Math.round(dimension / 3)
  }
</script>

<style setup lang="scss">
  .shape {
    width: 100%;
    max-width: calc((var(--image-width) / 10) * 1rem);
    height: calc((var(--image-height) / 10) * 1rem);

    background-attachment: scroll;
    background-image: var(--image-src);
    background-position: center;
    background-repeat: no-repeat;
    background-size: calc((var(--image-width) / 10) * 1rem) calc((var(--image-height) / 10) * 1rem);
  }
</style>
