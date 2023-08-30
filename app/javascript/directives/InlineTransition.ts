import { ObjectDirective } from '@vue/runtime-core'

interface VInlineElement extends HTMLElement {
  _vod: string
}

const InlineTransition: ObjectDirective<VInlineElement> = {
  beforeMount(el, { value }, { transition }) {
    // console.log('beforeMount - el: ', el)
    // console.log('beforeMount - value: ', value)
    // console.log('beforeMount - transition: ', transition)

    el._vod = el.style.visibility === 'hidden' ? 'visible' : el.style.visibility
    if (transition && value) {
      transition.beforeEnter(el)
    } else {
      setState(el, value)
    }
  },

  mounted(el, { value }, { transition }) {
    console.log('mounted - el: ', el)
    // console.log('mounted - value: ', value)
    // console.log('mounted - transition: ', transition)

    if (transition && value) {
      transition.enter(el)
    }
  },

  updated(el, { value, oldValue }, { transition }) {
    // console.log('updated - el: ', el)
    // console.log('updated - value: ', value)
    // console.log('updated - oldValue: ', oldValue)
    // console.log('updated - transition: ', transition)

    if (!value === !oldValue) return
    if (transition) {
      if (value) {
        transition.beforeEnter(el)
        setState(el, true)
        transition.enter(el)
      } else {
        transition.leave(el, () => {
          setState(el, false)
        })
      }
    } else {
      setState(el, value)
    }
  },

  beforeUnmount(el, { value }) {
    // console.log('beforeUnmount - el: ', el)
    // console.log('beforeUnmount - value: ', value)

    setState(el, value)
  },
}

function setState(el: VInlineElement, value: unknown): void {
  el.style.visibility = value ? el._vod : 'hidden'
}

export default InlineTransition
