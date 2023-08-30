<template #animatedComponent>
  <div ref="target">
    <transition :name="animation.type">
      <div v-inline-transition="animate" class="animation-container">
        <slot />
      </div>
    </transition>
  </div>
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
    ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'
  import { IAnimation, Events } from '@/types/general'

  interface Props {
    debug?: boolean
    animation: IAnimation
  }

  withDefaults(defineProps<Props>(), {
    debug: false,
  })

  const emitter = inject('emitter') as Emitter<Events>
  const target = ref()
  const animate = ref(false)

  const observer = new IntersectionObserver(
    ([entry]) => {
      const animationContainer = document.querySelector('.animation-container')

      if (entry.isIntersecting && animationContainer) {
        animate.value = true
        animationContainer.classList.add('animation-triggered')
      }
    },
    {
      threshold: 0.5,
    },
  )

  // ===========================================================================
  // Mounted
  // ===========================================================================
  onMounted(() => {
    emitter.emit('animationMounted')

    observer.observe(target.value)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .animation-container.fade-enter-from,
  .animation-container.zoom-enter-from {
    transition: none;
  }

  .fade-enter-active {
    transition: all 300ms ease;
  }

  .fade-enter-from {
  }
</style>
