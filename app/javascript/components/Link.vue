<template>
  <!-- External / href || Anchor Link -->
  <a
    v-if="link.type === 'external'"
    :id="link?.id"
    :class="link.classes"
    :href="propOrDefault(link.href, '#')"
    :rel="propOrDefault(link.rel, 'noopener')"
    :target="propOrDefault(link.target, '_blank')"
  >
    <slot>
      {{ link?.content }}
    </slot>
  </a>

  <!-- Vue Router Link -->
  <router-link v-else :id="link?.id" :class="link.classes" :to="routerLinkParams">
    <slot>
      {{ link.content }}
    </slot>
  </router-link>
</template>

<script setup lang="ts">
  import {
    computed,
    // defineProps,
    // defineComponent,
    onMounted,
    // ref,
    toRaw,
  } from 'vue'

  import type { RouteParamsRaw } from 'vue-router'

  import { ILink } from '@/types/general'

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    link: ILink
    debug?: boolean
  }

  // interface RouterLinkObject {
  //   to: RouterLinkProps
  // }

  interface RouterLinkProps {
    name?: string
    hash?: string
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    params?: RouteParamsRaw | undefined
  }

  // interface Props extends Ilink {}

  // const props = defineProps<Props>()

  const BASE_URL = 'https://renegade.bio'

  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  // ===========================================================================
  // Data
  // ===========================================================================

  // ===========================================================================
  // Computed
  // ===========================================================================

  // ===========================================================================
  // Methods
  // ===========================================================================
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const propOrDefault = (prop: any, fallback: any) => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Link.vue::propOrDefault - prop: ', toRaw(prop))
      console.log('Link.vue::propOrDefault - fallback: ', fallback)
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    if (prop) {
      return prop
    } else {
      return fallback
    }
  }

  const routerLinkParams = computed(() => {
    // const paramParts = props?.link?.href?.split('/')
    const routerParams: RouterLinkProps = {}

    if (props?.link) {
      if (props?.link?.name) {
        routerParams.name = props.link.name

        if (props?.link?.hash) {
          routerParams.hash = props.link.hash
        }
      } else if (props?.link?.href) {
        const url = new URL(props.link.href, BASE_URL)

        if (props.debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('Link.vue::routerLinkParams - url: ', toRaw(url))
          console.log('--------------------------------------')
          console.log('Link.vue::routerLinkParams - url.origin: ', toRaw(url.origin))
          console.log('--------------------------------------')
          console.log('Link.vue::routerLinkParams - BASE_URL: ', toRaw(BASE_URL))
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }

        if (url?.origin === BASE_URL) {
          // router-link
          if (url?.hash) {
            routerParams.hash = url.hash

            if (url.hash !== props.link.href) {
              routerParams.name = props.link.href
            }
          } else {
            routerParams.name = props.link.href
          }
        }
      }

      if (props?.link?.params) {
        routerParams.params = props.link.params
      }
    }

    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Link.vue::routerLinkParams - routerParams: ', toRaw(routerParams))
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }

    return routerParams
  })

  // const routerLinkParams: RouterLinkObject = computed(() => {
  //   // const paramParts = props?.link?.href?.split('/')
  //   const routerParams: RouterLinkObject = {}

  //   if (props?.link && props?.link?.name) {
  //     routerParams.name = props.link.name

  //     if (props?.link?.hash) {
  //       routerParams.hash = url.hash
  //     }
  //   } else {
  //     const url = new URL(props.link.href, BASE_URL)

  //     if (props.debug) {
  //       console.log('')
  //       console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  //       console.log('Link.vue::routerLinkParams - url: ', toRaw(url))
  //       console.log('--------------------------------------')
  //       console.log('Link.vue::routerLinkParams - url.origin: ', toRaw(url.origin))
  //       console.log('--------------------------------------')
  //       console.log('Link.vue::routerLinkParams - BASE_URL: ', toRaw(BASE_URL))
  //       console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  //       console.log('')
  //     }

  //     if (url?.origin === BASE_URL) {
  //       // router-link
  //       if (url?.hash) {
  //         routerParams.hash = url.hash

  //         if (url.hash !== props.link.href) {
  //           routerParams.name = props.link.href
  //         }
  //       } else {
  //         routerParams.name = props.link.href
  //       }
  //     }
  //   }

  //   if (props?.link?.params) {
  //     routerParams.params = props.link.params
  //   }

  //   if (props.debug) {
  //     console.log('')
  //     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  //     console.log('Link.vue::routerLinkParams - routerParams: ', toRaw(routerParams))
  //     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  //     console.log('')
  //   }

  //   return routerParams
  // })

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    if (props.debug) {
      console.log('')
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('Link.vue - props: ', toRaw(props))
      console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
      console.log('')
    }
  })
</script>

<style setup lang="scss">
  .link {
    // align-items: center;
    // justify-content: space-between;

    // .control {
    //   flex: 0 1 0;
    // }

    // .link-items-wrapper {
    //   flex: 0 1 auto;
    //   align-items: center;
    //   align-content: center;
    //   justify-content: flex-start;
    //   max-width: 106.8rem;
    //   overflow: hidden;
    // }

    // .control {
    //   min-width: 7.8rem;
    //   height: 7.8rem;
    //   cursor: pointer;
    // }

    // .chevron-right {
    //   background-image: url(https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-chevron-right.svg);
    //   background-position: center center;
    //   background-repeat: no-repeat;
    //   background-size: contain;
    // }

    // .chevron-left {
    //   background-image: url(https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-chevron-left.svg);
    //   background-position: center center;
    //   background-repeat: no-repeat;
    //   background-size: contain;
    // }
  }
</style>
