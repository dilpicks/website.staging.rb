import // computed,
// defineProps,
// defineComponent,
// onMounted,
// reactive,
// ref,
'vue'

import { AxiosResponse } from 'axios'
import { acceptHMRUpdate, defineStore } from 'pinia'
import CrudService from '@/services/crud.service'
import { IArticle } from '@/types/general'

interface IState {
  articles: Array<IArticle>
  article: IArticle | undefined
}

const controller = 'articles'

// const initialState: IState = { record: CrudService.getRecord() }
const initialState: IState = { articles: [], article: undefined }

export const useArticlesStore = defineStore('articles.store', {
  state: (): IState => ({ ...initialState }),

  getters: {
    all: (state: IState) => {
      return state.articles
    },

    // article: (state: IState) => {
    //   return state.articles.filter((article) => article?.id === 'news')
    // },

    news: (state: IState) => {
      return state.articles.filter((article) => article?.attributes?.articleType === 'news')
    },

    pressReleases: (state: IState) => {
      // eslint-disable-next-line prettier/prettier
      return state.articles.filter((article) => article?.attributes?.articleType === 'press-release')
    },

    publications: (state: IState) => {
      return state.articles.filter((article) => article?.attributes?.articleType === 'publication')
    },

    awards: (state: IState) => {
      return state.articles.filter((article) => article?.attributes?.articleType === 'award')
    },
  },

  actions: {
    // eslint-disable-next-line prettier/prettier
    index(searchParams: URLSearchParams | undefined = undefined) {
      return CrudService.index(controller, searchParams).then(
        (response: AxiosResponse) => {
          this.articles = response.data
          return Promise.resolve(response)
        },
        (error) => {
          return Promise.reject(error)
        },
      )
    },

    // eslint-disable-next-line prettier/prettier
    show(id: string | Array<string>, searchParams: URLSearchParams | undefined = undefined) {
      return CrudService.show(controller, id, searchParams).then(
        (response: AxiosResponse) => {
          this.article = response.data
          return Promise.resolve(response)
        },
        (error) => {
          return Promise.reject(error)
        },
      )
    },
  },
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useArticlesStore, import.meta.hot))
}
