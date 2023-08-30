<!-- Note the following changes from the base `insightly_form_simple_newsletter_opt_in.html` code snippet provided by Insightly -->
<!-- 1. The entire snippet is wrapped in the `<div class="form-container">` element -->
<!-- 2. Added the `insightly-form` class to the `<form>` -->
<!-- 3. Wrapped each Label/Input pair with `<div class="field insightly-field">` element -->
<!-- 4. Replaced in-line `style="position: absolute; left: -9999px; top: -9999px;"` for off-screen/hidden fields with the `insightly-off-screen` class -->
<!-- 5. Wrapped the `<input type="submit" value="Submit" />` with the `<div class="actions button-container"> element -->
<!-- 6. Additional global styling for Insightly forms can be found in `/assets/css/vendor/insightly.scss` -->

<template #insightlyFormSimpleNewsletterOptIn>
  <div :class="['form-container', ...classes]">
    <form
      class="insightly-form"
      name="insightly_form"
      data-form-id="9160"
      action="https://chloe.insightly.services/Forms/MTA3Mzg3My05MTYwLTIwMTA2ODQ%3d"
      method="post"
      @submit.prevent="formSubmitHandler"
    >
      <div class="field insightly-field">
        <label for="insightly_email">email: </label>
        <input id="insightly_email" name="email" type="text" required />
      </div>

      <div class="field insightly-field insightly-off-screen">
        <label for="insightly_additional_field">Comments</label>
        <input id="insightly_additional_field" type="text" name="insightly_additional_field" />
      </div>

      <div class="actions button-container">
        <input type="submit" value="Submit" />
      </div>
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

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    id: string
    classes?: Array<string>
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    classes: () => [],
    debug: false,
  })

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================

  const formSubmitHandler = (event: Event) => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('InsightlyFormContactUs.vue - formSubmitHandler - event: ', event)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('InsightlyForm.vue - props: ', props)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup lang="scss">
  .insightly-off-screen {
    position: absolute;
    left: -9999px;
    top: -9999px;
  }
</style>
