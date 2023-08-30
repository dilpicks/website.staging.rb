// eslint-disable-next-line prettier/prettier
import axios, {
  AxiosResponse,
  // AxiosRequestHeaders
} from 'axios'

import { IInsightlyFormData } from '@/types/general'
// import qs from 'qs'

// const connection = axios.create({
//   baseURL: '', // 'https://chloe.insightly.services/Forms/',
//   headers: {
//     'Content-Type': 'application/x-www-form-urlencoded',
//   },
// })

const connection = axios.create({
  baseURL: '',
  headers: {
    'Content-Type': 'application/json',
  },
})

connection.interceptors.response.use(
  (response) => {
    console.log('')
    console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    console.log('insightly.api.ts - submit - response: ', response)
    console.log('--------------------------------------')
    console.log('insightly.api.ts - submit - response.status: ', response.status)
    console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    console.log('')

    if (response.status === 401) {
      return response
    } else if (response.status === 200) {
      if (response?.request?.responseURL) {
        const responseURL = new URL(response.request.responseURL)
        const responseParams = responseURL.searchParams
        const responseMessage = responseParams.get('error')

        console.log('')
        console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        console.log('insightly.api.ts - submit - responseURL: ', responseURL)
        console.log('--------------------------------------')
        console.log('insightly.api.ts - submit - responseParams: ', responseParams)
        console.log('--------------------------------------')
        console.log('insightly.api.ts - submit - responseMessage: ', responseMessage)
        console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        console.log('')

        if (responseMessage) {
          const decodedMessage = decodeURIComponent(responseMessage).replaceAll('+', ' ')

          console.log('')
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('insightly.api.ts - submit - decodedMessage: ', decodedMessage)
          console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
          console.log('')

          return Promise.reject(decodedMessage)
        }
      }
    }

    return response
  },
  (error) => {
    const errMessage: string = error?.response?.data || 'Unknown Error'

    return Promise.reject(errMessage)
  },
)

export const submit = (insightlyFormData: IInsightlyFormData): Promise<AxiosResponse> => {
  const endPoint = insightlyFormData?.action
  const submitMethod = insightlyFormData?.method
  const encodedFormData = new URLSearchParams()
  for (const [key, value] of insightlyFormData.formData.entries()) {
    console.log(`${key}, ${value}`)
    encodedFormData.append(key, String(value))
  }

  console.log('')
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  console.log('insightly.api.ts - submit - insightlyFormData: ', insightlyFormData)
  // eslint-disable-next-line prettier/prettier
  console.log('insightly.api.ts - submit - insightlyFormData.formData: ', insightlyFormData.formData)
  // eslint-disable-next-line prettier/prettier
  // console.log('insightly.api.ts - submit - qs.stringify(insightlyFormData.formData): ', qs.stringify(insightlyFormData.formData))
  console.log('insightly.api.ts - submit - endPoint: ', endPoint)
  console.log('insightly.api.ts - submit - submitMethod: ', submitMethod)
  console.log('insightly.api.ts - submit - connection: ', connection)
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  console.log('')

  console.log('')
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  console.log('insightly.api.ts - submit - encodedFormData: ', encodedFormData)
  // console.log('insightly.api.ts - submit - qs.stringify(encodedFormData): ', qs.stringify(encodedFormData))
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  console.log('')

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  let response: any

  if (submitMethod.toLowerCase() === 'post') {
    response = connection.post(endPoint, encodedFormData)
  } else if (submitMethod.toLowerCase() === 'get') {
    response = connection.get(endPoint, { params: encodedFormData })
  }

  console.log('')
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  console.log('insightly.api.ts - submit - response: ', response)
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  console.log('')

  return response
}
