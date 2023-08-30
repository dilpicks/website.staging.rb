<template #form>
  <div :class="['form-container', ...(data?.classes ? data.classes : [])]">
    <form>
      <fieldset>
        <div v-for="(field, index) in data.fields" :key="index" class="field">
          <label :for="field.id">{{ field.label }}</label>
          <input
            :id="field.id"
            :name="field.id"
            :type="field.type"
            :value="field.input"
            :placeholder="field.placeholder"
            :disabled="field.disabled"
          />
        </div>

        <div class="field">
          <input type="submit" name="submit" value="Submit" class="button button-pill" />
        </div>
      </fieldset>
    </form>
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // defineProps,
    // defineComponent
    onMounted,
    // ref
  } from 'vue'

  import { IForm } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IForm
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
      console.log('Card.vue - props: ', props)
      console.log('Card.vue - props.data: ', props.data)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup lang="scss">
  .form {
    flex: 0 1 auto;
    flex-direction: column;
    row-gap: 3.5rem;

    &.align-center {
      align-content: center;
      align-items: center;
      text-align: center;
    }

    &.adjacent-image {
      max-width: 72.9rem;
      padding: 5.3rem 4.9rem;
      margin: 10rem 0;

      .image-container {
        position: absolute;
        z-index: -1;
      }

      .align-right,
      &:nth-of-type(odd) {
        margin-right: 56rem;
        .image-container {
          transform: translateX(70%);
        }
      }

      .align-left,
      &:nth-of-type(even) {
        margin-left: 56rem;
        .image-container {
          transform: translateX(-70%);
        }
      }
    }

    .prehead {
      margin-bottom: 0.4rem; // -1.5rem;
      text-transform: uppercase;
    }

    .image-container {
      flex: 0 1 auto;
    }
  }
</style>
