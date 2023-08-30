import { AxiosResponse } from 'axios'
import { http } from '@/services/http.service'
import { IRecord } from '@/types/general'

// eslint-disable-next-line prettier/prettier
export const index = (controller: string, searchParams: URLSearchParams | undefined = undefined): Promise<AxiosResponse> => {
  const queryParams = !!searchParams ? { params: searchParams } : undefined

  return http.get(`${controller}`, queryParams)
}

// eslint-disable-next-line prettier/prettier
export const show = (controller: string, id: string | Array<string>, searchParams: URLSearchParams | undefined = undefined): Promise<AxiosResponse> => {
  const queryParams = !!searchParams ? { params: searchParams } : undefined

  return http.get(`${controller}/${id}`, queryParams)
}

// eslint-disable-next-line prettier/prettier
export const update = (controller: string, record: IRecord): Promise<AxiosResponse> => {
  const updateParams = { [record.type]: { slug: record.slug } }

  return http.put(`${controller}/${record.slug}`, updateParams)
}

// eslint-disable-next-line prettier/prettier
export const create = (controller: string, record: IRecord): Promise<AxiosResponse> => {
  const createParams = { [record.type]: record.attributes }

  return http.post(`${controller}`, createParams)
}

// eslint-disable-next-line prettier/prettier
export const destroy = (controller: string, record: IRecord): Promise<AxiosResponse> => {
  const destroyParams = { [record.type]: { slug: record.slug, _destroy: true } }

  return http.delete(`${controller}/${record.slug}`, destroyParams)
}
