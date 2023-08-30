<template>
  <div class="risograph-container">
    <img
      v-for="risograph in props.risographs"
      :id="risograph.id"
      :key="risograph.id"
      :class="['risograph', ...(risograph?.classes ? risograph.classes : [])]"
      :src="getClSrc(risograph)"
      :title="risograph.title"
      :alt="risograph.alt"
      :width="getBaseDimension(risograph.width)"
      :height="getBaseDimension(risograph.height)"
      :style="`
        --intrinsic-width: ${getBaseDimension(risograph.width) / 10}rem;
        --intrinsic-height: ${getBaseDimension(risograph.height / 10)}rem;
        --max-width: ${getBaseDimension(risograph.width) / 10}rem;
      `"
    />
  </div>
</template>

<script setup lang="ts">
  import // computed,
  // defineComponent,
  // defineEmits,
  // defineProps,
  // inject,
  // onMounted,
  // reactive,
  // ref,
  // toRaw,
  'vue'

  import { IRisographImage } from '@/types/general'

  // type IRisographImage = {
  //   id: string
  //   src: string
  //   width: number
  //   height: number
  //   title?: string
  //   alt?: string
  //   classes?: Array<string>
  // }

  interface Props {
    risographs: Array<IRisographImage>
  }

  const props = defineProps<Props>()

  // Methods
  const getClSrc = (risographData: IRisographImage) => {
    // eslint-disable-next-line prettier/prettier
    const clConfig = `upload/f_auto,q_auto,w_${getBaseDimension(
      risographData.width,
    )},h_${getBaseDimension(risographData.height)}/dpr_2.0/`

    // console.log('risographData: ', risographData)
    // console.log('clConfig: ', clConfig)
    // console.log('risographData.src.replace(\'upload/\', clConfig): ', risographData.src.replace('upload/', clConfig))

    return risographData.src.replace('upload/', clConfig)
  }

  const getBaseDimension = (dimension: number) => {
    return Math.round(dimension / 3)
  }

  // Computed
  // const double = computed(() => count.value * 2)

  // const props = defineProps({
  //   risographs: { type: Array, required: true },
  // })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .risograph-container {
    align-items: flex-end;

    position: absolute;
    z-index: 10;

    right: 0;
    bottom: 0;

    mix-blend-mode: multiply;

    // min-width: 73.4rem;
    height: 66.6rem;

    @include for-tablet-mid-up {
      min-width: 73.4rem;
    }

    .risograph {
      position: absolute;

      mix-blend-mode: multiply;

      // width: auto;
      // max-width: 100vw;

      // height: auto;
      // max-height: 100%;
    }
  }
</style>
