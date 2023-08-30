<template #mailingListSignUp>
  <section id="lets-innovate-together">
    <div class="container">
      <HtmlContent
        v-for="(copyBlock, index) in data?.copyBlocks"
        :key="index"
        :content="copyBlock.content"
      />
      <InsightlyFormSimpleNewsletterOptIn v-bind="insightlyFormData" />
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import InsightlyFormSimpleNewsletterOptIn from '@/partials/website/vendor/insightly/InsightlyFormSimpleNewsletterOptIn.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // File-Specific
  // ===========================================================================
  // const form: IForm = {
  //   fields: [
  //     {
  //       id: 'email_address',
  //       type: 'email',
  //       label: 'Email address',
  //       placeholder: 'email@example.com',
  //       input: null,
  //       disabled: false,
  //     },
  //   ],
  // }

  const insightlyFormData: IPageData = {
    id: 'insightly-form-simple-newsletter-opt-in',
    // debug: false,
    classes: ['test'],
  }
</script>

<style setup lang="scss">
  #lets-innovate-together {
    background-color: $--color-theme-background-primary;
    padding: 1.5rem 0;

    .container {
      flex-direction: column;
      row-gap: 5rem;
    }

    .header-block {
      flex-direction: column;
      row-gap: 3.5rem;

      width: 75%;
    }

    .h1 {
      color: $--color-theme-eggplant-100;
    }

    .cards {
      .card {
        max-width: 35.6rem;
      }
    }
  }
</style>
