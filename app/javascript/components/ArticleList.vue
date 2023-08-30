<template #articleList>
  <div
    v-if="articleListShown"
    :id="articleList.id"
    :class="['article-list', ...(articleList?.classes ? articleList.classes : [])]"
  >
    <ArticleListItem
      v-for="(articleItem, index) in availableArticles"
      v-show="index < displayedArticlesLimit"
      :key="index"
      :article-item="articleItem"
    />

    <div v-if="showToggleArticlesButton" class="buttons-container">
      <a class="button transparent" @click.prevent="toggleArticlesShown">
        {{ toggleArticlesButtonText }}
      </a>
    </div>
  </div>

  <HtmlContent v-if="showNoAvailableArticlesMessage" :content="noContentMessage" />
</template>

<script setup lang="ts">
  import {
    computed,
    // defineProps,
    // defineComponent,
    // onMounted,
    // reactive,
    ref,
  } from 'vue'

  import ArticleListItem from '@/components/ArticleListItem.vue'
  import HtmlContent from '@/components/HtmlContent.vue'
  import { IArticleList } from '@/types/general'
  // import { showToast } from '@/utils/showToast'

  const INITIAL_DISPLAYED_ARTICLES_LIMIT = 4
  const noContentMessage = `
    <h2 class="h2">No Articles Are Available At This Time.</h2>
  `

  // ===========================================================================
  // Props
  // ===========================================================================
  interface Props {
    articleList: IArticleList
    debug?: boolean
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const props = withDefaults(defineProps<Props>(), {
    debug: false,
  })

  const articleListShown = computed(() => props?.articleList && props?.articleList?.articleItems)
  const availableArticles = computed(() => props?.articleList?.articleItems)
  // const displayedArticles = computed(() => availableArticles?.value.slice(0, 4))

  const displayedArticlesLimit = ref<number>(INITIAL_DISPLAYED_ARTICLES_LIMIT)

  // eslint-disable-next-line prettier/prettier
  const showToggleArticlesButton = computed(
    () => availableArticles?.value.length > INITIAL_DISPLAYED_ARTICLES_LIMIT,
  )

  const toggleArticlesButtonText = ref<string>('View More')

  // ===========================================================================
  // Data
  // ===========================================================================
  const showNoAvailableArticlesMessage = computed(() => !(availableArticles?.value?.length || true))

  // ===========================================================================
  // Computed
  // ===========================================================================

  // ===========================================================================
  // Methods
  // ===========================================================================
  const toggleArticlesShown = () => {
    if (displayedArticlesLimit.value === INITIAL_DISPLAYED_ARTICLES_LIMIT) {
      displayedArticlesLimit.value = availableArticles.value.length
      toggleArticlesButtonText.value = 'View Less'
    } else {
      displayedArticlesLimit.value = INITIAL_DISPLAYED_ARTICLES_LIMIT
      toggleArticlesButtonText.value = 'View More'
    }
  }

  // ===========================================================================
  // Lifecycle Hooks
  // ===========================================================================
</script>

<style setup scoped lang="scss">
  @import '@/assets/css/breakpoints';

  .article-list {
    align-items: flex-start;
    align-content: flex-start;
    justify-content: flex-start;
    flex: 1 1 100%;
    flex-wrap: wrap;
    row-gap: 0rem;

    @include for-tablet-mid-up {
      // flex: 1 1 0;
      flex: 0 1 calc(100% - 40rem);
    }
  }

  .buttons-container {
    padding: 2rem 0;
  }

  .button {
    color: $--color-theme-navy-60;
    font: $--font-primary-300;
    font-size: 1.3rem;
    text-decoration: underline;
    text-transform: uppercase;
    white-space: nowrap;
  }

  :deep() {
    .router-link {
      width: 100%;

      &:only-of-type,
      &:last-of-type {
        .article-item {
          border-color: $--color-border;
          border-style: solid;
          border-width: 0 0 0px 0;
        }
      }
    }

    // .article-item {
    //   &:only-of-type,
    //   &:last-of-type {
    //     border-color: $--color-border;
    //     border-style: solid;
    //     border-width: 0 0 0px 0;
    //   }
    // }
  }
</style>
