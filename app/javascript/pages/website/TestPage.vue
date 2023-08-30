<template>
  <div v-if="test" :id="`${test.id}-page`" class="page">
    <Hero :data="heroData" :parent="pageData" />
    <TestDetails :data="test" :parent="pageData" />
    <MailingListSignUp :data="mailingListData" :parent="pageData" />
  </div>
</template>

<script setup lang="ts">
  import {
    computed,
    // defineComponent,
    // defineEmit,
    // defineProps,
    inject,
    // onMounted,
    onUnmounted,
    // reactive,
    // ref,
    // toRaw,
  } from 'vue'

  import { Emitter } from 'mitt'

  import { useRoute } from 'vue-router'
  import { storeToRefs } from 'pinia'
  import { showToast } from '@/utils/showToast'
  import { useTestsStore } from '@/stores/tests.store'

  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import TestDetails from '@/partials/website/pages/test_details/TestDetailsPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData, IImage, Events } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    debug?: boolean
  }

  withDefaults(defineProps<Props>(), {
    loading: false,
    post: null,
    error: null,
    debug: false,
  })

  const route = useRoute()
  const testsStore = useTestsStore()
  const { test } = storeToRefs(testsStore)

  // ===========================================================================
  // Methods
  // ===========================================================================
  const pageData: IPageData = {
    id: 'test',
    title: 'Test',
  }

  // ===========================================================================
  // Hero Section Data
  // ===========================================================================
  const heroData = computed(() => {
    const pageData: IPageData = {
      id: `${test?.value?.id}-section-hero`,
      copyBlocks: [
        {
          classes: ['hero-block'],
          content: `
            <h5 class="prehead eggplant-110">
              Test Directory
            </h5>

            <h1 class="h1 navy-100">
              ${test?.value?.attributes?.name}
            </h1>

            <ul class="inline-list">
              <li class="test-code p2" data-code="${test?.value?.attributes?.code}">
                <strong>Test:</strong>
                <span>${test?.value?.attributes?.code}</span>
              </li>
              <li class="p2">
                <strong>CPT:</strong>
                <span>${test?.value?.attributes?.cptCodes?.join('; ')}</span>
              </li>
            </ul>
          `,
        },
      ],
      shapes: [
        {
          id: 'shape-section-hero-header-background',
          src: 'https://res.cloudinary.com/renegade-bio/image/upload/shapes/shape-common-section-header-background.svg',
          width: 1983,
          height: 3053,
        },
      ],
    }

    if (test?.value?.attributes?.image) {
      const image: IImage = test?.value?.attributes?.image

      if (!image.id && test?.value?.id) {
        image.id = `${test?.value?.id}-section-hero-image`
      }

      pageData.images = [image]
    }

    return pageData
  })

  // ===========================================================================
  // Mailing List Sign Up Data
  // ===========================================================================
  const mailingListData = computed(() => {
    return {
      id: `${test?.value?.id}-section-mailing-list-sign-up`,
      copyBlocks: [
        {
          content: `
            <h3 class="h3 sky-blue-100">Keep up with the latest <span class="magenta-100">renegade.bio</span> news</h3>
          `,
        },
      ],
    }
  })

  // ===========================================================================
  // Methods
  // ===========================================================================
  const hydrate = () => {
    testsStore.show(route?.params?.id).catch((error) => {
      showToast(error, 'error')
    })
  }

  // ===========================================================================
  // Created
  // ===========================================================================
  hydrate()

  // ===========================================================================
  // Mounted
  // ===========================================================================
  // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
  const handleEmitReceived = (value: any) => {
    const copyClipboardButton = document.querySelector('.test-code') as HTMLElement

    if (copyClipboardButton) {
      copyClipboardButton.addEventListener('click', () => {
        if (copyClipboardButton.dataset?.code && navigator?.clipboard) {
          const testCode = copyClipboardButton.dataset.code

          navigator.clipboard.writeText(testCode).then(
            () => {
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
          // eslint-disable-next-line prettier/prettier
          console.warn(
            'Could not copy the Test code! Your browser does not support this functionality. Please use Google Chrome - https://www.google.com/chrome/',
          )
        }
      })
    }
  }

  const emitter = inject('emitter') as Emitter<Events>
  emitter.on('heroMounted', handleEmitReceived)

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onUnmounted(() => {
    emitter.off('heroMounted', handleEmitReceived)
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section {
      &.hero {
        padding: 0;
        min-height: unset;

        .container {
          row-gap: 3rem;

          @include for-tablet-portrait-up {
            row-gap: 6rem;
          }

          .copy-block,
          > .image-container {
            z-index: 2;
          }

          .hero-block {
            flex: 0 1 100%;

            p {
              max-width: 79%;
            }

            .ml-container {
              width: 100%;

              h5.prehead {
                text-align: left;
              }

              h1.h1 {
                text-align: left;

                @include for-tablet-mid-up {
                  margin-bottom: 0;
                }
              }

              .inline-list {
                align-content: flex-start;
                align-items: flex-start;
                column-gap: 8rem;
                row-gap: 2rem;
                margin-top: 0;
                flex-direction: column;

                @include for-tablet-mid-up {
                  flex-direction: row;
                  justify-content: flex-start;
                }

                .p2 {
                  text-align: left;
                }

                li {
                  align-content: center;
                  align-items: center;
                  justify-content: flex-start;
                  display: flex;

                  span {
                    padding-left: 0.5rem;
                  }
                }
              }

              .test-code {
                &:after {
                  box-sizing: border-box;
                  content: '';
                  color: $--color-theme-navy-100;
                  cursor: pointer;
                  display: inline-block;
                  vertical-align: bottom;

                  width: 2.4rem;
                  min-width: 2.4rem;
                  max-width: 2.4rem;

                  height: 2.4rem;
                  min-height: 2.4rem;
                  max-height: 2.4rem;

                  margin: 0 0 -0.1rem 0.5rem;

                  background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-clipboard-copy-navy.svg');
                  background-size: contain;
                }

                &.copied {
                  &:after {
                    cursor: default;
                    background-image: url('https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-check-pink.svg');
                  }
                }
              }
            }
          }
        }

        .image-container {
          flex: 1 1 auto;

          @include for-desktop-narrow-up {
            margin-bottom: -19rem;
          }

          img {
            width: 100%;
          }
        }

        #shape-section-hero-header-background {
          top: -14rem;
          left: 62rem;
          max-height: calc(100% + 14rem);
          width: 198.3rem;
          background-position-x: 0rem;
          background-position-y: -79rem;
        }
      }
    }

    .section.test.show {
      background-color: $--color-theme-white;

      .container {
        .copy-block {
          width: 100%;

          .ml-container {
            width: 100%;

            .sub-section {
              width: 100%;

              figure {
                width: 100%;

                .image-container {
                  width: 100%;

                  img {
                    max-width: 100%;
                    width: auto;
                    height: fit-content;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
</style>
