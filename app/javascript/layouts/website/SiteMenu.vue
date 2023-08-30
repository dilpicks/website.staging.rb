<template>
  <div id="site-menu-container">
    <vsm-menu
      ref="menu"
      :menu="menu"
      element="div"
      handler="hover"
      align="center"
      class="container site-nav-container"
      :screen-offset="10"
      :dropdown-offset="0"
      @open-dropdown="onOpenDropdown"
      @close-dropdown="onCloseDropdown"
    >
      <!-- Fly-Out Sub-Nav -->
      <template #default="{ item }">
        <!--Dropdown content of each menu item with a "dropdown" property-->
        <!--You can replace it with a separate component if each menu item has its own style-->
        <!--Necessarily need to have at least one element within the slot-->
        <!--An alternate background will be applied from the 2nd element-->
        <ul
          :style="`--item-count: ${
            item.dropdownContainerItems.length <= 4 ? item.dropdownContainerItems.length : 4
          }`"
        >
          <li
            v-for="subMenuItem in item.dropdownContainerItems"
            :id="`sub-menu-item-${subMenuItem.id}`"
            :key="subMenuItem.id"
          >
            <router-link
              v-if="subMenuItem?.routeName"
              :id="`sub-nav-link-${subMenuItem.id}`"
              :class="['nav-link', 'sub-nav-link']"
              :to="{
                name: subMenuItem.routeName,
              }"
              @click="beforeNavigate"
            >
              <h4 class="h4">{{ subMenuItem.title }}</h4>
              <p class="p4">{{ subMenuItem.content }}</p>
            </router-link>

            <a
              v-if="subMenuItem?.externalLink"
              :id="`sub-nav-link-${subMenuItem.id}`"
              :href="subMenuItem.externalLink"
              :class="['nav-link', 'sub-nav-link']"
              rel="noopener"
              target="_blank"
            >
              <h4 class="h4">{{ subMenuItem.title }}</h4>
              <p class="p4">{{ subMenuItem.content }}</p>
            </a>
          </li>
        </ul>
      </template>

      <!-- Pre-Nav / Logo -->
      <template #before-nav>
        <li class="logo">
          <router-link
            :class="['nav-link']"
            :to="{
              name: 'home',
            }"
          >
            <img
              src="https://res.cloudinary.com/renegade-bio/image/upload/branding/renegade-bio-logo.svg"
              title="renegade.bio"
              alt="renegade.bio logo"
            />
          </router-link>
        </li>
      </template>

      <!-- Main Nav -->
      <template #title="data">
        <!-- Display menu items through slots -->
        <router-link
          v-if="data?.item?.attributes?.routeName"
          :id="data.item.attributes.id"
          :class="data.item.attributes.class"
          :to="{
            name: data.item.attributes.routeName,
          }"
        >
          <span v-if="!data?.item?.attributes?.displayImageOnly">
            {{ data.item?.title }}
          </span>
          <Image v-if="data?.item?.attributes?.image" :image="data.item.attributes.image" />
        </router-link>

        <div v-if="!data?.item?.attributes?.routeName" :class="data.item.attributes.class">
          <span v-if="!data?.item?.attributes?.displayImageOnly">
            {{ data.item?.title }}
          </span>
          <Image v-if="data?.item?.attributes?.image" :image="data.item.attributes.image" />
        </div>
      </template>

      <!-- Post-Nav / Contact Us -->
      <template #after-nav>
        <!-- Mobile Burger, buttons, etc -->
        <li id="desktop-group" class="vsm-mob-hide">
          <!-- Contact Us -->
          <router-link
            id="main-nav-link-contact-us"
            class="button button-pill"
            :to="{
              name: 'contact-us',
            }"
          >
            Contact Us
          </router-link>
        </li>
        <!-- Set "display: block" for the .vsm-mob-show class to display content -->
        <vsm-mob ref="mobileMenu">
          <template #hamburger>
            <div id="mobile-menu-button" @click="onMobileMenuToggle">
              <div id="bars">
                <div class="bar"></div>
                <div id="crossbars">
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
                <div class="bar"></div>
              </div>
            </div>
          </template>

          <template #close>
            <div id="mobile-menu-close-button" />
          </template>

          <div :class="['mobile-nav-container']">
            <nav :class="['mobile-nav']">
              <ul :class="['mobile-nav-groups-container']">
                <li
                  v-for="(item, index) in menu"
                  :id="`${item.attributes.id}-container`"
                  :key="index"
                  :class="['mobile-nav-group-container']"
                >
                  <!-- COVID-19 Solutions Link -->
                  <router-link
                    v-if="item?.attributes?.routeName"
                    :id="item.attributes.id"
                    :class="[
                      { 'has-children': item?.dropdownContainerItems },
                      item.attributes.class,
                    ]"
                    :to="{
                      name: item.attributes.routeName,
                    }"
                  >
                    <span @click="beforeNavigate">{{ item.title }}</span>
                  </router-link>

                  <!-- Menu Item w/Sub-Menu -->
                  <div
                    v-if="!item?.attributes?.routeName"
                    :id="item.attributes.id"
                    :class="[
                      { 'has-children': item?.dropdownContainerItems },
                      item.attributes.class,
                    ]"
                    @click="onAccordionMenuToggle(item)"
                  >
                    {{ item?.title }}
                  </div>

                  <ul
                    v-if="item?.dropdownContainerItems"
                    :class="['mobile-nav-sub-nav-items-container']"
                    :style="`--item-count: ${
                      item.dropdownContainerItems.length <= 4
                        ? item.dropdownContainerItems.length
                        : 4
                    }`"
                  >
                    <li
                      v-for="(subMenuItem, subMenuItemIndex) in item.dropdownContainerItems"
                      :id="`sub-menu-item-${subMenuItem.id}`"
                      :key="subMenuItemIndex"
                    >
                      <router-link
                        v-if="subMenuItem?.routeName"
                        :id="`sub-nav-link-${subMenuItem.id}`"
                        :class="['nav-link', 'sub-nav-link']"
                        :to="{
                          name: subMenuItem.routeName,
                        }"
                        @click="beforeNavigate"
                      >
                        <h4 class="h4">{{ subMenuItem.title }}</h4>
                        <p class="p4">{{ subMenuItem.content }}</p>
                      </router-link>

                      <a
                        v-if="subMenuItem?.externalLink"
                        :id="`sub-nav-link-${subMenuItem.id}`"
                        :href="subMenuItem.externalLink"
                        :class="['nav-link', 'sub-nav-link']"
                        rel="noopener"
                        target="_blank"
                        @click="beforeNavigate"
                      >
                        <h4 class="h4">{{ subMenuItem.title }}</h4>
                        <p class="p4">{{ subMenuItem.content }}</p>
                      </a>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </vsm-mob>
      </template>
    </vsm-menu>
  </div>
</template>

<script lang="ts">
  // ===========================================================================
  // Libraries, Components, Types, Interfaces, etc.
  // ===========================================================================
  import VueStripeMenu from 'vue-stripe-menu'
  import {
    // computed,
    defineComponent,
    // inject,
    // nextTick,
    // onBeforeMount,
    // onMounted,
    // onUnmounted,
    // ref,
  } from 'vue'

  import Image from '@/components/Image.vue'
  import { IImage } from '@/types/general'

  // Not even worth it
  /* eslint-disable */

  // Inside #after-nav and #before-nav it is recommended to use
  // to maintain the correct HTML structure:
  //   <li><!--Content--></li>

  // ===========================================================================
  // Constants
  // ===========================================================================
  const debug: boolean = true

  // ===========================================================================
  // Props
  // ===========================================================================
  interface IVSMMenuItemAttributes {
    id?: string
    class?: Array<string>
    displayImageOnly?: boolean
    image?: IImage
    routeName?: string
  }

  interface IVSMMenuSubMenuItem {
    id: string
    title: string
    content: string
    routeName?: string
    externalLink?: string
  }

  interface IVSMMenuItem {
    title?: string
    dropdown?: string
    element?: string
    attributes: IVSMMenuItemAttributes
    listeners?: any
    customAttribute?: boolean
    dropdownContainerItems?: Array<IVSMMenuSubMenuItem>
  }

  interface IVSMMenuData {
    menu: Array<IVSMMenuItem>
  }

  const vsmMenuData: IVSMMenuData = {
    menu: [
      // How We Work
      {
        // display menu item (can be overridden with title slot)
        title: 'How We Work',
        // this element now has dropdown content
        dropdown: 'how-we-work',
        // don't want a button element? Pass HTMLElement or global component
        // (pass only as a string, component must be globally accessible)
        element: 'div', // router-link
        // offset the position of the dropdown menu
        // align: 'center',
        // menu item can accept all attributes
        attributes: {
          id: 'main-nav-link-how-we-work',
          class: ['nav-link', 'sub-menu-only'],
          // routeName: 'renegade-science',
        },
        // add some events?
        listeners: {
          // all possible native events
          mouseover: (event: MouseEvent) => {
            console.log('how-we-work hover', event)
          },
        },
        dropdownContainerItems: [
          {
            id: 'renegade-science',
            title: 'renegade Science',
            content: 'Developing diagnostics in-house and in partnership with other biotechs',
            routeName: 'renegade-science',
          },
          {
            id: 'renegade-reach',
            title: 'renegade Reach',
            content: 'Increasing access to diagnostics, from pre-natal to end-of-life',
            routeName: 'renegade-reach',
          },
        ],
        // just extra properties in the object
        customAttribute: true,
      },

      // Diagnostic Solutions
      {
        title: 'Diagnostic Solutions',
        dropdown: 'diagnostic-solutions',
        element: 'div', // router-link
        attributes: {
          id: 'main-nav-link-diagnostic-solutions',
          class: ['nav-link', 'sub-menu-only'],
          // routeName: 'infectious-diseases',
        },
        listeners: {
          mouseover: (event: MouseEvent) => {
            console.log('diagnostic-solutions', event)
          },
        },
        dropdownContainerItems: [
          {
            id: 'infectious-diseases',
            title: 'Infectious Diseases',
            content: 'Creating tests to address COVID-19, and improve Sexual Health',
            routeName: 'infectious-diseases',
          },
          {
            id: 'reproductive-health',
            title: 'Hormones & Fertility',
            content:
              'Developing solutions to help reduce pregnancy related morbidity and mortality',
            routeName: 'reproductive-health',
          },
          // {
          //   id: 'cardiovascular-health',
          //   title: 'Cardiovascular Health',
          //   content: 'Creating diagnostics to help reduce the risk of cardiovascular disease',
          //   routeName: 'cardiovascular-health',
          // },
          {
            id: 'prep-testing',
            title: 'PrEP Testing',
            content: 'Creating diagnostics to help reduce the risk of HIV & STIs',
            routeName: 'prep-testing',
          },
          {
            id: 'innovations-in-diagnostics',
            title: 'Innovations in Diagnostics',
            content: 'Conducting R&D to explore human and planetary diagnostic solutions',
            routeName: 'innovations-in-diagnostics',
          },
          {
            id: 'test-directory',
            title: 'Test Directory',
            content: 'Find the right test for your patients',
            routeName: 'test-directory',
          },
        ],
        customAttribute: true,
      },

      // Case Studies
      {
        title: 'Case Studies',
        dropdown: 'case-studies',
        element: 'div', // router-link
        attributes: {
          id: 'main-nav-link-case-studies',
          class: ['nav-link', 'sub-menu-only'],
          // routeName: 'case-studies',
        },
        listeners: {
          mouseover: (event: MouseEvent) => {
            console.log('case-studies', event)
          },
        },
        dropdownContainerItems: [
          {
            id: 'case-studies',
            title: 'Overview',
            content:
              'A look at companies and community groups we are working with to create impact',
            routeName: 'case-studies',
          },
          {
            id: 'umoja-health',
            title: 'Community Testing',
            content: 'Increasing COVID-19 testing in an East Oakland community',
            routeName: 'umoja-health',
          },
          {
            id: 'metabolomic',
            title: 'Maternal Health Diagnostics',
            content: 'Partnered to make early detection of preeclampsia risks a reality',
            routeName: 'metabolomic',
          },
          {
            id: 'microgenesis',
            title: 'Hormones & Fertility Health',
            content: 'Bringing a novel fertility health test to market in the U.S.',
            routeName: 'microgenesis',
          },
        ],
        customAttribute: true,
      },

      // Who We Are
      {
        title: 'Who We Are',
        dropdown: 'who-we-are',
        element: 'div', // router-link
        attributes: {
          id: 'main-nav-link-who-we-are',
          class: ['nav-link', 'sub-menu-only'],
          // routeName: 'about-us',
        },
        listeners: {
          mouseover: (event: MouseEvent) => {
            console.log('who-we-are', event)
          },
        },
        dropdownContainerItems: [
          {
            id: 'who-we-are',
            title: 'Who We Are',
            content:
              'We’re Scientists + We’re Activists: From our origins, to our team and our work',
            routeName: 'who-we-are',
          },
          {
            id: 'annual-report',
            title: 'Annual Report',
            content: 'An annual look at progress on our mission as a Public Benefit Corporation',
            routeName: 'annual-report',
          },
          {
            id: 'careers',
            title: 'Careers',
            content: 'Join our growing team of renegades',
            externalLink: 'https://renegade-bio.breezy.hr/',
          },
        ],
        customAttribute: true,
      },

      // COVID-19 Solutions
      {
        title: 'COVID-19 Solutions',
        element: 'div',
        attributes: {
          id: 'main-nav-link-covid-19-solutions',
          class: ['nav-link'],
          routeName: 'covid-19-solutions',
        },
        listeners: {
          mouseover: (event: MouseEvent) => {
            console.log('covid-19-solutions', event)
          },
        },
        customAttribute: true,
      },

      // Portals
      {
        title: 'Login',
        dropdown: 'portals',
        element: 'div', // router-link
        attributes: {
          id: 'main-nav-link-portals',
          class: ['nav-link', 'sub-menu-only'],
          // displayImageOnly: true,
          // image: {
          //   src: 'https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-login.svg',
          //   title: 'Login',
          //   alt: 'Login icon',
          //   height: 30,
          //   width: 30,
          // }
        },
        listeners: {
          mouseover: (event: MouseEvent) => {
            console.log('portals hover', event)
          },
        },
        dropdownContainerItems: [
          {
            id: 'for-patients',
            title: 'For Patients',
            content:
              'Renegade.bio’s free online tool for patients. View tests results, track your health history & more.',
            externalLink: 'https://myrenegade.renegade.bio/',
          },
          {
            id: 'for-providers',
            title: 'For Providers',
            content: `Renegade.bio’s online tool for physicians. Order tests, view patient results, order supplies & more.`,
            externalLink: 'https://physician.renegade.bio/',
          },
        ],
        customAttribute: true,
      },
    ],
  }

  const accordionIsOpen = 'active'
  const mobileMenuIsOpen = 'mobile-menu-open'

  interface IExpandedData {
    scrollDirection: string | null
    startY: number
    siteHeaderElement: HTMLElement | null
    siteMenuContainerElement: HTMLElement | null
  }

  // ===========================================================================
  // Export
  // ===========================================================================
  export default defineComponent({
    components: {
      Image,
    },
    data() {
      return {
        ...vsmMenuData,
        ...({
          scrollDirection: null,
          startY: 0,
          siteHeaderElement: null,
          siteMenuContainerElement: null,
        } as IExpandedData),
      }
    },
    mounted() {
      console.log('SiteMenu mounted...')
      this.siteHeaderElement = document.querySelector<HTMLElement>('#site-header')
      this.siteMenuContainerElement = document.querySelector<HTMLElement>(
        '#site-header #site-menu-container',
      )

      console.log(this.siteHeaderElement)
      console.log(this.siteMenuContainerElement)

      this.setOffset()

      window.addEventListener('resize', this.handleWindowResize)
      window.addEventListener('scroll', this.handleScroll)
    },
    methods: {
      setOffset() {
        if (this.siteHeaderElement && this.siteMenuContainerElement) {
          this.siteMenuContainerElement.classList.add('shown')

          const height: number = this.siteMenuContainerElement.getBoundingClientRect()?.height

          if (height) {
            this.siteHeaderElement.style.minHeight = `${height / 10}rem`
          }
        }
      },

      handleWindowResize() {
        this.setOffset()
      },

      handleScroll() {
        const scrollY = window.scrollY

        if (this.siteMenuContainerElement) {
          if (scrollY > this.startY) {
            // console.log('Now going down...')
            this.scrollDirection = 'up'
            this.siteMenuContainerElement.classList.remove('shown')
          } else {
            // console.log('Now going up!')
            this.scrollDirection = 'down'
            this.siteMenuContainerElement.classList.add('shown')
          }

          if (scrollY < 200) {
            // console.log('scrollY: ', scrollY)
            this.siteMenuContainerElement.classList.add('shown')
            this.siteMenuContainerElement.classList.remove('filled')
          } else {
            this.siteMenuContainerElement.classList.add('filled')
          }
        }

        this.startY = scrollY
      },

      onOpenDropdown() {
        if (debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('SiteMenu.vue::onOpenDropdown...')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }
      },

      onCloseDropdown() {
        if (debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('SiteMenu.vue::onCloseDropdown...')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }
      },

      onMenuToggle() {
        if (debug) {
          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('SiteMenu.vue::onMenuToggle...')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')
        }
      },

      onAccordionMenuToggle(item: any) {
        const activeAccordionMenuContainer = document.querySelector<HTMLElement>(
          `#${item.attributes.id}-container`,
        )
        const mobileAccordionMenuContainers = document.querySelectorAll<HTMLElement>(
          `.mobile-nav-group-container`,
        )

        if (!!item.dropdownContainerItems && activeAccordionMenuContainer) {
          if (activeAccordionMenuContainer.classList.contains(accordionIsOpen)) {
            this.closeMobileAccordionMenu(activeAccordionMenuContainer)
          } else {
            this.openMobileAccordionMenu(activeAccordionMenuContainer)
          }
        }

        this.closeAllMobileAccordionMenus(activeAccordionMenuContainer)
      },

      onMobileMenuToggle() {
        const html = document.querySelector<HTMLElement>('html')

        if (html) {
          if (html.classList.contains(mobileMenuIsOpen)) {
            html.classList.remove(mobileMenuIsOpen)
          } else {
            html.classList.add(mobileMenuIsOpen)
          }
        }
      },

      closeAllMenus() {
        this.closeFlyOutMenu()
        this.closeMobileMenu()
        this.closeAllMobileAccordionMenus()
      },

      closeFlyOutMenu() {
        const menuRef = this.$refs['menu'] as InstanceType<typeof VueStripeMenu>
        if (menuRef) {
          menuRef.closeDropdown()
        }
      },

      closeMobileMenu() {
        const mobileMenuRef = this.$refs['mobileMenu'] as InstanceType<typeof VueStripeMenu>
        if (mobileMenuRef) {
          mobileMenuRef.closeDropdown()
        }
      },

      closeAllMobileAccordionMenus(except: any = null) {
        const mobileAccordionMenuContainers = document.querySelectorAll<HTMLElement>(
          `.mobile-nav-group-container`,
        )
        mobileAccordionMenuContainers.forEach((mobileAccordionMenuContainer) => {
          if (!except || (except && except != mobileAccordionMenuContainer)) {
            this.closeMobileAccordionMenu(mobileAccordionMenuContainer)
          }
        })
      },

      openMobileAccordionMenu(mobileAccordionMenuContainer: HTMLElement) {
        mobileAccordionMenuContainer.classList.add(accordionIsOpen)
      },

      closeMobileAccordionMenu(mobileAccordionMenuContainer: HTMLElement) {
        mobileAccordionMenuContainer.classList.remove(accordionIsOpen)
      },

      beforeNavigate() {
        // if (debug) {
        //   console.log('')
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   console.log('SiteMenu.vue::beforeNavigate...')
        //   console.log('--------------------------------------')
        //   console.log('SiteMenu.vue::beforeNavigate - this: ', this)
        //   console.log('--------------------------------------')
        //   console.log('SiteMenu.vue::beforeNavigate - this.$refs: ', this.$refs)
        //   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        //   console.log('')
        // }

        this.closeAllMenus()
      },
    },
  })
</script>

<style setup lang="scss">
  @import 'vue-stripe-menu/dist/vue-stripe-menu.css';
  @import '@/assets/css/breakpoints';

  // [data-page-group='how-we-work'] {
  //   #site-header .vsm-nav .vsm-link-container .vsm-link {
  //     &[data-dropdown='how-we-work']::after {
  //       opacity: 1;
  //     }
  //   }
  // }

  // [data-page-group='diagnostic-solutions'] {
  //   #site-header .vsm-nav .vsm-link-container .vsm-link {
  //     &[data-dropdown='diagnostic-solutions']::after {
  //       opacity: 1;
  //     }
  //   }
  // }

  // [data-page-group='case-studies'] {
  //   #site-header .vsm-nav .vsm-link-container .vsm-link {
  //     &[data-dropdown='case-studies']::after {
  //       opacity: 1;
  //     }
  //   }
  // }

  // [data-page-group='who-we-are'] {
  //   #site-header .vsm-nav .vsm-link-container .vsm-link {
  //     &[data-dropdown='who-we-are']::after {
  //       opacity: 1;
  //     }
  //   }
  // }

  // [data-page-group='covid-19-solutions'] {
  //   #site-header .vsm-nav .vsm-link-container .vsm-link {
  //     &[routename='covid-19-solutions']::after {
  //       opacity: 1;
  //     }
  //   }
  // }

  // [data-page-group='portals'] {
  //   #site-header .vsm-nav .vsm-link-container .vsm-link {
  //     &[routename='portals']::after {
  //       opacity: 0;
  //     }
  //   }
  // }

  #site-header {
    justify-content: center;

    #site-menu-container {
      background-color: transparent;

      display: flex;
      flex: 1 1 100%;
      width: 100%;

      position: fixed;

      pointer-events: none;

      opacity: 0;
      transition: all 250ms ease-out;

      z-index: 99999;

      &.shown {
        opacity: 1;
        pointer-events: auto;
      }

      &.filled {
        background-color: $--color-theme-white;
      }
    }

    // Library styles
    .vsm-menu {
      display: flex;

      position: relative;
      width: 100%;
      max-width: $--width-content-max;
      margin: 0 auto;

      z-index: 1000;
    }

    .vsm-root {
      align-items: stretch;
      flex: 1 1 auto;
      justify-content: space-between;
    }

    // Custom Styles
    .vsm-nav {
      background: transparent;

      height: 9.4rem;

      display: flex;
      align-items: center;
      flex: 1 1 auto;
      justify-content: space-between;

      .logo {
        align-items: center;
        display: flex;
        flex: 1 1 auto;
        z-index: 10;

        a {
          line-height: 0;
        }

        img {
          width: 18rem;
          height: auto;
        }
      }

      .vsm-link-container {
        display: flex;
        align-content: center;
        align-items: center;
        flex: 0 1 auto;
        justify-content: flex-start;
        column-gap: 3rem;

        .vsm-link {
          display: flex;

          color: $--color-theme-background-secondary;
          font: $--font-primary-600;
          font-size: 1.5rem;
          padding: 1rem 0 0 0;

          height: 4.4rem;

          position: relative;
          white-space: nowrap;

          .nav-link {
            color: inherit;

            &.sub-menu-only {
              cursor: context-menu;
            }
          }

          &:after {
            display: flex;
            align-self: flex-end;
            flex: 1 1 auto;

            content: '';
            background-color: $--color-menu-item-hover;
            opacity: 0;

            position: absolute;
            width: 100%;
            height: 0.7rem;

            transition: all 0.25s ease-out;
          }

          &.active,
          &:active {
            &:after {
              opacity: 1;
            }
          }

          &:hover {
            cursor: pointer;

            &:after {
              opacity: 1;
            }
          }
        }
      }
    }

    .vsm-dropdown {
      top: 4.4rem;

      .vsm-background {
        background-color: transparent;
        box-shadow: none;
        // border-radius: 2rem;
      }

      .vsm-background-alt {
        display: none;
      }

      .vsm-arrow {
        background-color: transparent;
      }

      .vsm-dropdown-container {
        padding-top: 3rem;
        min-height: 24.6rem;
        // height: 38rem;
        border-radius: 2rem;
        overflow: visible !important;

        .vsm-dropdown-section {
          display: none;
          flex: 0 1 auto;
          min-height: 24.6rem;

          &.vsm-active {
            display: flex;
            // min-height: 35rem;
          }

          .vsm-dropdown-content {
            // background-color: rgba($--color-theme-navy-100, 0.95);
            // border-radius: 2rem;

            ul {
              min-width: calc((var(--item-count) * 26.4rem) + calc(var(--item-count) * 3rem));
              width: auto;
              // min-height: 21.6rem;
              // padding: 5rem 4rem;

              background-color: rgba($--color-theme-navy-100, 0.95);
              border-radius: 2rem;

              display: flex;
              align-content: flex-start;
              align-items: flex-start;
              flex-wrap: wrap;
              column-gap: 3rem;
              row-gap: 2rem;

              li {
                display: flex;
                flex-direction: column;
                flex: 0 1 26.4rem;

                margin-top: 5rem;
                margin-bottom: 3rem;
                min-width: 26.4rem;
                padding-right: 3rem;

                border-color: $--color-theme-white;
                border-style: solid;
                border-width: 0 1px 0 0;

                .p4 {
                  color: $--color-theme-white;
                  margin-top: 1rem;
                }

                &:first-of-type {
                  padding-left: 4rem;
                }

                // 1st of 3
                &:nth-of-type(3n + 1) {
                  .h4 {
                    color: $--color-theme-sky-blue-100;
                  }
                }

                // 2nd of 3
                &:nth-of-type(3n + 2) {
                  .h4 {
                    color: $--color-theme-magenta-100;
                  }
                }

                // 3rd of 3
                &:nth-of-type(3n) {
                  .h4 {
                    color: $--color-theme-eggplant-60;
                  }
                }

                &:nth-of-type(4n) {
                }

                &:nth-of-type(4n),
                &:last-of-type {
                  border-width: 0;
                  padding-right: 0;
                  flex: 0 1 23.4rem;
                  min-width: 23.4rem;
                }

                &:nth-of-type(5n) {
                  flex: 1 1 100%;
                  margin-top: 0;
                  margin-bottom: 0;
                  padding: 3.7rem 4rem;
                  background-color: rgba($--color-theme-white, 0.1);
                }
              }
            }
          }
        }
      }
    }

    #desktop-group {
      display: flex;
      align-items: center;
      flex: 1 1 auto;
      justify-content: flex-end;
    }

    #main-nav-link-contact-us {
      margin-top: -0.5rem;
    }

    #main-nav-link-portals {
      &.active,
      &:active,
      &:hover {
        &:after {
          opacity: 0;
        }
      }
    }

    @include mobile-menu-shown {
      #mobile-menu-close-button {
        pointer-events: none;
        display: none;
      }

      .vsm-menu {
        padding: 0;
      }

      .vsm-nav {
        height: auto;

        .logo {
          padding: 0 2rem;

          img {
            width: 16.1rem;
          }
        }
      }

      .vsm-mob {
        z-index: 2;
      }

      .vsm-mob-show {
        display: flex !important;
      }

      .vsm-mob-hide {
        display: none !important;
      }

      .vsm-mob-full {
        flex-grow: 1 !important;
      }

      .vsm-mob-container {
        margin: 0;

        #mobile-menu-button {
          display: block;
          padding: 1.4rem 1.7rem;
        }

        #bars {
          display: block;
          align-content: flex-end;
          align-self: flex-end;
          cursor: pointer;
          flex: 0 0 3rem;
          flex-direction: column;
          justify-content: center;

          .bar,
          #crossbars {
            display: block;
            transition: all 0.2s linear;

            height: 0.3rem;
            margin: 0.6rem 0;
            max-height: 0.3rem;
            min-height: 0.3rem;
            width: 3rem;
          }

          .bar {
            background-color: $--color-theme-eggplant-110;
            border-radius: 0.5rem;
          }

          > .bar {
            &:first-of-type {
              margin-top: 0rem;
            }

            &:last-of-type {
              margin-bottom: 0rem;
            }
          }

          #crossbars {
            height: 0.3rem;

            .bar {
              margin: 0;
              position: absolute;
            }

            .bar:first-of-type {
              z-index: 11;
            }

            .bar:last-of-type {
              z-index: 12;
            }
          }
        }

        .vsm-mob-content {
          left: 0px;
          top: 0px;
          right: 0px;

          min-height: 5rem;

          // .vsm-mob-content__wrap {
          //   display: none !important;
          // }
        }

        &.vsm-open {
          .vsm-mob {
            pointer-events: auto;
          }

          #mobile-menu-button {
          }
          #bars {
            > .bar:first-of-type,
            > .bar:last-of-type {
              opacity: 0;
            }

            #crossbars {
              .bar:first-of-type {
                transform: rotate(45deg);
              }

              .bar:last-of-type {
                transform: rotate(-45deg);
              }
            }
          }

          // .vsm-mob-content {
          //   .vsm-mob-content__wrap {
          //     display: flex !important;
          //   }
          // }
        }
      }

      .vsm-mob__hamburger {
        width: auto;
        height: auto;
        padding: 2rem;
      }

      .vsm-mob-line {
        background-color: $--color-theme-eggplant-110;
      }

      .vsm-mob-close {
        width: 6.4rem;
        height: 5.9rem;
        opacity: 0;
      }

      .vsm-mob-line {
        flex: 0 1 auto;
      }

      .mobile-nav-container {
        padding-top: 5rem;

        .mobile-nav {
          display: flex;
          flex: 1 1 100%;

          .mobile-nav-groups-container,
          .mobile-nav-sub-nav-items-container {
            display: flex;
            flex-direction: column;
            width: 100%;
          }

          .mobile-nav-groups-container {
          }

          .mobile-nav-group-container {
            justify-content: space-between;
            border-color: $--color-theme-grey-100;
            border-style: solid;
            border-width: 1px 0 0 0;
            min-height: 4.8rem;
            transition: all 0.25s ease-out;

            > .nav-link {
              cursor: pointer;
              justify-content: space-between;

              &.has-children {
                &:after {
                  content: '';
                  display: block;
                  background-image: url(https://res.cloudinary.com/renegade-bio/image/upload/icons/icon-chevron-down.svg);
                  background-position: center;
                  background-repeat: no-repeat;
                  background-size: contain;
                  width: 2.4rem;
                  height: 2.4rem;
                  transition: all 0.25s ease-out;
                }
              }
            }

            &.active {
              background-color: $--color-theme-light-blue-40;

              > .nav-link {
                &:after {
                  transform: rotate(180deg);
                }
              }

              .mobile-nav-sub-nav-items-container {
                max-height: 50rem;
                padding-bottom: 1rem;
              }
            }
          }

          .mobile-nav-sub-nav-items-container {
            max-height: 0;
            overflow: hidden;
          }

          .nav-link {
            display: flex;
            color: $--color-theme-navy-100;
            font: $--font-primary-300;
            font-size: 1.8rem;
            line-height: 2.7rem;
            padding: 1rem 2rem 1rem 3.7rem;

            &.sub-nav-link,
            &.sub-nav-link .h4 {
              font: $--font-primary-600;
              font-size: 1.3rem;
            }

            &.sub-nav-link {
              display: flex;
              padding: 0.5rem 3.7rem 0.5rem 5.7rem;

              p {
                display: none;
              }
            }
          }
        }
      }
    }
  }
</style>
