<template #testsListPartial>
  <section :id="data.id" class="section tests-list">
    <div class="container">
      <div :id="data?.testList.id">
        <table v-if="data?.testList?.testItems">
          <thead>
            <tr>
              <th class="test-code h3 sky-blue-100">Number</th>
              <th class="test-name h3 sky-blue-100">Name</th>
              <th class="test-specimen h3 sky-blue-100">Specimen</th>
              <th class="test-date h3 sky-blue-100">New/Updated</th>
              <th class="test-action"></th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(testItem, index) in data.testList.testItems"
              :key="index"
              :data-test="testItem.id"
            >
              <td class="test-code p3" @click="copyToClipboard(testItem.attributes.code, $event)">
                {{ testItem.attributes?.code }}
              </td>
              <!-- eslint-disable-next-line vue/no-v-html -->
              <td class="test-name p3" v-html="testItem.attributes?.name" />
              <!-- eslint-disable-next-line vue/no-v-html -->
              <td class="test-specimen p3" v-html="testItem.attributes?.specimen" />
              <td class="test-date p3">{{ updatedOrCreatedAt(testItem) }}</td>
              <td class="test-actions p3">
                <Link v-if="testItem.attributes?.link" :link="testItem.attributes.link">
                  <Image :image="{ ...arrowImage, id: `${arrowImage}-${index}` }" />
                </Link>
              </td>
            </tr>
          </tbody>
        </table>

        <HtmlContent v-if="!data?.testList?.testItems" :content="noAvailableTestsContent" />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import {
    // computed,
    // defineProps,
    // defineComponent,
    // onMounted,
    // reactive,
    // ref,
    toRaw,
  } from 'vue'

  import HtmlContent from '@/components/HtmlContent.vue'
  import Image from '@/components/Image.vue'
  import Link from '@/components/Link.vue'
  import { IPageData, ITest } from '@/types/general'

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
  const updatedOrCreatedAt = (testItem: ITest) => {
    console.log('TestsListPartial - testItem: ', toRaw(testItem))

    if (testItem.attributes?.publishedDate) {
      return testItem.attributes.publishedDate
    }
    if (testItem.attributes?.updatedAt) {
      return testItem.attributes.updatedAt
    }
    if (testItem.attributes?.createdAt) {
      return testItem.attributes.createdAt
    }

    // return testItem.attributes?.updatedAt ? testItem.attributes?.updatedAt : testItem.attributes?.createdAt
  }

  const copyToClipboard = (testCode: string | null | undefined, event: Event) => {
    const copyClipboardButton = event.target as HTMLElement

    if (testCode && copyClipboardButton && navigator?.clipboard) {
      navigator.clipboard.writeText(testCode).then(
        () => {
          /* clipboard successfully set */
          // console.log(`Copied Test Code: ${testCode}`)

          copyClipboardButton.classList.add('copied')

          setTimeout(() => {
            copyClipboardButton.classList.remove('copied')
          }, 1000)
        },
        () => {
          /* clipboard write failed */
          // console.log('Copied Test Code: ${testCode} - failed!')
        },
      )
    } else {
      // console.log('')
      // console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      // console.log('copyForHTML - navigator: ', navigator)
      // console.log('copyForHTML - navigator.clipboard: ', navigator.clipboard)
      // console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      // console.log('')

      // eslint-disable-next-line prettier/prettier
      console.warn(
        'Could not copy the Test code! Your browser does not support this functionality. Please use Google Chrome - https://www.google.com/chrome/',
      )
    }
  }

  const arrowImage = {
    id: 'test-link-arrow',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-arrow-right.svg',
    title: 'test link',
    alt: 'test link logo',
    width: 24,
    height: 24,
  }

  const noAvailableTestsContent = `
    <h2 class="h2">No Tests Are Available At This Time.</h2>
  `
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.tests-list {
    background-color: $--color-theme-white;
    gap: 5rem;

    @include for-desktop-mid-up {
      padding-top: 10rem;
    }

    &:deep() {
      .container {
        row-gap: 8.5rem;
        z-index: 2;
      }

      table {
        width: 100%;
      }

      thead {
        th {
          text-align: left;
          padding: 0 1rem 0 0;

          &:first-of-type {
            padding-left: 0;
          }

          &:last-of-type {
            padding-right: 0;
          }

          &.test-code {
            display: none;

            @include for-phone-lrg-up {
              display: table-cell;
            }
          }

          &.test-specimen {
            display: none;

            @include for-desktop-narrow-up {
              display: table-cell;
            }
          }

          &.test-date {
            display: none;

            @include for-tablet-portrait-up {
              display: table-cell;
            }
          }
        }
      }

      tbody {
        tr {
          border-color: $--color-border;
          border-style: solid;
          border-width: 0 0 0.2rem 0;

          td {
            padding: 3rem 1rem 3.5rem 0rem;
            text-align: left;

            // &:hover {
            //   text-decoration: underline;
            // }

            &:first-of-type {
              padding-left: 0;
            }

            &.test-code {
              text-decoration: none;

              display: none;

              @include for-phone-lrg-up {
                display: table-cell;
              }

              &:after {
                box-sizing: border-box;
                content: '';
                color: $--color-theme-grey-300;
                cursor: pointer;
                // opacity: 0.5;
                display: inline-block;
                vertical-align: bottom;

                width: 2.4rem;
                min-width: 2.4rem;
                max-width: 2.4rem;

                height: 2.4rem;
                min-height: 2.4rem;
                max-height: 2.4rem;

                margin: 0 0 -0.1rem 0.5rem;

                background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-clipboard-copy-grey.svg');
                background-size: contain;
              }

              &.copied {
                &:after {
                  cursor: default;
                  background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-check-pink.svg');
                }
              }
            }

            &.test-specimen {
              display: none;

              @include for-desktop-narrow-up {
                display: table-cell;
              }
            }

            &.test-date {
              display: none;

              @include for-tablet-portrait-up {
                display: table-cell;
              }
            }

            &.test-actions {
              vertical-align: middle;
            }
          }
        }
      }
    }
  }
</style>
