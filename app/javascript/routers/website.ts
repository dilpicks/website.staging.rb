import { createRouter, createWebHistory } from 'vue-router'
import routes from '@/routes/website'

const router = createRouter({
  history: createWebHistory(),
  routes,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  scrollBehavior(to, from, savedPosition) {
    if (to.hash) {
      return { el: to.hash, behavior: 'smooth' }
    } else {
      // Always scroll to top when loading a new page
      return { top: 0, behavior: 'smooth' }
    }
  },
})

export default router
