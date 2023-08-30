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
import { ITest } from '@/types/general'

interface IState {
  tests: Array<ITest>
  test: ITest | undefined
}

const controller = 'tests'
const initialState: IState = { tests: [], test: undefined }

export const useTestsStore = defineStore('tests.store', {
  state: (): IState => ({ ...initialState }),

  getters: {
    all: (state: IState) => {
      return state.tests
    },

    available: (state: IState) => {
      return state.tests.filter((test) => test?.attributes?.available === true)
    },
  },

  actions: {
    // eslint-disable-next-line prettier/prettier
    index(searchParams: URLSearchParams | undefined = undefined) {
      return CrudService.index(controller, searchParams).then(
        (response: AxiosResponse) => {
          this.tests = response.data
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
          this.test = response.data
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
  import.meta.hot.accept(acceptHMRUpdate(useTestsStore, import.meta.hot))
}
