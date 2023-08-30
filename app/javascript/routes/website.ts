const Accreditations = () => import('@/pages/website/AccreditationsPage.vue')
const AnnualReport = () => import('@/pages/website/AnnualReportPage.vue')
const Article = () => import('@/pages/shared/ArticlePage.vue')
const BillingNotice = () => import('@/pages/website/BillingNoticePage.vue')
// const CardiovascularHealth = () => import('@/pages/website/CardiovascularHealthPage.vue')
const PrepTesting = () => import('@/pages/website/PrepTestingPage.vue')
const CaseStudies = () => import('@/pages/website/CaseStudiesPage.vue')
const CaseStudy = () => import('@/pages/website/CaseStudyPage.vue')
const ContactUs = () => import('@/pages/website/ContactUsPage.vue')
const Covid19Solutions = () => import('@/pages/website/Covid19SolutionsPage.vue')
const CTPStatement = () => import('@/pages/website/CTPStatementPage.vue')
const Home = () => import('@/pages/website/HomePage.vue')
const InfectiousDiseases = () => import('@/pages/website/InfectiousDiseasesPage.vue')
const InnovationsInDiagnostics = () => import('@/pages/website/InnovationsInDiagnosticsPage.vue')
// const Login = () => import('@/pages/website/LoginPage.vue')
const ManageCookies = () => import('@/pages/website/ManageCookiesPage.vue')
const Metabolomic = () => import('@/pages/website/MetabolomicPage.vue')
const Microgenesis = () => import('@/pages/website/MicrogenesisPage.vue')
const Newsroom = () => import('@/pages/website/NewsroomPage.vue')
const NotFound = () => import('@/pages/shared/NotFoundPage.vue')
const PrivacyPolicy = () => import('@/pages/website/PrivacyPolicyPage.vue')
const RenegadeReach = () => import('@/pages/website/RenegadeReachPage.vue')
const RenegadeScience = () => import('@/pages/website/RenegadeSciencePage.vue')
const ReproductiveHealth = () => import('@/pages/website/ReproductiveHealthPage.vue')
// const Signup = () => import('@/pages/website/SignupPage.vue')
const TermsAndConditions = () => import('@/pages/website/TermsAndConditionsPage.vue')
const Test = () => import('@/pages/website/TestPage.vue')
const TestDirectory = () => import('@/pages/website/TestDirectoryPage.vue')
const UmojaHealth = () => import('@/pages/website/UmojaHealthPage.vue')
const WhoWeAre = () => import('@/pages/website/WhoWeArePage.vue')

export const routerPaths = {
  home: 'home',
  howWeWork: 'how-we-work',
  renegadeReach: 'renegade-reach',
  renegadeScience: 'renegade-science',
  infectiousDiseases: 'infectious-diseases',
  reproductiveHealth: 'reproductive-health',
  cardiovascularHealth: 'cardiovascular-health',
}

const routes = [
  // *****************************************************************************************
  // Home
  // -----------------------------------------------------------------------------------------
  {
    path: '/',
    name: 'home',
    components: {
      default: Home,
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // How We Work
  // -----------------------------------------------------------------------------------------
  // Renegade Reach
  {
    meta: { group: 'how-we-work' },
    path: '/renegade-reach',
    name: 'renegade-reach',
    components: {
      default: RenegadeReach,
    },
  },

  // Renegade Science
  {
    meta: { group: 'how-we-work' },
    path: '/renegade-science',
    name: 'renegade-science',
    components: {
      default: RenegadeScience,
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // Diagnostic Solutions
  // -----------------------------------------------------------------------------------------
  // Infectious Diseases
  {
    meta: { group: 'diagnostic-solutions' },
    path: '/infectious-diseases',
    name: 'infectious-diseases',
    components: {
      default: InfectiousDiseases,
    },
  },

  // Reproductive Health
  {
    meta: { group: 'diagnostic-solutions' },
    path: '/reproductive-health',
    name: 'reproductive-health',
    components: {
      default: ReproductiveHealth,
    },
  },

  // // Cardiovascular Health
  // {
  //   meta: { group: 'diagnostic-solutions' },
  //   path: '/cardiovascular-health',
  //   name: 'cardiovascular-health',
  //   components: {
  //     default: CardiovascularHealth,
  //   },
  // },

  // PrEP Testing
  {
    meta: { group: 'diagnostic-solutions' },
    path: '/prep-testing',
    name: 'prep-testing',
    components: {
      default: PrepTesting,
    },
  },

  // Innovations in Diagnostics
  {
    meta: { group: 'diagnostic-solutions' },
    path: '/innovations-in-diagnostics',
    name: 'innovations-in-diagnostics',
    components: {
      default: InnovationsInDiagnostics,
    },
  },

  // Test Directory
  {
    meta: { group: 'diagnostic-solutions' },
    path: '/test-directory',
    alias: '/tests',
    name: 'test-directory',
    components: {
      default: TestDirectory,
    },
  },

  {
    path: '/test-directory/:id',
    alias: '/tests/:id',
    name: 'test',
    components: {
      default: Test,
    },
  },

  // *****************************************************************************************

  // *****************************************************************************************
  // Case Studies
  // -----------------------------------------------------------------------------------------
  // Case Studies
  {
    meta: { group: 'case-studies' },
    path: '/case-studies',
    name: 'case-studies',
    components: {
      default: CaseStudies,
    },
    children: [
      {
        path: ':id',
        name: 'umoja-health',
        components: {
          default: CaseStudy,
        },
      },
    ],
  },

  // Umoja Health
  {
    meta: { group: 'case-studies' },
    path: '/case-studies/umoja-health',
    name: 'umoja-health',
    components: {
      default: UmojaHealth,
    },
  },

  // Metabolomic
  {
    meta: { group: 'case-studies' },
    path: '/case-studies/metabolomic',
    name: 'metabolomic',
    components: {
      default: Metabolomic,
    },
  },

  // Microgenesis
  {
    meta: { group: 'case-studies' },
    path: '/case-studies/microgenesis',
    name: 'microgenesis',
    components: {
      default: Microgenesis,
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // Who We Are
  // -----------------------------------------------------------------------------------------
  // Who We Are
  {
    path: '/who-we-are',
    name: 'who-we-are',
    components: {
      default: WhoWeAre,
    },
  },

  // Annual Report
  {
    meta: { group: 'who-we-are' },
    path: '/annual-report',
    name: 'annual-report',
    components: {
      default: AnnualReport,
    },
  },

  // Careers
  {
    meta: { group: 'who-we-are' },
    path: '/careers',
    name: 'careers',
    redirect: {
      name: 'https://renegade-bio.breezy.hr/',
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // Covid-19 Solutions
  // -----------------------------------------------------------------------------------------
  // COVID-19 Solutions
  {
    meta: { group: 'covid-19-solutions' },
    path: '/covid-19-solutions',
    name: 'covid-19-solutions',
    components: {
      default: Covid19Solutions,
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // Contact Us
  // -----------------------------------------------------------------------------------------
  {
    path: '/contact-us',
    name: 'contact-us',
    components: {
      default: ContactUs,
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // Legal
  // -----------------------------------------------------------------------------------------
  // Terms & Conditions
  {
    path: '/policies/terms-and-conditions',
    name: 'terms-and-conditions',
    components: {
      default: TermsAndConditions,
    },
  },

  // Privacy Policy
  {
    path: '/policies/privacy-policy',
    name: 'privacy-policy',
    components: {
      default: PrivacyPolicy,
    },
  },

  // Accreditations
  {
    path: '/policies/accreditations-certifications',
    alias: '/policies/accreditations',
    name: 'accreditations',
    components: {
      default: Accreditations,
    },
  },

  // Billing Notice
  {
    path: '/policies/billing',
    alias: '/policies/billing-notice',
    name: 'billing-notice',
    components: {
      default: BillingNotice,
    },
  },

  // Manage Cookies
  {
    path: '/policies/manage-cookies',
    name: 'manage-cookies',
    components: {
      default: ManageCookies,
    },
  },
  // *****************************************************************************************

  // *****************************************************************************************
  // Other / Stand Alone
  // -----------------------------------------------------------------------------------------
  {
    path: '/ctp-statement',
    name: 'ctp-statement',
    components: {
      default: CTPStatement,
    },
  },

  {
    path: '/support-and-faq',
    name: 'support-and-faq',
    redirect: {
      name: 'https://support.renegade.bio/',
    },
  },

  {
    path: '/404',
    name: 'not-found',
    components: {
      default: NotFound,
    },
  },

  {
    path: '/newsroom',
    name: 'newsroom',
    components: {
      default: Newsroom,
    },
  },

  {
    path: '/newsroom/:id',
    name: 'article',
    components: {
      default: Article,
    },
  },

  // *****************************************************************************************

  // *****************************************************************************************
  // Authentication
  // -----------------------------------------------------------------------------------------
  // // Sign Up
  // {
  //   path: '/signup',
  //   name: 'signup',
  //   components: {
  //     default: Signup,
  //   },
  // },

  // // Login
  // {
  //   path: '/login',
  //   name: 'login',
  //   components: {
  //     default: Login,
  //   },
  // },
  // *****************************************************************************************
]

export default routes
