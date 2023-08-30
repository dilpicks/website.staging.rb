<template #contactFormPartial>
  <section :id="data.id" class="section contact-form-partial">
    <div class="container">
      <div class="content-frame padded">
        <ContactUsForm v-bind="contactUsFormData" />
      </div>

      <!-- Contact Details -->
      <aside v-if="data?.accordionList" :class="['aside', 'content-frame']">
        <AccordionList v-if="data?.accordionList" :accordion-list="data.accordionList" />

        <!-- <div
          v-for="(copyBlock, index) in data.copyBlocks"
          :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
          :key="index"
          :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
        >
          <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
        </div> -->
      </aside>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  // import HtmlContent from '@/components/HtmlContent.vue'
  import AccordionList from '@/components/AccordionList.vue'
  import ContactUsForm from '@/forms/ContactUsForm.vue'
  // import Image from '@/components/Image.vue'
  // import Link from '@/components/Link.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null | undefined
    debug?: boolean
  }

  // ===========================================================================
  // File-Specific
  // ===========================================================================
  const contactUsFormData: IPageData = {
    id: 'contact-us-form',
    // debug: false,
    classes: ['test'],
  }

  withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // Frozen Constants
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.contact-form-partial {
    background-color: transparent;

    @include for-desktop-narrow-up {
      padding-top: 10rem;
    }

    .container {
      flex-direction: row;
      flex-wrap: wrap;
      column-gap: 12.6rem;
      row-gap: 3rem;

      padding: 2rem;

      @include for-desktop-narrow-up {
        padding: 6.2rem 2rem;
      }

      :deep() {
        .aside {
          flex: 1;

          @include for-desktop-narrow-up {
            flex: 0 1 40rem;
          }

          .accordion-items {
            gap: 0;
          }

          .accordion-item {
            padding: 5rem;
            border-color: $--color-border;
            border-style: solid;
            border-width: 0 0 1px 0;
          }

          .accordion-item-content {
            flex: 1 1 auto;
          }

          p {
            width: 100%;
          }

          .button-container {
            flex-wrap: wrap;
          }
        }

        .content-container {
          flex: 1 1 auto;
          flex-wrap: wrap;

          row-gap: 3rem;

          @include for-desktop-narrow-up {
            flex: 1 1 0;
          }

          .copy-block {
            flex: 1 1 100%;

            .h3 {
              margin-bottom: 0.5rem;
            }
          }

          h6 {
            & + p,
            & + ul {
              margin-top: 0.5rem;
            }
          }
        }
      }
    }
  }
</style>
