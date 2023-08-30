<template #letsInnovateTogetherPartial>
  <section :id="data.id" class="section lets-innovate-together">
    <div class="container">
      <div
        v-for="(copyBlock, index) in copyBlocksOrDefault"
        :id="copyBlock?.id ? copyBlock.id : `copy-block-${index}`"
        :key="index"
        :class="['copy-block', ...(copyBlock?.classes ? copyBlock.classes : [])]"
      >
        <HtmlContent v-if="copyBlock?.content" :content="copyBlock.content" />
      </div>

      <Cards :cards="cardsOrDefault" />
    </div>

    <Risographs :risographs="risographsOrDefault" />
  </section>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  import {
    computed,
    // defineProps,
    // defineComponent
    // onMounted,
    // ref
  } from 'vue'

  import Cards from '@/components/Cards.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import Risographs from '@/components/Risographs.vue'
  import { ICard, ICopyBlock, IPageData, IRisographImage } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    data: IPageData
    parent?: IPageData | null | undefined
    debug?: boolean
  }

  const props = withDefaults(defineProps<Props>(), {
    parent: null,
    debug: false,
  })

  // ===========================================================================
  // File-Specific
  // ===========================================================================
  const defaultCopyBlocks: Array<ICopyBlock> = [
    {
      classes: ['header-block'],
      content: `
        <h2 class="h1 eggplant-100">
          Let’s Innovate Together
        </h2>

        <p class="p2">
          We partner with biotechnology companies to create novel diagnostic solutions.
        </p>

        <div class="buttons-container">
          <a href="https://reach.renegade.bio/request_call" rel="noopener" target="_blank" class="button button-pill">
            Get in Touch
          </a>
        </div>
      `,
    },
  ]

  const defaultCards: Array<ICard> = [
    // {
    //   id: 'card-who-we-are',
    //   title: 'Who We Are',
    //   content: `
    //     <p class="p4">
    //       From how we originated, to who makes up our team, what we create, and the people we serve – we are renegade across all.
    //     </p>
    //   `,
    //   link: {
    //     id: 'link-who-we-are',
    //     type: 'route-link',
    //     href: 'about-us',
    //     content: 'Learn About Us',
    //   },
    // },

    {
      id: 'card-join-renegade-bio',
      attributes: {
        title: 'Join renegade.bio',
        content: `
          <p class="p4">
            We’re always on the lookout for talented people who are aligned with our mission.
          </p>
        `,
        link: {
          type: 'external',
          id: 'sub-menu-item-careers',
          classes: ['nav-link'],
          content: 'See Careers',
          href: 'https://renegade-bio.breezy.hr/',
          rel: 'noopener',
          target: '_blank',
        },
      },
    },
  ]

  const defaultRisographs: Array<IRisographImage> = [
    {
      id: 'blue-woman-smiling',
      src: 'https://res.cloudinary.com/renegade-bio/image/upload/risographs/blue-woman-smiling',
      title: 'blue-woman-smiling',
      alt: 'blue woman smiling',
      width: 2847,
      height: 3642,
    },
  ]

  // ===========================================================================
  // Computed
  // ===========================================================================
  const copyBlocksOrDefault = computed(() => {
    return props.data?.copyBlocks ? props.data.copyBlocks : defaultCopyBlocks
  })

  const cardsOrDefault = computed(() => {
    return props.data?.cards ? props.data.cards : defaultCards
  })

  const risographsOrDefault = computed(() => {
    return props.data?.risographs ? props.data.risographs : defaultRisographs
  })

  // ===========================================================================
  // Methods
  // ===========================================================================
  // TODO: This should be extracted into a mixin or something
  // const propOrDefault = (object, key, defaultValue = null) => {
  //   let value = defaultValue

  //   if (object && Object.prototype.hasOwnProperty.call(object, key) && !!object[key]) {
  //     value = object[key]
  //   }

  //   return value
  // }
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .section.lets-innovate-together {
    background-color: $--color-theme-background-primary;
    padding: 1.5rem 0 0 0;

    @include for-phone-up {
      display: flex;
    }

    @include for-desktop-up {
      padding: 1.5rem 0;
    }

    .container {
      row-gap: 5rem;
    }

    &:deep() {
      .risograph-container {
        margin: auto;
        max-height: 30rem;
        position: relative;
        min-width: unset;

        @include for-tablet-landscape-up {
        }

        @include for-desktop-up {
          position: absolute;
        }

        @include for-tablet-landscape-up {
          max-height: 50rem;
        }

        @include for-desktop-up {
          max-height: 66.6rem;
        }

        .risograph {
          width: auto;
          max-width: 100vw;

          height: auto;
          max-height: 100%;

          // position: relative;
        }

        // #blue-man {
        //   position: relative;
        // }
      }

      .header-block {
        row-gap: 3.5rem;

        width: 75%;

        .p2 {
          max-width: 68%;
        }
      }

      .cards {
        .card {
          max-width: 35.6rem;
        }
      }

      #blue-woman-smiling {
        $offset-bottom: -11rem;
        $offset-right: 1rem;

        bottom: $offset-bottom;
        right: $offset-right;

        clip-path: inset(0 0 calc($offset-bottom * -1) 0);

        position: relative;

        max-height: calc(100% + calc($offset-bottom * -1));

        @include for-phone-up {
          $offset-bottom: -31rem;
          $offset-right: 3rem;
        }

        @include for-phone-lrg-tablet-up {
          $offset-bottom: -31rem;
        }

        @include for-desktop-up {
          $offset-bottom: -52rem;
          $offset-right: -13rem;

          height: var(--intrinsic-height);

          // bottom: -52rem;
          // right: -13rem;
        }
      }
    }
  }
</style>
