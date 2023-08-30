// Accordion
export interface IAccordionList {
  id: string
  accordionItems: Array<IAccordionItem>
  classes?: Array<string>
  initialExpandedItemId?: string | null
  transitionDuration?: number
  debug?: boolean
}

// Accordion Item
export interface IAccordionItem {
  id: string
  title: string
  content: string
  inert?: boolean
  image?: IImage
  classes?: Array<string>
}

// Article List
export interface IArticleList {
  id: string
  articleItems: Array<IArticle>
  classes?: Array<string>
  debug?: boolean
}

// Article
export interface IArticle extends IRecord {
  attributes?: IArticleAttributes
}

// Article Attributes
export interface IArticleAttributes {
  title: string
  link: ILink
  content?: string
  copyBlocks?: Array<ICopyBlock>
  source?: string
  image?: IImage
  thumbnail?: IImage
  classes?: Array<string>
  pageStatus: string
  articleType: string
  publishedAt?: string // ISO format / Timestamp
  publishedDate?: string // MM/DD/YYYY format
  featured: boolean
  summary?: string
  subtitle?: string
  metaTitle?: string
  metaDescription?: string
  location?: string
}

export type Events = {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  animationMounted?: any
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  htmlContentMounted?: any
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  inlineSvgMounted?: any
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  expandItem?: any
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  shapeMounted?: any
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  heroMounted?: any
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  elementHeightChange?: any
}

// IAnimation
export interface IAnimation {
  type?: 'fade' | 'zoom'
  classes?: Array<string>
  content: string
  name: string
}

// Animation Block
export interface IAnimationBlock {
  id: string
  classes?: Array<string>
  copyBlocks?: Array<ICopyBlock>
  animation: IAnimation
}

// Card
export interface ICard {
  id: string
  type?: string | null | undefined
  componentType?: string | null | undefined
  attributes?: ICardAttributes
}

// Card Attributes
export interface ICardAttributes {
  classes?: Array<string>
  name?: string
  title?: string
  content?: string
  link?: ILink
  color?: string
  prehead?: string
  image?: IImage
  shape?: IShape
  thumbnail?: IImage
}

// Callout
export interface ICallout {
  id: string
  classes?: Array<string>
  content: string
}

// CaseStudy
export interface ICaseStudyDetails {
  id: string
  company?: string
  headquarters?: string
  content?: string
  link?: ILink
  image?: IImage
  classes?: Array<string>
}

// Copy Blocks
export interface ICopyBlock {
  content: string
  id?: string
  classes?: Array<string>
}

// Current User
export interface ICurrentUser {
  id: number
}

// Element Refs
export interface IElementRefs {
  [key: string]: Proxy
}

export interface IEventCollection {
  id?: string
  classes?: Array<string>
  eventGroups: Array<IEventGroup>
}

// export interface IEventCollection {
//   id?: string
//   classes?: Array<string>
//   title?: string
//   eventGroups: Array<IEventGroup>
// }

export interface IEventGroup {
  id?: string
  classes?: Array<string>
  title?: string
  eventGroups?: Array<IEventGroup>
  events?: Array<IEvent>
}

export interface IEvent {
  id?: string
  classes?: Array<string>
  title?: string
  copyBlocks: Array<ICopyBlock>
}

// Form
export interface IForm {
  fields: Array<IFormField>
  id?: string
  classes?: Array<string>
}

// Form Field
export interface IFormField {
  id: string
  type: string
  label: string
  placeholder: string
  input?: string
  disabled?: boolean
  name?: string
  classes?: Array<string>
}

// Gallery
export interface IGallery {
  id: string
  galleryItems: Array<IGalleryItem>
  classes?: Array<string>
}

// Gallery Item
export interface IGalleryItem {
  id: string
  attibution: string
  copyBlocks: Array<ICopyBlock>
  image: IImage
  classes?: Array<string>
  debug?: boolean
}

// Image
export interface IImage {
  id?: string
  src: string
  width: number
  height: number
  title?: string
  alt?: string
  link?: ILink
  classes?: Array<string>
}

export type SubmitMethod = 'get' | 'post'

// ContactForm
export interface IContactForm {
  action: string
  method: SubmitMethod
  formData: FormData
}

// ContactFormData
export interface IContactFormAttributes {
  firstName: string
  lastName: string
  email: string
  organization?: string
  role?: string
  subject: string
  message: string
}

// Article
export interface IContactFormData extends IRecord {
  attributes: IContactFormAttributes
}

// InsightlyFormData
export interface IInsightlyFormData {
  action: string
  method: SubmitMethod
  formData: FormData
}

// InsightlyFormSimpleNewsletterOptIn
export interface IInsightlyFormSimpleNewsletterOptIn {
  email: string
  formData: FormData
}

// Link
export interface ILink {
  type: 'external' | 'route-link' | 'anchor-link'
  content?: string
  id?: string
  href?: string
  name?: string // Used specifically for named routes, with `href` being the fallback, even for a named route
  hash?: string
  params?: RouteParamsRaw
  rel?: string
  target?: string
  classes?: Array<string>
}

// Page Data
export interface IPageData {
  id: string
  classes?: Array<string>
  title?: string
  copyBlocks?: Array<ICopyBlock>
  cards?: Array<ICard>
  risographs?: Array<IRisographImage>
  images?: Array<IImage>
  shapes?: Array<IShapeImage>
  pageNavItems?: Array<IPageNavItem>
  galleryItems?: Array<IGalleryItem>
  accordionList?: IAccordionList
  articleList?: IArticleList
  caseStudyDetails?: ICaseStudyDetails
  testList?: ITestList
  tabCollection?: ITabCollection
  eventCollection?: IEventCollection
  animationBlock?: IAnimationBlock
  callouts?: Array<ICallout>
}

// Page Nav Item
export interface IPageNavItem {
  id: string
  link: ILink
}

// Person
export interface IPerson extends IRecord {
  // ===========================================================================
  // From `IRecord`
  // ===========================================================================
  id: string
  // createdAt?: string
  // updatedAt?: string
  // type: string
  // slug?: string

  // ===========================================================================
  // Overrides
  // ===========================================================================
  attributes: IPersonAttributes
}

// Person Attributes
export interface IPersonAttributes {
  name: string
  teamMember: boolean
  featured: boolean
  title?: string
  image?: IImage
  link?: ILink

  // Alias
  content?: string // Alias of `Person.summary`|| `Person.bio`

  // Virtual
  articleCount: number
}

// Record
export interface IRecord {
  id?: string
  createdAt?: string
  updatedAt?: string
  type: string
  slug?: string
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  attributes?: unknown
}

// Register User
export interface IRegisterUser extends IUserLogin {
  password_confirmation: string
}

// Risograph Image
export interface IRisographImage extends IImage {
  offsetX?: number
  offsetY?: number
}

// Shape Image
export interface IShapeImage extends IImage {
  renderAsSVG?: boolean
  clip?: string
  offsetX?: number
  offsetY?: number
}

// Tab Collection
export interface ITabCollection {
  id: string
  tabList: Array<ITab>
  classes?: Array<string>
}

// Tab
export interface ITab {
  id: string
  headline: string
  title?: string
  image?: IImage
  prehead?: string
  content?: string
  link?: ILink
  classes?: Array<string>
}

// Test List
export interface ITestList {
  id: string
  testItems: Array<ITestItem>
  classes?: Array<string>
}

// Test Item
// export interface ITestItem {
//   id: string
//   number: string
//   name: string
//   specimen: string
//   createdAt: string
//   updatedAt?: string
//   image?: string
//   content?: string
//   link?: ILink
//   classes?: Array<string>
// }

// Article
export interface ITest extends IRecord {
  attributes?: ITestAttributes
}

export interface IAttributeGroup {
  id: number
  slug: string
  name: string
  title: string
  attributes: Array<IAttribute>
}

export interface ICharacteristic {
  id: number
  slug: string
  name: string
  title: string
  // characteristicGroup: ICharacteristicGroup
  // testId: number
  shown: boolean
  content: string
}

// Article Characteristics
export interface ITestAttributes {
  code: string
  cptCodes: Array<string>
  name: string
  title?: string
  shown: boolean
  available: boolean
  createdAt?: string
  updatedAt?: string
  publishedAt: string
  publishedDate: string
  image?: IImage
  characteristicGroups: Array<ICharacteristicGroup>

  // cptCode: string
  // testIncludes: string
  // specialInstructions: string
  // turnaroundTime: string
  // specimen: string
  // volume: string
  // container: string
  // collection: string
  // storageInstructions: string
  // causesForRejection: string
  // sampleStability: string
  // use: string
  // limitations: string
  // disclaimers: string
  // methodology: string
  // additionalResources: string
  // orderCode: string
  // orderCodeName: string
  // orderLOINC: string
  // resultsCode: string
  // resultsCodeName: string
  // uofM: string
  // resultsLOINC: string
}

// User Login
export interface IUserLogin {
  email: string
  password: string
}
