<template #caseStudiesContentPartial>
  <section :id="data.id" class="section case-studies-content-partial">
    <div class="container">
      <!-- Case Study Details -->
      <aside
        v-if="data?.caseStudyDetails"
        :id="data?.caseStudyDetails.id"
        :class="[
          'aside',
          'content-frame',
          ...(data?.caseStudyDetails?.classes ? data?.caseStudyDetails.classes : []),
        ]"
      >
        <Image v-if="data?.caseStudyDetails?.image" :image="data.caseStudyDetails.image" />

        <div class="padded-container">
          <div v-if="data?.caseStudyDetails?.company" class="case-study-details-info-block">
            <h6 id="case-studies-company" class="p3-bold magenta-100 upcase">Company</h6>
            <p>
              {{ data?.caseStudyDetails?.company }}
            </p>
          </div>

          <div v-if="data?.caseStudyDetails?.headquarters" class="case-study-details-info-block">
            <h6 id="case-studies-headquarters" class="p3-bold sky-blue-100 upcase">Headquarters</h6>
            <p>
              {{ data?.caseStudyDetails?.headquarters }}
            </p>
          </div>

          <HtmlContent
            v-if="data?.caseStudyDetails?.content"
            :content="data?.caseStudyDetails.content"
          />

          <div v-if="data?.caseStudyDetails?.link" class="buttons-container">
            <Link :link="data?.caseStudyDetails.link" />
          </div>
        </div>
      </aside>

      <!-- Case Study Content -->
      <div class="content-container">
        <div
          v-for="(copyBlock, index) in data.copyBlocks"
          :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
          :key="index"
          :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
        >
          <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import HtmlContent from '@/components/HtmlContent.vue'
  import Image from '@/components/Image.vue'
  import Link from '@/components/Link.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null | undefined
    debug?: boolean
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

  .section.case-studies-content-partial {
    background-color: $--color-theme-white;

    @include for-desktop-narrow-up {
      padding-top: 19rem;
    }

    .container {
      flex-direction: row;
      flex-wrap: wrap;
      column-gap: 3rem;
      row-gap: 3rem;

      padding: 2rem;

      @include for-desktop-narrow-up {
        padding: 6.2rem 2rem;
      }

      :deep() {
        .aside {
          flex: 1;

          @include for-desktop-narrow-up {
            flex: 0 1 30rem;
          }

          .padded-container {
            padding: 3rem;
            flex-wrap: wrap;
            row-gap: 2rem;

            .case-study-details-info-block {
              flex-direction: column;
              flex: 1 1 100%;
            }
          }

          .image-container {
            padding: 2.9rem;

            @include for-phone-up {
              padding: 3.9rem;
            }

            background-color: $--color-theme-navy-100;
            border-radius: 2rem 2rem 0 0;

            align-items: center;
            justify-content: center;

            img {
              width: 100%;
            }
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
