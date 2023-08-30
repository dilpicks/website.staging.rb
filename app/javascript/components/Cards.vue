<template #cards>
  <div :class="['cards', ...classes]">
    <component
      :is="pascalize(card?.componentType || 'Card')"
      v-for="(card, index) in props.cards"
      :id="card?.id"
      :key="index"
      :card="card"
      :debug="debug"
    />
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // computed,
    // defineProps,
    // defineComponent,
    onMounted,
    // reactive,
    // ref,
  } from 'vue'

  import { ICard } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    cards: Array<ICard>
    classes?: Array<string> | null
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    classes: () => [],
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
      console.log('Cards.vue - onMounted - props.cards: ', props.cards)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })

  // ===========================================================================
  // Helpers
  // ===========================================================================
  const pascalize = (key: string | null | undefined = null) => {
    let pascalized = null

    if (key && String(!!key?.length)) {
      const camelized = camelize(key)

      if (camelized) {
        pascalized = camelized.substr(0, 1).toUpperCase() + camelized.substr(1)
      }
    }

    // console.log('pascalize - key: ', key)
    // console.log('pascalize - pascalized: ', pascalized)

    return pascalized
  }

  const camelize = (key: string) => {
    const stringified = key?.toString()

    // eslint-disable-next-line prettier/prettier
    if (!/[-_\s]/.test(stringified)) {
      // No separators (dashes, underscores, or spaces) in stringified – e.g.: 'MyParam'

      // eslint-disable-next-line prettier/prettier
      if (!/^[A-Z]/.test(stringified) || !/[a-z]/.test(stringified)) {
        // Key starts with a lowercase letter (which assumes it's already camelcase) – e.g.: 'myParam'
        return stringified
      } else {
        // Key does not start with a lowercase letter – e.g.: 'MyParam'
        // In this case, we downcase the first letter and return the updated stringified, e.g.: 'myParam'

        const k = stringified.substr(0, 1).toLowerCase() + stringified.substr(1)
        // console.log('--------------------------------------')
        // console.log('Linguist::camelizeKey - k: ', k)
        // console.log('--------------------------------------')

        return k
      }
    }

    // eslint-disable-next-line prettier/prettier
    let camelized = stringified
      .trim()
      .toLowerCase()
      .replace(/([-_\s][a-z])/g, (group) => group.toUpperCase().replace(/[-_\s]/g, ''))
    let compiledKey = `${camelized}`

    return compiledKey
  }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .cards {
    flex: 1 1 auto;
    flex-wrap: wrap;
    // justify-content: space-around;

    column-gap: 2rem;
    row-gap: 5.5rem;

    @include for-desktop-narrow-up {
      row-gap: 8.6rem;
    }

    @include for-tablet-mid-up {
      justify-content: flex-start;
    }

    &.stacked {
      flex-direction: column;
    }
  }
</style>
