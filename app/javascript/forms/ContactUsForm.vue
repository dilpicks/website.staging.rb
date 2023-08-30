<template #contactUsForm>
  <div
    :id="props.id"
    :class="[
      'form-container',
      // 'insightly-form-container',
      ...(props?.classes ? props.classes : []),
    ]"
  >
    <h3 v-if="!showMessage" class="h3 navy-100">
      Tell us about yourself and what you're looking for.
    </h3>

    <form
      v-if="!showMessage"
      ref="form"
      class="form insightly-form"
      action="/contacts"
      method="post"
      @submit.prevent="formSubmitHandler"
    >
      <!-- First Name -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field', 'required']">
        <!-- <label for="first-name">First Name</label> -->
        <input
          id="first-name"
          name="first_name"
          maxlength="256"
          type="text"
          placeholder="First Name"
          required
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Last Name -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field', 'required']">
        <!-- <label for="last-name">Last Name</label> -->
        <input
          id="last-name"
          name="last_name"
          maxlength="256"
          type="text"
          placeholder="Last Name"
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
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field', 'required']">
        <!-- <label for="email">Email</label> -->
        <input
          id="email"
          name="email"
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
        <!-- <label for="organization">Organization</label> -->
        <input
          id="organization"
          name="organization"
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

      <!-- Role -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field']">
        <!-- <label for="role">Role</label> -->
        <input
          id="role"
          name="role"
          maxlength="256"
          type="text"
          placeholder="Role"
          @input="resetMessages"
        />

        <div class="message">
          <span v-for="(error, index) in formErrors" :key="index" class="error p3">
            {{ error }}
          </span>
        </div>
      </div>

      <!-- Subject -->
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field', 'required']">
        <!-- <label for="subject">Subject</label> -->
        <select id="subject" name="subject" required>
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
      <div :class="[{ error: !!formErrors.length }, 'field', 'insightly-field', 'required']">
        <!-- <label for="message">Message</label> -->
        <textarea
          id="message"
          type="text"
          name="message"
          maxlength="5000"
          placeholder="Message..."
          requried
          @input="resetMessages"
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
  import { submit } from '@/apis/contact.api'
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
    debug: true,
  })

  // ===========================================================================
  // "Frozen" Constants
  // ===========================================================================
  const form = ref<InstanceType<typeof HTMLFormElement>>()
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
    // const formData = new FormData(form.value as InstanceType<typeof HTMLFormElement>)
    const formDataElement = form.value as InstanceType<typeof HTMLFormElement>
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

        responseMessage.value = 'Thank you for contacting us.'
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
