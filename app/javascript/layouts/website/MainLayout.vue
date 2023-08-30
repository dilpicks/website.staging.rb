<template>
  <BaseLayout>
    <div
      id="renegade-content-wrapper"
      class="site-content-wrapper"
      :data-page-group="route?.meta?.group"
      :data-current-page="route?.name"
    >
      <header id="site-header">
        <SiteMenu />
      </header>

      <main v-cloak>
        <router-view v-slot="{ Component }">
          <transition name="fade" mode="out-in" appear>
            <component :is="Component" />
          </transition>
        </router-view>
      </main>

      <footer id="site-footer">
        <FooterMenu />
      </footer>
    </div>
  </BaseLayout>
</template>

<script setup lang="ts">
  // ===========================================================================
  // Imports
  // ===========================================================================
  // eslint-disable-next-line prettier/prettier
  import { onMounted } from 'vue'
  import { useRoute } from 'vue-router'

  import BaseLayout from '@/layouts/BaseLayout.vue'
  import SiteMenu from '@/layouts/website/SiteMenu.vue'
  import FooterMenu from '@/layouts/website/FooterMenu.vue'

  // ===========================================================================
  // Constants
  // ===========================================================================
  const route = useRoute()

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
  onMounted(() => {
    window.Beacon('init', '7b39e054-0222-49e8-b5ec-2ace514821a7')
  })
</script>

<style setup lang="scss">
  .fade-enter-active,
  .fade-leave-active {
    transition: opacity 0.25s ease-in-out;
  }

  .fade-enter-from,
  .fade-leave-to {
    opacity: 0;
  }

  [v-cloak] {
    display: none;
  }

  #beacon-container {
    position: absolute;
  }

  #site-header {
    justify-content: center;

    #site-menu-container {
      justify-content: center;
    }
  }

  // #cookie-declaration-container {
  //   justify-content: center;

  //   position: fixed;
  //   bottom: 0;
  //   z-index: 1010;

  //   padding: 2rem;
  //   width: 100%;
  //   background-color: $--color-theme-neutral-200;

  //   > div {
  //     flex: 0 1 auto;
  //   }
  // }

  // #CybotCookiebotDialog {
  //   display: none !important;
  // }

  // #cookie-declaration-container,
  // .CookieDeclaration {
  //   display: none !important;
  // }
</style>
