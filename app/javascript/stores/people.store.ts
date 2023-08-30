import { AxiosResponse } from 'axios'
import { acceptHMRUpdate, defineStore } from 'pinia'
import CrudService from '@/services/crud.service'
import { IPerson } from '@/types/general'

interface IState {
  people: Array<IPerson>
  person: IPerson | undefined
}

const controller = 'people'

// const initialState: IState = { record: CrudService.getRecord() }
const initialState: IState = { people: [], person: undefined }

export const usePeopleStore = defineStore('people.store', {
  state: (): IState => ({ ...initialState }),

  getters: {
    all: (state: IState) => {
      return state.people
    },

    authors: (state: IState) => {
      return state.people.filter((person) => {
        return person?.attributes?.articleCount && person?.attributes?.articleCount > 0
      })
    },

    featuredTeamMembers: (state: IState) => {
      return state.people.filter((person) => {
        return person?.attributes?.teamMember === true && person?.attributes?.featured === true
      })
    },
  },

  actions: {
    // eslint-disable-next-line prettier/prettier
    index(searchParams: URLSearchParams | undefined = undefined) {
      return CrudService.index(controller, searchParams).then(
        (response: AxiosResponse) => {
          this.people = response.data

          return Promise.resolve(response)
        },
        (error) => {
          return Promise.reject(error)
        },
      )
    },

    // eslint-disable-next-line prettier/prettier
    // show(id: string | Array<string>, searchParams: URLSearchParams | undefined = undefined) {
    //   return CrudService.show(controller, id, searchParams).then(
    //     (response: AxiosResponse) => {
    //       this.person = response.data
    //       return Promise.resolve(response)
    //     },
    //     (error) => {
    //       return Promise.reject(error)
    //     },
    //   )
    // },
  },
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(usePeopleStore, import.meta.hot))
}
