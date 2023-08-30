<template>
  <div :id="`${parent.id}-page`" class="page">
    <Hero :data="heroData" :parent="parent" />
    <ContactForm :data="contactFormData" :parent="parent" />
    <MailingListSignUp :data="mailingListData" :parent="parent" />
  </div>
</template>

<script setup lang="ts">
  import Hero from '@/partials/website/shared/HeroPartial.vue'
  import ContactForm from '@/partials/website/pages/contact_us/ContactFormPartial.vue'
  import MailingListSignUp from '@/partials/website/shared/MailingListSignUpPartial.vue'
  import { IPageData } from '@/types/general'

  const parent: IPageData = {
    id: 'contact-us',
    title: 'Contact Us',
  }

  // ===========================================================================
  // Hero Section Data
  // ===========================================================================
  const heroData: IPageData = {
    id: `${parent.id}-section-hero`,
    copyBlocks: [
      {
        classes: ['hero-block'],
        content: `
          <h1 class="h1 navy-100">
            Get In Touch Today
          </h1>

          <p class="p2">
            renegade.bio provides diagnostic testing for individuals, workplaces, schools, communities, events, concerts, and festivals.
          </p>
        `,
      },
    ],
    images: [
      {
        id: 'purple-couple-embracing',
        src: 'https://res.cloudinary.com/renegade-bio/image/upload/photos/purple-couple-embracing',
        title: 'purple couple embracing',
        alt: 'purple couple embracing',
        width: 2175,
        height: 1842,
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

  // ===========================================================================
  // Contact Form Section Data
  // ===========================================================================
  const contactFormData: IPageData = {
    id: `${parent.id}-section-contact-form`,
    accordionList: {
      id: 'contact-us-list',
      accordionItems: [
        {
          id: 'contact-us-location',
          classes: ['sky-blue-100', 'active'],
          inert: true,
          title: 'Location',
          content: `
            <p class="p3">
              <strong class="sky-blue-100">
                829 Heinz Ave
                <br>
                Berkeley, CA 94710
              </strong>
            </p>
          `,
        },

        {
          id: 'contact-us-phone',
          classes: ['magenta-100', 'active'],
          inert: true,
          title: 'Phone',
          content: `
            <p class="p3">
              <strong>
                <a href="tel:+18554800771" class="tel-link magenta-100">
                  +1.855.480.0771
                </a>
              </strong>
            </p>
          `,
        },

        // {
        //   id: 'contact-us-support',
        //   classes: ['eggplant-100', 'active'],
        //   inert: true,
        //   title: 'Pop-Up Support',
        //   content: `
        //     <p class="p3 navy-100">
        //       Support for individuals and small groups interested in testing at one of our Bay Area pop-up sites.
        //     </p>
        //     <p class="p3">
        //       <strong>
        //         <a href="tel:+18554800771" class="tel-link eggplant-100">
        //           +1.855.480.0771
        //         </a>
        //       </strong>
        //     </p>
        //   `,
        // },
      ],
    },
  }

  // ===========================================================================
  // Mailing List Sign Up Data
  // ===========================================================================
  const mailingListData: IPageData = {
    id: `${parent.id}-section-mailing-list-sign-up`,
    copyBlocks: [
      {
        content: `
          <h3 class="h3 sky-blue-100">Keep up with the latest <span class="magenta-100">renegade.bio</span> news</h3>
        `,
      },
    ],
  }
</script>

<style lang="scss">
  [data-current-page='contact-us'] {
    #site-footer {
      z-index: 1;
    }
  }

  #renegade-content-wrapper {
    background: linear-gradient(0deg, $--color-theme-white 0%, $--color-theme-light-blue-100 100%);
  }
</style>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  :deep() {
    .section.hero {
      gap: 4.6rem;
      min-height: unset;
      background-color: transparent;

      $container-gap: 4.6rem;
      $image-container-bias: 60%;

      .container {
        justify-content: space-between;
        max-height: none;
        gap: $container-gap;
        z-index: auto;

        @include for-desktop-mid-up {
          max-height: 60rem;
        }

        .copy-block,
        > .image-container {
          z-index: 2;
        }
      }

      .copy-block {
        .prehead {
          color: $--color-theme-navy-100;
        }

        &.hero-block {
          flex: 1 1 auto;

          @include for-desktop-mid-up {
            flex: 0 1 calc(100% - $image-container-bias);
          }
        }
      }

      .image-container {
        justify-content: center;
        align-self: center;
        flex: 1 1 auto;
        // min-width: 54.4rem;

        @include for-desktop-mid-up {
          justify-content: flex-end;
          flex: 0 1 calc($image-container-bias - $container-gap);
        }

        img {
          width: 100%;
        }
      }

      #shape-section-hero-header-background {
        top: -14rem;
        left: 62rem;
        // max-height: calc(100% + 14rem);
        width: 198.3rem;
        background-position-x: 0rem;
        background-position-y: -79rem;
      }

      #contact-us-for-providers-cta {
        order: 1;
      }

      #contact-us-contactForm {
        order: 2;
      }

      #contact-us-legal {
        order: 3;
      }
    }
  }
</style>
