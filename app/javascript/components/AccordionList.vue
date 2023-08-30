<template #accordionList>
  <div :id="accordionList.id" ref="accordion-list-list" class="accordion">
    <div class="accordion-items-wrapper">
      <div ref="slider" class="accordion-items">
        <AccordionItem
          v-for="accordionItem in accordionList.accordionItems"
          :ref="(el) => (elementRefs[`accordion-item-${accordionItem.id}`] = el)"
          :key="accordionItem.id"
          :accordion-item="accordionItem"
        />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineProps,
    // defineComponent,
    inject,
    onMounted,
    onUnmounted,
    ref,
  } from 'vue'

  import { Emitter } from 'mitt'

  import AccordionItem from '@/components/AccordionItem.vue'
  import { IAccordionList, IElementRefs, Events } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    accordionList: IAccordionList
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    transitionDuration: 1,
    initialExpandedItemId: null,
    debug: false,
  })

  // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
  const handleEmitReceived = (value: any) => {
    // console.log('expandItem received!', value)
    loadItem(value?.id)
  }

  // ===========================================================================
  // Data
  // ===========================================================================
  const currentItemId = ref<string>(props.accordionList.accordionItems[0].id)
  const elementRefs = ref<IElementRefs>({})

  // ===========================================================================
  // Computed
  // ===========================================================================

  // ===========================================================================
  // Methods
  // ===========================================================================
  const loadItem = (itemId: string) => {
    if (props.debug || props.accordionList.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Accordion.vue - loadItem - itemId: ', itemId)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (props.accordionList.accordionItems.length > 1) {
      const previousItem: HTMLDivElement | null = elementRefs.value[
        `accordion-item-${currentItemId.value}`
      ]?.root as HTMLDivElement | null

      currentItemId.value = itemId

      const nextItem: HTMLDivElement | null = elementRefs.value[
        `accordion-item-${currentItemId.value}`
      ]?.root as HTMLDivElement | null

      if (previousItem && nextItem) {
        previousItem.classList.remove('active')

        setTimeout(() => {
          nextItem.classList.add('active')
        }, 250)
      }
    }
  }

  const emitter = inject('emitter') as Emitter<Events>
  emitter.on('expandItem', handleEmitReceived)

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Accordion.vue - onMounted - currentItemId: ', currentItemId)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    loadItem(currentItemId.value)
  })

  onUnmounted(() => {
    emitter.off('expandItem', handleEmitReceived)
  })
</script>

<style setup lang="scss">
  .accordion {
    align-items: center;
    justify-content: space-between;

    .accordion-items-wrapper {
      flex: 0 1 auto;
      align-items: center;
      align-content: center;
      justify-content: flex-start;
    }

    .accordion-items {
      flex-wrap: wrap;
      row-gap: 5.6rem;
    }
  }
</style>
