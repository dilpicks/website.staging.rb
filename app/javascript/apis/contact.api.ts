// eslint-disable-next-line prettier/prettier
import {
  AxiosResponse,
  // AxiosRequestHeaders
} from 'axios'

import { IContactForm, IContactFormData, IContactFormAttributes } from '@/types/general'
// import { create } from '@/apis/crud.api'
// import { http } from '@/services/http.service'
import CrudService from '@/services/crud.service'

// const connection = axios.create({
//   baseURL: '',
//   headers: {
//     'Content-Type': 'application/json',
//     // eslint-disable-next-line prettier/prettier
//     'Accept': 'application/json',
//   },
// })

// connection.interceptors.response.use(
//   (response) => {
//     console.log('')
//     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//     console.log('contact.api.ts - submit - response: ', response)
//     console.log('--------------------------------------')
//     console.log('contact.api.ts - submit - response.status: ', response.status)
//     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//     console.log('')

//     if (response.status === 401) {
//       return response
//     } else if (response.status === 200) {
//       if (response?.request?.responseURL) {
//         const responseURL = new URL(response.request.responseURL)
//         const responseParams = responseURL.searchParams
//         const responseMessage = responseParams.get('error')

//         console.log('')
//         console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//         console.log('contact.api.ts - submit - responseURL: ', responseURL)
//         console.log('--------------------------------------')
//         console.log('contact.api.ts - submit - responseParams: ', responseParams)
//         console.log('--------------------------------------')
//         console.log('contact.api.ts - submit - responseMessage: ', responseMessage)
//         console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//         console.log('')

//         if (responseMessage) {
//           const decodedMessage = decodeURIComponent(responseMessage).replaceAll('+', ' ')

//           console.log('')
//           console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//           console.log('contact.api.ts - submit - decodedMessage: ', decodedMessage)
//           console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//           console.log('')

//           return Promise.reject(decodedMessage)
//         }
//       }
//     }

//     return response
//   },
//   (error) => {
//     const errMessage: string = error?.response?.data || 'Unknown Error'

//     return Promise.reject(errMessage)
//   },
// )

// export const submit_old = (contactForm: IContactForm): Promise<AxiosResponse> => {
//   const endPoint = contactForm?.action
//   const submitMethod = contactForm?.method

//   const formData = contactForm.formData

//   // formData.append('authenticity_token', this.csrfToken)

//   console.log('')
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('contact.api.ts - submit - formData: ', formData)
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('')

//   console.log('')
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('contact.api.ts - submit - contactForm: ', contactForm)
//   // eslint-disable-next-line prettier/prettier
//   console.log('contact.api.ts - submit - contactForm.formData: ', contactForm.formData)
//   console.log('contact.api.ts - submit - endPoint: ', endPoint)
//   console.log('contact.api.ts - submit - submitMethod: ', submitMethod)
//   console.log('contact.api.ts - submit - connection: ', connection)
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('')

//   // eslint-disable-next-line @typescript-eslint/no-explicit-any
//   let response: any

//   if (submitMethod.toLowerCase() === 'post') {
//     const data = {
//       contact: {},
//     }

//     // data.authenticity_token = this.csrfToken

//     for (const [key, value] of formData.entries()) {
//       data.contact[key] = String(value)
//     }

//     console.log('')
//     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//     console.log('contact.api.ts - submit - data: ', data)
//     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//     console.log('')

//     response = connection.post(endPoint, data)
//   } else if (submitMethod.toLowerCase() === 'get') {
//     const encodedFormDataParams = new URLSearchParams()

//     for (const [key, value] of formData.entries()) {
//       console.log(`${key}, ${value}`)
//       encodedFormDataParams.append(key, String(value))
//     }

//     console.log('')
//     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//     console.log('contact.api.ts - submit - encodedFormDataParams: ', encodedFormDataParams)
//     console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//     console.log('')

//     response = connection.get(endPoint, { params: encodedFormDataParams })
//   }

//   console.log('')
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('contact.api.ts - submit - response: ', response)
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('')

//   return response
// }

// show(id: string | Array<string>, searchParams: URLSearchParams | undefined = undefined) {
//   return CrudService.show(controller, id, searchParams).then(
//     (response: AxiosResponse) => {
//       this.article = response.data
//       return Promise.resolve(response)
//     },
//     (error) => {
//       return Promise.reject(error)
//     },
//   )
// },

export const submit = (contactForm: IContactForm): Promise<AxiosResponse> => {
  const controller = 'contacts'
  // const endPoint = contactForm?.action
  // const submitMethod = contactForm?.method

  const contactFormDataAttributes: IContactFormAttributes = {
    firstName: String(contactForm.formData.get('first_name')),
    lastName: String(contactForm.formData.get('last_name')),
    email: String(contactForm.formData.get('email')),
    subject: String(contactForm.formData.get('subject')),
    message: String(contactForm.formData.get('message')),
  }

  if (contactForm.formData.get('organization')) {
    contactFormDataAttributes.organization = String(contactForm.formData.get('organization'))
  }

  if (contactForm.formData.get('role')) {
    contactFormDataAttributes.role = String(contactForm.formData.get('role'))
  }

  const createParams: IContactFormData = {
    type: 'contact',
    attributes: contactFormDataAttributes,
  }

  return CrudService.create(controller, createParams).then(
    (response: AxiosResponse) => {
      // this.article = response.data
      return Promise.resolve(response)
    },
    (error) => {
      return Promise.reject(error)
    },
  )
}

// export const submit = (contactForm: IContactForm): Promise<AxiosResponse> => {
//   // const endPoint = contactForm?.action
//   // const submitMethod = contactForm?.method

//   const formData = contactForm.formData

//   const createParams = { contact: {} }
//   for (const [key, value] of formData.entries()) {
//     createParams.contact[key] = String(value)
//   }

//   console.log('')
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('contact.api.ts - submit - createParams: ', createParams)
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('')

//   const response = http.post('contacts', createParams)

//   console.log('')
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('contact.api.ts - submit - response: ', response)
//   console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
//   console.log('')

//   return response
// }
