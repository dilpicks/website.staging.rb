<template #testContentSection>
  <section
    :id="data.id"
    :class="[
      'section',
      'test',
      'show',
      'test-content-partial',
      { 'with-hero-image': data.attributes?.image },
    ]"
  >
    <div class="container">
      <!-- // eslint-disable-next-line prettier/prettier -->
      <div
        v-for="(characteristicGroup, characteristicGroupIndex) in data.attributes
          ?.characteristicGroups"
        :id="characteristicGroup.id"
        :key="characteristicGroupIndex"
        class="characteristic-group content-container"
      >
        <h2 class="h2 characteristic-group-name">{{ characteristicGroup.name }}</h2>
        <ul
          v-for="(characteristic, characteristicIndex) in characteristicGroup.characteristics"
          :id="characteristic.id"
          :key="characteristicIndex"
          class="characteristics-list"
        >
          <li class="characteristic-name eggplant-100">
            <h3 class="h3">{{ characteristic.name }}</h3>
          </li>
          <li class="characteristic-value">
            <div
              v-for="(copyBlock, index) in characteristic.copyBlocks"
              :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
              :key="index"
              :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
            >
              <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
            </div>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import HtmlContent from '@/components/HtmlContent.vue'
  // import Image from '@/components/Image.vue'
  // import Link from '@/components/Link.vue'
  import { ITest, IPageData } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: ITest
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

  .section.test-content-partial {
    background-color: $--color-theme-white;

    &.with-hero-image {
      @include for-desktop-narrow-up {
        padding-top: 19rem;
        // margin-top: 20rem;
      }
    }

    .container {
      flex-direction: column;
      flex-wrap: wrap;
      justify-content: center;
      column-gap: 3rem;
      row-gap: 8.5rem;

      padding: 2rem;

      @include for-desktop-narrow-up {
        padding: 6.2rem 2rem;
      }

      :deep() {
        .content-container {
          flex: 1 1 auto;
          flex-wrap: wrap;

          @include for-desktop-narrow-up {
            flex: 1 1 0;
          }

          .characteristic-group-name {
            font-size: 3.2rem;
            line-height: 3.9rem;

            @include for-phone-up {
              font-size: 4.8rem;
              line-height: auto;
            }
          }

          .characteristics-list {
            border-color: $--color-border;
            border-style: solid;
            border-width: 0 0 0 0;
            column-gap: 2rem;
            flex: 1 1 100%;
            flex-direction: column;
            padding: 2rem 0;

            @include for-tablet-mid-up {
              flex-direction: row;
              border-width: 0 0 1px 0;
              padding: 5rem 0;
            }

            .characteristic-name {
              flex: 1 1 auto;
              margin-bottom: 0.25rem;

              @include for-tablet-mid-up {
                margin-bottom: 1rem;
                flex: 0 0 30rem;
              }
            }

            .characteristic-value {
              flex: 1 1 auto;

              .bullet-list li,
              .p3 {
                font-size: 1.3rem;
                line-height: 2.15rem;

                @include for-phone-up {
                  font-size: 1.8rem;
                  line-height: 2.7rem;
                }
              }
            }
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
