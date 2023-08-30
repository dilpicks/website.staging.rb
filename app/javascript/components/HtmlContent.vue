<template #htmlContent>
  <!--
    `vue/no-v-html` linter disabled here as only approved users
    will submit content via `tinymce`
  -->
  <!-- eslint-disable-next-line vue/no-v-html -->
  <div :id="id" :class="['ml-container', ...classes]" v-html="content" />
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
  import { Events } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================

  interface Props {
    content: string
    id?: string | undefined
    classes?: Array<string>
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    id: undefined,
    classes: () => [],
    debug: false,
  })

  const emitter = inject('emitter') as Emitter<Events>

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    emitter.emit('htmlContentMounted', props?.id)
  })
</script>
