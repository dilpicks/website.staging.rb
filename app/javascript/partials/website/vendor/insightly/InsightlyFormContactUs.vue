<!-- Note the following changes from the base `insightly_form_simple_newsletter_opt_in.html` code snippet provided by Insightly -->
<!-- 1. The entire snippet is wrapped in the `<div class="form-container insightly-form-container">` element -->
<!-- 2. Added the `insightly-form` classes to the `<form>` -->
<!-- 3. Wrapped each Label/Input pair with `<div class="field insightly-field">` element -->
<!-- 4. Added `placeholder` attribute to inputs where applicable -->
<!-- 5. Removed the `: ` from `<label>` text – e.g.: `<label for="insightly_email">email: </label>` becomes: <label for="insightly_email">email</label>  -->
<!-- 6. Replaced in-line `style="position: absolute; left: -9999px; top: -9999px;"` for off-screen/hidden fields with the `insightly-off-screen` class -->
<!-- 7. Wrapped the `<input type="submit" value="Submit" />` with the `<div class="button-container actions"> element -->
<!-- 8. Additional global styling for Insightly forms can be found in `/assets/css/vendor/insightly.scss` -->

<template #insightlyFormContactUs>
  <div
    :id="props.id"
    :class="[
      'form-container',
      'insightly-form-container',
      ...(props?.classes ? props.classes : []),
    ]"
  >
    <h3 class="h3 navy-100">Tell us about yourself and what you're looking for.</h3>

    <form
      v-if="!showMessage"
      ref="insightlyForm"
      class="form insightly-form"
      action="https://mailto:support@renegadebio.helpscoutapp.com"
      method="post"
      enctype="text/plain"
      @submit.prevent="formSubmitHandler"
    >
      <!-- Hidden -->
      <!-- <input type="hidden" name="formId" value="kIV7iQp0NxKWDHttwmR4eg==" />
      <input id="insightly_ResponsibleUser" type="hidden" name="ResponsibleUser" value="1879762" />
      <input id="insightly_LeadSource" type="hidden" name="LeadSource" value="3198396" /> -->

      <!-- Name -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <!-- <label for="Name">Name</label> -->
        <input
          id="Name"
          name="Name"
          maxlength="256"
          type="text"
          placeholder="Name"
          required
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Email -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <!-- <label for="Email">Email</label> -->
        <input
          id="Email"
          name="Email"
          maxlength="256"
          type="Email"
          placeholder="Email"
          required
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Organization -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <!-- <label for="Organization">Organization</label> -->
        <input
          id="Organization"
          name="Organization"
          maxlength="256"
          type="text"
          placeholder="Organization"
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Title -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <!-- <label for="Title">Title</label> -->
        <input
          id="Title"
          name="Title"
          maxlength="256"
          type="text"
          placeholder="Title"
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Interest Services -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <!-- <label for="insightly_CRO_Services_1__c">CRO Services</label> -->
        <select id="Interest" name="Interest" data-name="Interest" required>
          <option value="">Please select one</option>
          <option value="Customer Support">Customer Support</option>
          <option value="Technical Support">Technical Support</option>
          <option value="Billing Support">Billing Support</option>
          <option value="Partnerships">Partnerships</option>
          <option value="Other">Other</option>
        </select>

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Message -->
      <div class="field insightly-field">
        <!-- <label for="Message">Message</label> -->
        <textarea
          id="Message"
          type="text"
          name="Message"
          maxlength="5000"
          placeholder="Message..."
        />
      </div>

      <!-- Submit -->
      <div class="button-container actions">
        <input
          type="submit"
          value="Submit"
          :class="[{ disabled: !canSubmit }, 'sky-blue-100']"
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

    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('InsightlyFormContactUs.vue - formSubmitHandler - event: ', event)
      console.log('--------------------------------------')
      // eslint-disable-next-line prettier/prettier
      console.log('InsightlyFormContactUs.vue - formSubmitHandler - formData: ', formData)
      console.log('--------------------------------------')
      // eslint-disable-next-line prettier/prettier
      console.log(
        'InsightlyFormContactUs.vue - formSubmitHandler - formDataElement: ',
        formDataElement,
      )
      console.log('--------------------------------------')
      // eslint-disable-next-line prettier/prettier
      console.log(
        'InsightlyFormContactUs.vue - formSubmitHandler - formData.values(): ',
        formData.values(),
      )
      console.log('--------------------------------------')
      // eslint-disable-next-line prettier/prettier
      console.log('InsightlyFormContactUs.vue - formSubmitHandler - action: ', action)
      console.log('--------------------------------------')
      // eslint-disable-next-line prettier/prettier
      console.log('InsightlyFormContactUs.vue - formSubmitHandler - method: ', method)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    /* eslint-disable */
    const status = submit({ action, method, formData })
      .then((response) => {
        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          // eslint-disable-next-line prettier/prettier
          console.log('InsightlyFormContactUs.vue - formSubmitHandler - response: ', response)
          console.log(
            'InsightlyFormContactUs.vue - formSubmitHandler - responseMessage (BEFORE): ',
            responseMessage,
          )
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }

        responseMessage.value = 'Thank you for subscribing!'
        showMessage.value = true

        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          // eslint-disable-next-line prettier/prettier
          console.log(
            'InsightlyFormContactUs.vue - formSubmitHandler - responseMessage (AFTER): ',
            responseMessage,
          )
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }
      })
      .catch((error) => {
        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          // eslint-disable-next-line prettier/prettier
          console.log('InsightlyFormContactUs.vue - formSubmitHandler - error: ', error)
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }

        formErrors.value.push(error ? error : 'An error occurred. Please try again later.')

        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          // eslint-disable-next-line prettier/prettier
          console.log(
            'InsightlyFormContactUs.vue - formSubmitHandler - formErrors.value: ',
            formErrors.value,
          )
          console.log(
            'InsightlyFormContactUs.vue - formSubmitHandler - formErrors.value.length: ',
            formErrors.value.length,
          )
          console.log(
            'InsightlyFormContactUs.vue - formSubmitHandler - !!formErrors.value.length: ',
            !!formErrors.value.length,
          )
          console.log(
            'InsightlyFormContactUs.vue - formSubmitHandler - !!formErrors?.value?.length: ',
            !!formErrors?.value?.length,
          )
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }
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
    //   console.log('InsightlyFormContactUs.vue - props: ', props)
    //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    //   console.log('')
    // }
  })
</script>

<style setup lang="scss" scoped>
  .insightly-form-container {
    .insightly-form {
      // [placeholder]:focus::-webkit-input-placeholder {
      //   transition: all 0.25s ease-out;
      //   opacity: 1;
      // }

      .actions {
        align-content: flex-start;
        align-items: flex-start;
        justify-content: flex-start;
        margin-top: 1.4rem;

        input[type='submit'] {
          // margin-top: 2rem;
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
