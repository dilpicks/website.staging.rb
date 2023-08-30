<!-- Note the following changes from the base `insightly_form_simple_newsletter_opt_in.html` code snippet provided by Insightly -->
<!-- 1. The entire snippet is wrapped in the `<div class="form-container insightly-form-container">` element -->
<!-- 2. Added the `insightly-form` & `insightly-inline-form` classes to the `<form>` -->
<!-- 3. Wrapped each Label/Input pair with `<div class="field insightly-field">` element -->
<!-- 4. Added `placeholder` attribute to inputs where applicable -->
<!-- 5. Removed the `: ` from `<label>` text – e.g.: `<label for="insightly_email">email: </label>` becomes: <label for="insightly_email">email</label>  -->
<!-- 6. Replaced in-line `style="position: absolute; left: -9999px; top: -9999px;"` for off-screen/hidden fields with the `insightly-off-screen` class -->
<!-- 7. Wrapped the `<input type="submit" value="Submit" />` with the `<div class="button-container actions"> element -->
<!-- 8. Additional global styling for Insightly forms can be found in `/assets/css/vendor/insightly.scss` -->

<template #insightlyFormSimpleNewsletterOptIn>
  <div
    :id="props.id"
    :class="[
      'form-container',
      'insightly-form-container',
      ...(props?.classes ? props.classes : []),
    ]"
  >
    <form
      v-if="!showMessage"
      ref="insightlyForm"
      class="insightly-form insightly-inline-form"
      name="insightly_form"
      data-form-id="9160"
      action="https://chloe.insightly.services/Forms/MTA3Mzg3My05MTYwLTIwMTA2ODQ%3d"
      method="post"
      @submit.prevent="formSubmitHandler"
    >
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <label for="insightly_email">email</label>
        <input
          id="insightly_email"
          name="email"
          type="email"
          placeholder="email@example.com"
          required
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <div class="field insightly-field insightly-off-screen">
        <label for="insightly_additional_field">Comments</label>
        <input id="insightly_additional_field" type="text" name="insightly_additional_field" />
      </div>

      <div class="button-container actions">
        <input
          type="submit"
          value="Submit"
          :class="{ disabled: !canSubmit }"
          :disabled="!canSubmit"
        />
      </div>
    </form>

    <div v-if="showMessage" class="messages">
      <span class="success p3">
        {{ responseMessage }}
      </span>
    </div>
  </div>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import {
    // computed,
    // defineProps,
    // defineComponent
    onMounted,
    // reactive,
    ref,
  } from 'vue'
  import { submit } from '@/apis/insightly.api'
  import { SubmitMethod } from '@/types/general'

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
  const insightlyForm = ref<InstanceType<typeof HTMLFormElement>>()
  const showMessage = ref(false)
  const responseMessage = ref('')
  const formErrors = ref<InstanceType<typeof Array<string>>>([])
  const canSubmit = ref(true)

  // ===========================================================================
  // Computed
  // ===========================================================================
  // const canSubmit = computed(() => false)

  // ===========================================================================
  // Methods
  // ===========================================================================
  const resetMessages = () => {
    formErrors.value = []
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const formSubmitHandler = (event: Event) => {
    // const formData = new FormData(insightlyForm.value as InstanceType<typeof HTMLFormElement>)
    const formDataElement = insightlyForm.value as InstanceType<typeof HTMLFormElement>
    const formData = new FormData(formDataElement)
    const action = formDataElement.action
    const method = formDataElement.method as SubmitMethod

    // Disable Button
    canSubmit.value = false

    // if (props.debug) {
    //   console.log('')
    //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - event: ', event)
    //   console.log('--------------------------------------')
    //   // eslint-disable-next-line prettier/prettier
    //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - formData: ', formData)
    //   console.log('--------------------------------------')
    //   // eslint-disable-next-line prettier/prettier
    //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - formData.email: ', formData.email)
    //   console.log('--------------------------------------')
    //   // eslint-disable-next-line prettier/prettier
    //   // console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - formDataElement: ', formDataElement)
    //   console.log('--------------------------------------')
    //   // eslint-disable-next-line prettier/prettier
    //   // console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - formData.values(): ', formData.values())
    //   console.log('--------------------------------------')
    //   // eslint-disable-next-line prettier/prettier
    //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - action: ', action)
    //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    //   console.log('')
    // }

    /* eslint-disable */
    const status = submit({ action, method, formData })
      .then((response) => {
        // if (props.debug) {
        //   console.log('')
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   // eslint-disable-next-line prettier/prettier
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - response: ', response)
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - responseMessage (BEFORE): ', responseMessage)
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   console.log('')
        // }

        responseMessage.value = 'Thank you for subscribing!'
        showMessage.value = true

        // if (props.debug) {
        //   console.log('')
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   // eslint-disable-next-line prettier/prettier
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - responseMessage (AFTER): ', responseMessage)
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   console.log('')
        // }
      })
      .catch((error) => {
        // if (props.debug) {
        //   console.log('')
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   // eslint-disable-next-line prettier/prettier
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - error: ', error)
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   console.log('')
        // }

        formErrors.value.push(error ? error : 'An error occurred. Please try again later.')

        // if (props.debug) {
        //   console.log('')
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   // eslint-disable-next-line prettier/prettier
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - formErrors.value: ', formErrors.value)
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - formErrors.value.length: ', formErrors.value.length)
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - !!formErrors.value.length: ', !!formErrors.value.length)
        //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - formSubmitHandler - !!formErrors?.value?.length: ', !!formErrors?.value?.length)
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   console.log('')
        // }
      })
      .finally(() => {
        // Enable Button
        canSubmit.value = true
      })
    /* eslint-enable */
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    // if (props.debug) {
    //   console.log('')
    //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    //   console.log('InsightlyFormSimpleNewsletterOptIn.vue - props: ', props)
    //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    //   console.log('')
    // }
  })
</script>

<style setup lang="scss" scoped>
  .insightly-form-container {
    .insightly-inline-form {
      ::-webkit-input-placeholder {
        color: $--color-theme-navy-60 !important;
        font-size: 1.6rem !important;
      }

      // Firefox 19+
      ::-moz-placeholder {
        color: $--color-theme-navy-60 !important;
        font-size: 1.6rem !important;
      }

      // IE 10+
      :-ms-input-placeholder {
        color: $--color-theme-navy-60 !important;
        font-size: 1.6rem !important;
      }

      // Firefox 18-
      :-moz-placeholder {
        color: $--color-theme-navy-60 !important;
        font-size: 1.6rem !important;
      }

      ::placeholder {
        color: $--color-theme-navy-60 !important;
        font-size: 1.6rem !important;
      }

      .actions {
        align-content: flex-start;
        align-items: flex-start;
        margin-top: 0;

        input[type='submit'] {
          margin-top: 2rem;
          cursor: pointer;

          &.disabled,
          :disabled {
            opacity: 0.5;
            cursor: progress;
          }
        }
      }
    }
  }
</style>
