<template #publicBenefitCorporationPartial>
  <section :id="data.id" class="section public-benefit-corporation">
    <div class="container">
      <div
        v-for="(copyBlock, index) in data.copyBlocks"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    // computed,
    // defineProps,
    // defineComponent,
    // inject,
    // onBeforeMount,
    onMounted,
    // onUnmounted,
    // reactive,
    // ref,
  } from 'vue'

  // ===========================================================================
  // Props
  // ===========================================================================
  import HtmlContent from '@/components/HtmlContent.vue'
  import { IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null | undefined
    debug?: boolean
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  // onBeforeMount(() => {})

  onMounted(() => {
    // console.log('PublicBenefitCorporationPartial - onMounted...')
    // const partialBoundingBox = document.getElementById(props?.data?.id).getBoundingClientRect()
    // console.log(`PublicBenefitCorporationPartial[${props?.data?.id}] - partialBoundingBox.height (MOUNTED): `, partialBoundingBox.height)
    // console.log(`PublicBenefitCorporationPartial[${props?.data?.id}] - partialBoundingBox.y (MOUNTED): `, partialBoundingBox.y)
    // handleWindowResize()
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.public-benefit-corporation {
    background-color: $--color-theme-white;

    .container {
      row-gap: 8.5rem;
      z-index: 5;

      padding: 6.2rem 2rem;
    }

    &:deep() {
      ul.custom-list {
        flex-direction: column;
        row-gap: 3rem;

        @include for-tablet-mid-up {
          margin-top: 4.2rem;
          flex-direction: row;
        }

        li {
          display: flex;
          flex: 0 1 33%;
          flex-direction: column;
          align-items: center;

          border-color: $--color-border;
          border-style: solid;
          border-width: 0;

          @include for-tablet-mid-up {
            border-width: 0 1px 0 0;
          }

          padding: 2rem;

          .custom-list-marker {
            border-color: $--color-theme-magenta-100;
            border-style: solid;
            border-width: 0 0 1.4rem 0;

            padding-bottom: 1rem;

            width: 12.7rem;
          }

          // 1
          &:nth-of-type(3n + 1) {
            .custom-list-marker {
              border-color: $--color-theme-magenta-100;
              color: $--color-theme-magenta-100;
            }
          }

          // 2
          &:nth-of-type(3n + 2) {
            .custom-list-marker {
              border-color: $--color-theme-sky-blue-100;
              color: $--color-theme-sky-blue-100;
            }
          }

          // 3
          &:nth-of-type(3n) {
            border-width: 0;

            .custom-list-marker {
              border-color: $--color-theme-eggplant-100;
              color: $--color-theme-eggplant-100;
            }
          }
        }
      }
    }
  }
</style>
