<template>
  <div class="page">
    <section class="section policy billing-notice">
      <div class="container">
        <!-- eslint-disable -->
        <div class="sub-section copy-block">
          <h3 class="h3">
            Notification of Updated Coding and Pricing for High Throughput Testing of the
            Coronavirus (Covid-19) NAA test (Lab 144A/U0003, U0005) for Out of Network Plans
          </h3>

          <p class="p4"><strong>Last updated:</strong> July 14, 2020</p>

          <p class="p4">
            To: Insurance Plans/Issuers
            <br /><br />
            In the response to have increased testing capacity renegade.bio’s high throughput
            technology, faster resulting and more effective response to the COVID-19 pandemic, the
            Centers for Medicare and Medicaid Services has issued additional coding and pricing
            guidance for certain clinical diagnostic laboratory tests for the detection of
            SARS-CoV-2 or the diagnosis of the virus that causes COVID-19 (COVID-19 testing). CMS
            Ruling No. CMS-2020-01-R dated April 14, 2020, CMS advised that COVID-19 testing
            utilizing high-throughput technology should be identified by two new HCPCS Codes U0003
            or U0004. The appropriate code for the testing we perform is U0003 and this code should
            be paid at $100.00.
          </p>

          <p class="p4">
            Renegade.bio will accept reimbursement at 100% of the CMS 2020 National Limitation
            Amount for the 2019 Novel Coronavirus (COVID-19), NAA test (Lab 144A/ U0003), which is
            now $100.00.
          </p>

          <p class="p4">
            Renegade.bio’s mission is accelerating humanity’s capacity to test for Novel pathogens
            such as COVID-19. Our work empowers an overburdened public health system to respond
            swiftly to epidemiologic crises by delivering fast, reliable, cost-effective solutions
            for community-based triage.
            <br /><br />
            Sincerely,
          </p>

          <Image v-if="signature" :image="signature" />

          <p class="p4">
            Craig Rouskey, MSc
            <br />
            Co-founder & CEO
          </p>
        </div>
        <!-- eslint-enable -->
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
  import Image from '@/components/Image.vue'
  import { IImage } from '@/types/general'

  const signature: IImage = {
    id: 'craig-rouskey-signature',
    src: 'https://res.cloudinary.com/renegade-bio/image/upload/graphics/craig-rouskey-signature',
    title: 'Craig Rouskey, Co-founder & CEO',
    alt: 'Craig Rouskey signature',
    width: 448,
    height: 151,
  }
</script>

<style setup scoped lang="scss">
  .image-container {
    flex: 1 1 100%;
    // img {
    //   width: ;
    //   height: ;
    // }
  }
</style>
