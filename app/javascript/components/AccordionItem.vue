<template #accordion-item="{ accordion-item }">
  <div
    :id="`accordion-item-${accordionItem.id}`"
    ref="root"
    :class="['accordion-item', { inert: accordionItem.inert }, ...accordionItem.classes]"
  >
    <h3 :class="['h3-bold']" @click="expand(accordionItem.id)">{{ accordionItem.title }}</h3>
    <!--
      `vue/no-v-html` linter disabled here as only approved users
      will submit content via `tinymce`
    -->
    <!-- eslint-disable-next-line vue/no-v-html -->
    <div class="accordion-item-content">
      <HtmlContent :content="accordionItem.content" />
    </div>
  </div>
</template>

<script setup lang="ts">
  import {
    // defineProps,
    // defineEmits,
    inject,
    onMounted,
    ref,
    // useContext,
  } from 'vue'

  import { Emitter } from 'mitt'

  import HtmlContent from '@/components/HtmlContent.vue'
  import { IAccordionItem, Events } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    accordionItem: IAccordionItem
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  const root = ref(null)
  const emitter = inject('emitter') as Emitter<Events>

  defineExpose({
    root,
  })

  // ===========================================================================
  // Methods
  // ===========================================================================
  const expand = (itemId: string) => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('AccordionItem.vue - expand - itemId: ', itemId)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (!props.accordionItem.inert) {
      emitter.emit('expandItem', { id: itemId })
    }
  }

  onMounted(() => {
    // the DOM element will be assigned to the ref after initial render
    // console.log(root.value) // this is your $el
  })
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .accordion-item {
    align-items: center;
    align-content: center;
    flex: 1 1 100%;
    flex-wrap: wrap;
    justify-content: flex-start;
    // row-gap: 0rem;

    @include for-desktop-mid-up {
      row-gap: 2.3rem;
    }

    &:only-of-type {
      h3 {
        cursor: auto;
      }
    }

    .accordion-item-content {
      flex: 1 1 auto;

      @include for-desktop-mid-up {
        padding: 0 0 0 4.1rem;
        flex: 0 1 50%;
      }

      :deep() {
        .ml-container {
          flex-direction: row;
          flex-wrap: wrap;
          justify-content: space-between;
          // row-gap: 0rem;

          @include for-desktop-mid-up {
            row-gap: 5rem;
            flex-wrap: nowrap;
          }
        }

        p {
          color: $--color-theme-navy-100;
        }

        .accordion-description {
          flex: 1 1 auto;

          opacity: 0;

          max-height: 0;
          overflow: hidden;
          transition: opacity 0.5s ease-out;

          @include for-desktop-mid-up {
            flex: 1 1 50%;
          }

          .buttons-container,
          .button-container {
            flex-wrap: wrap;

            @include for-desktop-mid-up {
              flex-wrap: nowrap;
            }
          }
        }

        .content-frame {
          flex: 1 1 auto;

          pointer-events: none;

          right: 0;
          top: 0;
          max-height: 0;
          opacity: 0;

          transition: opacity 0.5s ease-out;

          @include for-desktop-mid-up {
            max-height: none;
          }

          &.padded {
            padding: 0rem;

            @include for-desktop-mid-up {
              padding: 3.5rem;
            }
          }

          @include for-desktop-mid-up {
            flex: 0 1 50%;
            position: absolute;
            max-width: 53.5rem;
          }

          ul.icon-list {
            flex-wrap: wrap;
            row-gap: 3rem;

            li {
              flex: 1 1 100%;
            }
          }
        }
      }
    }

    h3 {
      align-items: center;
      display: flex;
      flex: 1 1 100%;

      min-height: 8.3rem;

      border-color: $--color-theme-neutral-200;
      border-style: solid;
      border-width: 0 0 0 1.4rem;
      color: $--color-theme-navy-100;
      cursor: pointer;
      padding: 0 0 0 2.7rem;

      transition: all 0.5s ease-out;
    }

    &.inert {
      h3 {
        cursor: default;
      }
    }

    &.magenta-100 {
      h3 {
        &:hover {
          border-color: $--color-theme-magenta-100;
        }
      }

      &.active {
        h3 {
          border-color: $--color-theme-magenta-100;
        }
      }
    }

    &.sky-blue-100 {
      h3 {
        &:hover {
          border-color: $--color-theme-sky-blue-100;
        }
      }

      &.active {
        h3 {
          border-color: $--color-theme-sky-blue-100;
        }
      }
    }

    &.eggplant-100 {
      h3 {
        &:hover {
          border-color: $--color-theme-eggplant-100;
        }
      }

      &.active {
        h3 {
          border-color: $--color-theme-eggplant-100;
        }
      }
    }

    &.active {
      row-gap: 2.3rem;

      .accordion-item-content {
        :deep() {
          .ml-container {
            row-gap: 5rem;
          }

          .accordion-description {
            max-height: 50rem;
            opacity: 1;
          }

          .content-frame {
            display: flex;
            max-height: none;
            opacity: 1;

            &.padded {
              padding: 3.5rem;
            }
          }
        }
      }
    }
  }
</style>
