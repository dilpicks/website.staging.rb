<template #callout>
  <div class="container content-frame padded cta-frame">
    <div :id="callout.id" :class="['copy-block', ...(callout?.classes ? callout.classes : [])]">
      <HtmlContent :content="callout.content" />
    </div>
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // computed,
    // defineComponent
    onMounted,
    // ref,
    toRaw,
  } from 'vue'

  import HtmlContent from '@/components/HtmlContent.vue'
  import { ICallout } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    callout: ICallout
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Callout.vue - props: ', props)
      console.log('Callout.vue - props?.callout: ', toRaw(props?.callout))
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';
</style>
