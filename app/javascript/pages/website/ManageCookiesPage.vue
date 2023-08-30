<template>
  <div class="page">
    <section>
      <div class="container">
        <div class="cookie-declaration-container">
          <component
            :is="'script'"
            :id="'CookieDeclaration'"
            src="https://consent.cookiebot.com/70b4fe37-19f3-42d9-8d73-bf33c31ffb1f/cd.js"
            type="text/javascript"
            async
          />
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts"></script>

<style setup scoped lang="scss">
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
