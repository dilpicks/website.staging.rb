import { index, show, create } from '@/apis/crud.api'
import { IRecord } from '@/types/general'

class CrudService {
  async index(controller: string, searchParams: URLSearchParams | undefined = undefined) {
    return index(controller, searchParams).then((response) => {
      return response.data
    })
  }

  // eslint-disable-next-line prettier/prettier
  async show(controller: string, id: string | Array<string>, searchParams: URLSearchParams | undefined = undefined) {
    return show(controller, id, searchParams).then((response) => {
      return response.data
    })
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  async create(controller: string, data: IRecord) {
    return create(controller, data).then((response) => {
      return response.data
    })
  }
}

const instance = new CrudService()

export default instance
