<template #inPageNavigationPartial>
  <nav id="in-page-nav">
    <ul class="container">
      <li
        v-for="pageNavItem in data.pageNavItems"
        :id="pageNavItem.id"
        :key="pageNavItem.id"
        class="page-nav-item"
      >
        <Link :link="pageNavItem.link" />
      </li>
    </ul>
  </nav>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Props
  // ===========================================================================
  import Link from '@/components/Link.vue'
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
  // Frozen Constants
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  #in-page-nav {
    background-color: $--color-theme-navy-100;

    display: flex;
    flex: 1 1 auto;

    // height: 8rem;
    // max-height: 8rem;
    // min-height: 8rem;

    ul.container {
      align-items: stretch;
      justify-content: center;
      padding: 0;

      @include for-tablet-portrait-up {
      }

      @include for-desktop-mid-up {
        padding: 0 2rem;
      }

      li {
        display: flex;
        align-items: stretch;
        justify-content: center;
        flex: 1 1 0;

        border-color: $--color-theme-navy-80;
        border-style: solid;
        border-width: 0 0 1px 0;

        height: auto; //100%;
        min-width: 100%;

        position: relative;

        transition: all 0.25s ease-out;

        @include for-phone-lrg-tablet-up {
          border-width: 0 1px 0 0;
          min-width: 10rem;
        }

        :deep() {
          .page-nav-item {
            display: flex;
            align-items: center;
            justify-content: center;
            color: $--color-theme-white;
            font: $--font-primary-600;
            font-size: 1.5rem;
            text-align: center;
            text-decoration: none;
            transition: all 0.25s ease-out;
            height: 100%;
            flex: 1 1 auto;

            padding: 2.2rem 15%;
          }
        }

        &:last-of-type {
          border-width: 0;
        }

        &:after {
          display: flex;
          align-self: flex-end;
          flex: 1 1 auto;
          content: '';
          background-color: $--color-theme-magenta-100;
          opacity: 0;
          pointer-events: none;
          position: absolute;
          width: 70%;
          height: 1.4rem;
          transition: all 0.25s ease-out;
        }

        &:hover {
          :deep() {
            .page-nav-item {
              color: $--color-theme-magenta-100;
            }
          }

          &:after {
            opacity: 1;
          }
        }
      }
    }
  }
</style>
