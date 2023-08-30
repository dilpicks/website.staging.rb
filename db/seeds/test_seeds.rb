# rails db:seed:test_seeds
# heroku run rails db:seed:test_seeds --app renegadebio-staging

# ===========================================================================
# Tests
# ===========================================================================
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE tests RESTART IDENTITY")

tests = [
  {
    slug: 'monkeypox-pcr-high-sensitivity-qualitative-naat',
    code: '1012',
    cpt_codes: ['87593'],
    name: 'Monkeypox PCR, High-Sensitivity, Qualitative NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '<p class="p3">N/A</p>'.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '<p class="p3">N/A</p>'.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '<p class="p3">24 hours</p>'.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>Lesion swab</li>
            </ul>'.strip_heredoc.tr("\n", "") 
          }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '<p class="p3">1mL</p>'.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '<p class="p3">2mL Hamilton Tube</p>'.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '<p class="p3">Viral swab taken from one or more vesicles or ulcers</p>'.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Sample must be in 1mL of RNA/DNA shield 1x dry
            </p>
            <ul class="bullet-list">
              <li>RNA: Ambient temperature (4&deg;C&mdash;25&deg;C) &gt;1 month</li>
              <li>DNA: Ambient temperature (4&deg;C&mdash;25&deg;C) &gt;2 years</li>
              <li>DNA &amp; RNA: Frozen (&lt;–20&deg;C): Indefinitely</li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>Specimens submitted in improper tube or container</li>
              <li>Unlabeled specimens</li>
              <li>Leaking containers</li>
              <li>Specimens with syringes or needles attached</li>
              <li>Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)</li>
              <li>Insufficient or incorrect sample type (ex. tissue)</li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>MSM, Bay Area, Low/No access locations</li>
              <li>Outbreaks: Monkeypox is diagnosed by PCR test on a viral swab taken from one or more vesicles or ulcers</li>
              <li>All people, symptoms or exposure (screening in development)</li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              A false negative result may occur if a sample is improperly collected, transported or handled. False negative results may occur if the quantity of viral DNA present in the sample is below the limit of detection for the assay. An inconclusive result may be returned if the lesion is not adequately sampled.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              The Monkeypox DNA and mRNA Real-time PCR is intended for the qualitative detection of Monkeypox virus using swabs from human pustular or vesicular rash specimens. This test was developed and its analytical performance characteristics have been determined by the Renegade laboratory. It has not been cleared or approved by the U.S. Food and Drug Administration. This assay has been validated pursuant to the CLIA regulations and is used for clinical purposes.
            </p>
            <p class="p3">
              <strong>MPXV Detected:</strong> Monkeypox detected by PCR. This test result does not rule out bacterial infection or other viral infection. The results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infectious and non-infectious (e.g. inactivated, treated) viral material. Interpretation of all results must combine with clinical observations, patient history, and epidemiological information of the patient and other diagnostic procedures.
            </p>
            <p class="p3">
              <strong>MPXV Not Detected:</strong> Monkeypox Not Detected by PCR. Not Detected results do not preclude the possibility of infection and should not be used as the sole basis for treatment or other patient management decisions.  Interpretation of all results must combine with clinical observations, patient history, and epidemiological information of the patient and other diagnostic procedures.
            </p>
            <p class="p3">
              <strong>Inconclusive:</strong> An inconclusive result may occur in the case of an inadequate specimen. If a patient diagnosis has not been determined, submit an additional specimen for analysis.
            </p>
            <p class="p3">
              <strong>Equivocal:</strong> An equivocal result may occur in the case of an inadequate specimen where definitive detection of Monkeypox DNA and mRNA could not be confirmed. If a patient diagnosis has not been determined, submit an additional specimen for analysis.
            </p>
            <p class="p3">
              <strong>MPXV Detected:</strong> Monkeypox detected by PCR. This test result does not rule out bacterial infection or other viral infection. The results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infectious and non-infectious (e.g. inactivated, treated) viral material. Interpretation of all results must combine with clinical observations, patient history, and epidemiological information of the patient and other diagnostic procedures.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Multiplex RT-PCR
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'hepatitis-b-virus-hbv-quantitative-viral-load-naat',
    code: '1004',
    cpt_codes: ['87517'],
    name: 'Hepatitis B Virus (HBV) Quantitative Viral Load NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              24&mdash;72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Serum (SST)
              </li>
              <li>
                Plasma (EDTA)
              </li>
              <li>
                Plasma (PPT)
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Vacutainer Tube, 5.0mL, 13 x 100mm, Plastic, Additive: Clot Activator/Polymer Gel, Gold Hemogard Closure, Paper Label
              </li>
              <li>
                Vacutainer Plus, Plastic, K2EDTA, Hemogard Closure, 13mm x 100mm, 6mL
              </li>
              <li>
                BD Vacutainer<sup>&trade;</sup> PPT<sup>&trade;</sup> Plasma Preparation Tubes
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Whole blood collected in SST TM Serum Separation Tubes, BD Vacutainer&reg; PPTTM Plasma Preparation Tubes for Molecular Diagnostic Test Methods or in sterile tubes using EDTA as the anticoagulant.
            </p>
            <p class="p3">
              Plasma/serum samples after separation, in secondary tubes.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                2&deg;C to 25&deg;C up to 24 hours prior to plasma/serum preparation.
              </li>
              <li>
                2&deg;C to 8&deg;C up to 6 days
              </li>
              <li>
                &le; &mdash;18&deg;C up to 12 weeks upon separation (up to 4 freeze/thaw cycles)
              </li>
              <li>
                &le; &mdash;60&deg;C up to 6 months
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
              <li>
                Specimens with syringes or needles attached
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen minimum 200 µL EDTA plasma and 500 µL serum
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              An aid in the management of patients with chronic HBV infection undergoing antiviral therapy.
            </p>
            <p class="p3">
              The test can be used to measure HBV DNA levels at baseline and during treatment to aid in assessing response to treatment.
            </p>
            <p class="p3">
              Not for diagnostic testing; used for antiviral monitoring
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              The HBV quantitative real-time PCR assay has a quantitative range of 10 to 1,000,000,000 IU/mL.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> An interpretation of &ldquo;Not Detected&rdquo; does not rule out hepatitis B virus DNA concentrations below the limit of detection of the assay. The quantitative range of this assay is 10-1,000,000,000 IU/ml (1.0-9.0 Log IU/mL). The test was performed using the quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for use as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
            <p class="p3">
              <strong>Detected (&lt;10 IU/mL):</strong> Hepatitis B DNA viral load below the lower limit of quantitation (10 IU/mL), but above the lower limit of detection for the assay is present. Unable to determine viral concentration in the sample. Repeat testing may be warranted as clinically indicated. The quantitative range of this assay is 10-1,000,000,000 IU/ml (1.0-9.0 Log IU/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for uses as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
            <p class="p3">
              <strong>Detected (10 -1000,000,000 IU/mL):</strong> The quantitative range of this assay is 10 -1,000,000,000 IU/ml (1.0-9.0 Log IU/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for uses as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for uses as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>Quantitative PCR</li>
              <li>NAAT Test</li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'hepatitis-c-virus-hcv-quantitative-viral-load-naat',
    code: '1010',
    cpt_codes: ['87522'],
    name: 'Hepatitis C Virus (HCV) Quantitative Viral Load NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Serum (SST)
              </li>
              <li>
                Plasma (EDTA)
              </li>
              <li>
                Plasma (PPT)
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Vacutainer Tube, 5.0mL, 13 x 100mm, Plastic, Additive: Clot Activator/Polymer Gel, Gold Hemogard Closure, Paper Label
              </li>
              <li>
                Vacutainer Plus, Plastic, K2EDTA, Hemogard Closure, 13mm x 100mm, 6mL
              </li>
              <li>
                BD Vacutainer<sup>&trade;</sup> PPT<sup>&trade;</sup> Plasma Preparation Tubes
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Whole blood collected in SST TM Serum Separation Tubes, BD Vacutainer&reg; PPTTM Plasma Preparation Tubes for Molecular Diagnostic Test Methods or in sterile tubes using EDTA as the anticoagulant.
            </p>
            <p class="p3">
              Plasma/serum samples after separation, in secondary tubes.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                2&deg;C to 25&deg;C up to 24 hours prior to plasma/serum preparation.
              </li>
              <li>
                2&deg;C to 8&deg;C up to 6 days
              </li>
              <li>
                &le; &mdash;18&deg;C up to 12 weeks upon separation (up to 4 freeze/thaw cycles)
              </li>
              <li>
                &le; &mdash;60&deg;C up to 6 months
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
              <li>
                Specimens with syringes or needles attached
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen minimum 200 µL EDTA plasma and 500 µL serum
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              An aid in the diagnosis of HCV infection in the individuals with HCV antibody evidence.
            </p>
            <p class="p3">
              An aid in the management of HCV-infected patients undergoing antiviral therapy.
            </p>
            <p class="p3">
              Not for diagnostic testing; used for antiviral monitoring
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              The quantifiable range of the assay is 15 IU/mL to 100,000,000 IU/mL.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> An interpretation of &ldquo;Not Detected&rdquo; does not rule out hepatitis C virus RNA concentrations below the limit of detection of the assay. The quantitative range of this assay is 15-100,000,000 IU/mL (1.18-8.00 Log IU/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is not intended for uses as a screening test for the presence of virus in blood or blood products.
            </p>
            <p class="p3">
              <strong>Detected (&lt;15 IU/mL):</strong> Hepatitis C DNA viral load below the lower limit of quantitation (15 IU/mL), but above the lower limit of detection for the assay is present. Unable to determine viral concentration in the sample. Repeat testing may be warranted as clinically indicated. For diagnosis of HCV infection when viral load is below the lower limit of detection, results must be interpreted within the context of all relevant clinical and laboratory findings. The quantitative range of this assay is 15-100,000,000 IU/mL (1.18-8.00 Log IU/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is not intended for uses as a screening test for the presence of virus in blood or blood products.
            </p>
            <p class="p3">
              <strong>Detected (15 -100,000,000 IU/mL):</strong> The quantitative range of this assay is 15-100,000,000 IU/mL (1.18-8.00 Log IU/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is not intended for uses as a screening test for the presence of virus in blood or blood products.
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is not intended for uses as a screening test for the presence of virus in blood or blood products.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Hepatitis C Virus: real-time PCR quantitative
              </li>
              <li>
                HCV RNA results
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'hiv-1-quantitative-viral-load-naat',
    code: '1002',
    cpt_codes: ['87536'],
    name: 'HIV-1 Quantitative Viral Load NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              24&mdash;72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Plasma (EDTA)
              </li>
              <li>
                Plasma (PPTTM)
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Vacutainer Plus, Plastic, K2EDTA, Hemogard -Closure, 13mm x 100mm, 6mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Lesion swab
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                30&deg;C up to 24 hours
              </li>
              <li>
                2&deg;C to 8&deg;C up to 5 days
              </li>
              <li>
                &le; -20&deg;C up to 6 weeks, up to three freeze/thaw cycles
              </li>
              <li>
                &le; -60&deg;C long-term storage
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
              <li>
                Specimens with syringes or needles attached
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen minimum 500 uL EDTA plasma.
              </li>
              <li>
                Serum not acceptable
              </li>
              <li>
                Plasma other than EDTA-plasma
              </li>
              <li>
                Unspun plasma
              </li>
              <li>
                Mislabeled specimen
              </li>
              <li>
                Transport past stability time or inappropriate temperature
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              This test is used for the clinical management of HIV-1 infected patients.
            </p>
            <p class="p3">
              The test can be used to assess patient prognosis by measuring the baseline HIV-1 level or to monitor the effects of antiretroviral therapy by measuring changes in HIV-1 RNA levels during the course of antiretroviral treatment.
            </p>
            <p class="p3">
              Not for diagnostic testing; used for antiviral monitoring.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              This procedure should only be used for patients with a documented HIV-1 infection.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> An interpretation of &ldquo;Not Detected&rdquo; does not rule out HIV-1 virus RNA concentrations below the limit of detection of the assay. The quantitative range of this assay is 20-10,000,000 cp/ml (1.3-7.0 Log  cp/mL). The test was performed using the quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for use as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
            <p class="p3">
              <strong>Detected (&lt;20 cp/mL):</strong> HIV-1 RNA viral load below the lower limit of quantitation (20 cp/mL), but above the lower limit of detection for the assay is present. Unable to determine viral concentration in the sample. Repeat testing may be warranted as clinically indicated. The quantitative range of this assay is 20-10,000,000 cp/ml (1.3-7.0 Log cp/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for uses as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
            <p class="p3">
              <strong>Detected (20 -10,000,000 cp/mL):</strong> The quantitative range of this assay is 20-10,000,000 cp/ml (1.3-7.0 Log cp/mL). The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for use as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. The test was performed using quantitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This test is intended for use in conjunction with clinical presentation and other laboratory markers of disease progression for the clinical management of infected patients. This test is not intended for use as a screening test for the presence of virus in blood or blood products or as a diagnostic test to confirm the presence of infection.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              cobas HIV-1 test is a dual-target, real-time PCR assay that provides precise, quantitative HIV-1 RNA results
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'hiv-1-2-rna-qualitative-determination-and-differentiation',
    code: '1003',
    cpt_codes: ['87389'],
    name: 'HIV-1/-2 RNA Qualitative Determination and Differentiation',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              24&mdash;72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Serum (SST)
              </li>
              <li>
                Plasma (EDTA)
              </li>
              <li>
                Plasma (PPTTM)
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Vacutainer Tube, 5.0mL, 13 x 100mm, Plastic, Additive: Clot Activator/Polymer Gel, Gold Hemogard Closure, Paper Label
              </li>
              <li>
                Vacutainer Plus, Plastic, K2EDTA, Hemogard Closure, 13mm x 100mm, 6mL
              </li>
              <li>
                BD Vacutainer<sup>&trade;</sup> PPT<sup>&trade;</sup> Plasma Preparation Tubes
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Whole blood should be collected in BD Vacutainer&reg; PPTTM Plasma Preparation Tubes for Molecular Diagnostic Test Methods or in sterile tubes using EDTA as the anticoagulant. Follow the sample collection tube manufacturer instructions.
            </p>
            <p class="p3">
              Plasma/serum samples after separation, in secondary tubes
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Up to 24 hours: 30&deg;C
              </li>
              <li>
                Up to 5 days: 2&deg;C&mdash;8&deg;C
              </li>
              <li>
                Up to 6 weeks: &le; -20&deg;C & up to three freeze/thaw cycles
              </li>
              <li>
                Long Term Storage: &le; -60&deg;C
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
              <li>
                Specimens with syringes or needles attached
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen minimum 500 uL EDTA plasma.
              </li>
              <li>
                Serum not acceptable
              </li>
              <li>
                Plasma other than EDTA- plasma
              </li>
              <li>
                Unspun plasma
              </li>
              <li>
                Mislabeled specimen
              </li>
              <li>
                Transport past stability time or inappropriate temperature
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              A test to confirm the presence of HIV-1 or HIV-2 infection in an individual with specimens reactive for HIV-1 or HIV-2 antibodies or antigens.
            </p>
            <p class="p3">
              An aid in the diagnosis of infection with HIV-1 and/or HIV-2 in pediatric subjects and pregnant women.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Reactive (repeatedly) specimens must be investigated by additional supplemental tests. A negative test for an individual does not preclude exposure to or infection with HIV-1 and/or HIV-2. Negative results can occur if the quantity of the marker present in the sample is too low for detection by the assay or if the marker is not present during the stage of disease in which a sample is collected.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> An interpretation of &ldquo;Not Detected&rdquo; does not rule out HIV-1/HIV-2 RNA concentrations below the limit of detection of the assay. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is not intended to be used for monitoring patient status, or for screening donors of blood or blood products for HIV.
            </p>
            <p class="p3">
              <strong>Detected (HIV-1):</strong> Detection of HIV-1 nucleic acid is indicative of HIV-1 infection. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is not intended to be used for monitoring patient status, or for screening donors of blood or blood products for HIV.
            </p>
            <p class="p3">
              <strong>Detected (HIV-2):</strong> Detection of HIV-2 nucleic acid is indicative of HIV-2 infection. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is not intended to be used for monitoring patient status, or for screening donors of blood or blood products for HIV.
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is not intended to be used for monitoring patient status, or for screening donors of blood or blood products for HIV.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              HIV 1/HIV 2 Qualitative PCR
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'c-trachomatis-n-gonorrhoeae-pcr-high-sensitivity-qualitative-naat',
    code: '1001',
    cpt_codes: ['87491', '87591', '87801'],
    name: 'C. trachomatis/N. gonorrhoeae PCR, High-Sensitivity, Qualitative NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              24&mdash;72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Cervical:
            </p>
            <ul class="bullet-list">
              <li>
                Endocervical
              </li>
              <li>
                Vaginal
              </li>
            </ul>
            <p class="p3">
              Anorectal &amp; Oropharyngeal:
            </p>
            <ul class="bullet-list">
              <li>
                Urine
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              4.3 mL PCR Media
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Use only the flocked swab in the cobas&reg; PCR Media Dual Swab Sample Kit to collect endocervical specimens after using the large woven polyester swab in the cobas&reg; PCR Dual Swab Sample Kit or an equivalent device to remove cervical secretions.
            </p>
            <p class="p3">
              Use only the woven polyester swab in either the cobas&reg; PCR Media Uni Swab Sample Kit or the cobas&reg; PCR Media Dual Swab Sample Kit to collect vaginal, anorectal, and oropharyngeal swab specimens.
            </p>
            <p class="p3">
              Use only the cobas&reg; PCR Urine Sample Kit to collect urine specimens for cobas&reg; CT/NG.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              All sample types temperature controlled 2&deg;C&mdash;30&deg;C
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                If incoming primary swab specimen tubes with no swabs or with multiple swabs have not been collected according to the instructions in their respective collection kit IFU and should not be tested.
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen minimum
              </li>
              <li>
                Mislabeled specimen
              </li>
              <li>
                Transport past stability time or inappropriate temperature
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              This test is intended as an aid in the diagnosis of chlamydial and gonococcal disease in both symptomatic and asymptomatic individuals.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Specimens cannot be collected and used for Chlamydia/Gonococcus and routine chemistry or urine culture. Chlamydia/Gonococcus NAA requires the use of a first-catch specimen (the initial stream of urine that will wash organisms out of the urethra of men or women). Routine chemistry and bacterial or fungal culture require use of the clean-catch, midstream collection technique.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> Negative results do not exclude the possibility of infection. Interpretation of all results must include clinical evaluation of the patient and other diagnostic procedures. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is intended as an aid in the diagnosis of chlamydial and gonococcal disease in both symptomatic and asymptomatic individuals.
            </p>
            <p class="p3">
              <strong>Detected (either CT, GC, or both):</strong> Positive results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infectious and non-infectious (e.g. latent, treated) organisms. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is intended as an aid in the diagnosis of chlamydial and gonococcal disease in both symptomatic and asymptomatic individuals.
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. The test was performed using qualitative amplification (PCR) method on the cobas&reg; 8800 system and it is FDA approved for in-vitro diagnostic use. This assay is intended as an aid in the diagnosis of chlamydial and gonococcal disease in both symptomatic and asymptomatic individuals.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Qualitative PCR
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'hpv-14-high-risk-panel-plus-genotyping-pcr-high-sensitivity-qualitative-naat',
    code: '1005',
    cpt_codes: ['87625'],
    name: 'HPV (14 High Risk Panel Plus Genotyping) PCR, High-Sensitivity, Qualitative NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              14 High-Risk HPV Genotypes 16, 18, 31, 33, 35, 39, 45, 51, 52, 56, 58, 59, 66, and 68 (HPV-HR)
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Cervical
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Roche 13x75 Secondary Tube with Cap and Preserv-Cyt solution (not provided)
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Cervical specimens collected in PreservCyt&reg; Solution have been validated for use with cobas&reg; HPV. Follow the manufacturer&rsquo;s instructions for collecting cervical specimens
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              2&mdash;30&deg;C up to 3 months
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens - Leaking containers
              </li>
              <li>
                Specimens with syringes or needles attached
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen
              </li>
              <li>
                Mislabeled specimen
              </li>
              <li>
                Transport past stability time or inappropriate temperature
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Routine cervical cancer screening as per professional medical guidelines.
            </p>
            <p class="p3">
              HPV primary screening of women to assess the risk for cervical precancer and cancer (Not approved for men).
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              A negative result does not exclude the possibility of an HPV infection since very low levels of infection or sampling error may produce a false-negative result.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>HR HPV Positive:</strong> Specimen is positive for the DNA of any one of, or combination of, the following high risk HPV types: 16, 18, 31, 33, 35, 39, 45, 51, 52, 56, 58, 59, 66 and 68. cobas&reg; HPV for use on the cobas&reg; 8800 Systems is a qualitative in vitro test for the detection of Human Papillomavirus in clinician-collected cervical specimens. cobas&reg; HPV is indicated for use for routine cervical cancer screening as per professional medical guidelines, including triage of ASC-US cytology, co-testing (or adjunctive screen) with cytology, and HPV primary screening of women to assess the risk for cervical precancer and cancer. This test is not intended for use in determining the needs for treatment in the absence of high-grade cervical dysplasia.
            </p>
            <p class="p3">
              <strong>HR HPV Negative:</strong> HPV types 16, 18, 31, 33, 35, 39, 45, 51, 52, 56, 58, 59, 66 and 68 DNA were undetectable or below the pre-set threshold. cobas&reg; HPV for use on the cobas&reg; 8800 Systems is a qualitative in vitro test for the detection of Human Papillomavirus in clinician-collected cervical specimens. cobas&reg; HPV is indicated for use for routine cervical cancer screening as per professional medical guidelines, including triage of ASC-US cytology, co-testing (or adjunctive screen) with cytology, and HPV primary screening of women to assess the risk for cervical precancer and cancer. This test is not intended for use in determining the needs for treatment in the absence of high-grade cervical dysplasia.
            </p>
            <p class="p3">
              <strong>HR HPV Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. cobas&reg; HPV for use on the cobas&reg; 8800 Systems is a qualitative in vitro test for the detection of Human Papillomavirus in clinician-collected cervical specimens. cobas&reg; HPV is indicated for use for routine cervical cancer screening as per professional medical guidelines, including triage of ASC-US cytology, co-testing (or adjunctive screen) with cytology, and HPV primary screening of women to assess the risk for cervical precancer and cancer. This test is not intended for use in determining the needs for treatment in the absence of high-grade cervical dysplasia.
            </p>
            <p class="p3">
              <strong>GT HPV:</strong> Other HR HPV Positive: Specimen is positive for the DNA of any one of, or combination of the following high risk HPV types: 31, 33, 35, 39, 45, 51, 52, 56, 58, 59, 66 and 68.
            </p>
            <p class="p3">
              <strong>GT HPV 16 Positive:</strong> Specimen is positive for HPV type 16 DNA.
            </p>
            <p class="p3">
              <strong>GT HPV 18 Positive:</strong> Specimen is positive for HPV type 18 DNA.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Human papillomavirus and cervical cancer screening test
              </li>
              <li>
                Detects 14 high risk HPV genotypes 16, 18, 31, 33, 35, 39, 45, 51, 52, 56, 58, 59, 66, and 68 (HPV-HR) and/or 12 high risk genotypes with individual typing of HPV16 and HPV18 simultaneously
              </li>
              <li>
                Qualitative PCR: HPV HR and HPV GT (16, 18, and other HR)
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'covid-rt-pcr-test',
    code: '1006',
    cpt_codes: ['87635'],
    name: 'COVID RT-PCR Test',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              cobas&reg; SARS-CoV-2 EUA:
            </p>
            <ul class="bullet-list">
              <li>
                Use flocked swabs
              </li>
              <li>
                Other swabs are acceptable* EXCEPTIONS: Do not use calcium alginate swabs or swabs with wooden shafts, as they may contain substances that inactivate some viruses and inhibit PCR testing
              </li>
              <li>
                Place swab immediately into a tube containing 1-3 mL of viral transport media (acceptable), universal transport media, buffered saline, NAT VTM
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              12&mdash;24 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Anterior nasal swab
              </li>
              <li>
                Nasopharyngeal swab
              </li>
              <li>
                Oropharyngeal swab
              </li>
              <li>
                Saliva
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL&mdash;4mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Copan Universal Transport Medium BD<sup>&trade;</sup> Universal Viral Transport 0.9&percnt; physiological saline cobas&reg; PCR Media Uni or Dual Swab Sample Kit NAT VTM Kit (Guangzhou Brilliance Medical Technology Co., Ltd)
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                nasal samples in cobas&reg; PCR Media or 0.9&percnt; physiological saline  NP in BPS, NAT VTM, Copan Universal Transport Medium (UTM-RT), BD<sup>&trade;</sup> Universal Viral Transport (UVT)
              </li>
              <li>
                nasopharyngeal, oropharyngeal, in Copan Universal Transport Medium (UTM-RT), BD<sup>&trade;</sup> Universal Viral Transport (UVT) NAT VTM
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                2&mdash;8&deg;C up to 48 hours
              </li>
              <li>
                2&mdash;25&deg;C up to 48 hours
              </li>
              <li>
                -70&deg;C if delivery/processing exceed 48 hours
              </li>
              <li>
                Specimen should be stored at 2&mdash;25&deg;C and processed within 48 hours
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              The cobas&reg; SARS-CoV-2 Test is a qualitative assay that allows the detection of nucleic acids in samples from patients who meet COVID-19 (coronavirus) clinical and/or epidemiological criteria. The tests are for use on the automated, high throughput cobas&reg; 6800/8800 Systems under Emergency Use Authorization.
            </p>
            <p class="p3">
              From the SOP (that is from cobas SARS-CoV-2 - Instructions For Use, <a href="https://www.fda.gov/media/136049/download" rel="noopener" target="_blank">https://www.fda.gov/media/136049/download</a>):
            </p>
            <p class="p3">
              Intended for the qualitative detection of nucleic acids from SARS-CoV-2 in healthcare provider-instructed self-collected anterior nasal (nasal) swab specimens (collected on site), and healthcare provider-collected nasal, nasopharyngeal, and oropharyngeal swab specimens collected from any individuals, including those suspected of COVID-19 by their healthcare provider, and those without symptoms or other reasons to suspect COVID-19
            </p>
            <p class="p3">
              Health care provider and patient fact sheets: <a href="https://diagnostics.roche.com/us/en/products/params/cobas-sars-cov-2-test.html" rel="noopener" target="_blank">https://diagnostics.roche.com/us/en/products/params/cobas-sars-cov-2-test.html</a>.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              This assay is intended for use only under the Food and Drug Administration&rsquo;s Emergency Use Authorization.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> Negative results do not exclude the possibility of infection. Interpretation of all results must include clinical evaluation of the patient and other diagnostic procedures. This SARS-CoV-2 test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. This SARS-CoV-2 test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
            <p class="p3">
              <strong>Detected:</strong> Positive results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infections and non-infectious (e.g. latent, treated) organisms. This SARS-CoV-2 test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
            <p class="p3">
              <strong>Presumptive Positive:</strong> Positive results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infections and non-infectious (e.g. latent, treated) organisms. Presumptive positive indicates a sample at concentrations near or below the limit of detection of the test. This SARS-CoV-2 test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Nasal Swab PCR Test Administered or Self-Administered with observation by a healthcare professional
              </li>
              <li>
                FDA EUA PCR assay developed by r.bio
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'covid-flu-a-b-rt-pcr-test',
    code: '1011',
    cpt_codes: ['87636', '87637', '86769', 'U0003', 'U0005'],
    name: 'COVID + Flu A/B RT-PCR Test',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                SARS-COV-2
              </li>
              <li>
                Influenza A/B
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              24&mdash;72 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Anterior nasal swab
              </li>
              <li>
                Nasopharyngeal swab
              </li>
              <li>
                Oropharyngeal swab
              </li>
              <li>
                Saliva
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              3mL VTM
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              10mL tube
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Collect nasal and nasopharyngeal specimens according to standard collection technique using flocked or polyester-tipped swabs and immediately place in 3 mL of Copan Universal Transport Medium (UTM-RT&reg;) or BDTM Universal Viral Transport (UVT) or equivalent.
            </p>
            <p class="p3">
              Collect nasal specimens according to standard collection technique using flocked or polyester-tipped swabs and immediately place in 3 mL of 0.9&percnt; physiological saline.
            </p>
            <p class="p3">
              Collect nasal specimens using the cobas&reg; PCR Media Uni Swab Sample Kit (P/N 07958030190) or cobas&reg; PCR Media Dual Swab Sample Kit (P/N 07958021190) according to instructions.
            </p>
            <p class="p3">
              Collect nasal specimens according to standard collection technique using flocked or polyester-tipped swabs and immediately place into cobas&reg; PCR Media tube from cobas&reg; PCR Media Kit (P/N 06466281190).
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                2&mdash;25&deg;C up to 48 hours
              </li>
              <li>
                2&mdash;8&deg;C up to 3 days
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
              <li>
                Specimens with syringes or needles attached
              </li>
              <li>
                Specimens that do not contain required information (doctor&rsquo;s name, phone #, diagnosis, etc.)
              </li>
              <li>
                Insufficient quantity of specimen
              </li>
              <li>
                Mislabeled specimen
              </li>
              <li>
                Transport past stability time or inappropriate temperature
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Individuals suspected of respiratory viral infection.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              This assay is intended for use only under the Food and Drug Administration&rsquo;s Emergency Use Authorization.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              <strong>Not Detected:</strong> Negative results do not exclude the possibility of infection. Interpretation of all results must include clinical evaluation of the patient and other diagnostic procedures. This SARS-CoV-2 & Influenza A/B test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 & Influenza A/B in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
            <p class="p3">
              <strong>Invalid:</strong> Invalid due to possible inhibiting or interfering substances. Recollect if clinically indicated. This SARS-CoV-2 & Influenza A/B test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 & Influenza A/B in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
            <p class="p3">
              <strong>Detected (Either SARS-CoV-2, FluA or FluB):</strong> Positive results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infections and non-infectious (e.g. latent, treated) organisms. This SARS-CoV-2 & Influenza A/B test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 & Influenza A/B in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
            <p class="p3">
              <strong>Presumptive Positive (SARS-CoV-2):</strong> Positive results should be interpreted in conjunction with clinical evidence, since this assay does NOT distinguish between infections and non-infectious (e.g. latent, treated) organisms. Presumptive positive indicates a sample at concentrations near or below the limit of detection of the test. This SARS-CoV-2 & Influenza A/B test is a real-time RT-PCR test on the cobas&reg; 8800 system. The FDA has authorized the use of this SARS-CoV-2 &amp; Influenza A/B in vitro diagnostic test by laboratories certified by Clinical Laboratory Improvement Amendments (CLIA) under an emergency use authorization (EUA).
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Influenza A/B Bundle with cobas SAR-CoV-2
              </li>
              <li>
                Multiplex real-time RT-PCR
              </li>
              <li>
                FDA Emergency Use Authorization
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'covid-rt-pcr-qualitative-naat-saliva-direct',
    code: '1007',
    cpt_codes: ['87635'],
    name: 'COVID RT-PCR, Qualitative NAAT (SalivaDirect<sup>&trade;</sup>)',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              No eating, drinking, gum chewing, nasal spray or oral hygiene product use within 30 minutes of collection.
            </p>
            <p class="p3">
              Sample Acceptability: sufficient sample volume, sample received within 72 hours from sample collection date and time (as per identifying information form).
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              24&mdash;48 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Saliva
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              1mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              2mL Hamilton Tube
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Per the SalivaDirect<sup>&trade;</sup> IFU, patients are instructed not to consume drink, food or chew gum or use nasal spray or other oral hygiene products at least 30 minutes prior to sample collection. Saliva production is encouraged by gentle pooling of saliva inside the mouth. Patients are asked to provide at least 0.5 mL saliva, excluding bubbles.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Per the SalivaDirect<sup>&trade;</sup> IFU, keep samples at room temperature during transport and for a maximum of 12 hours from collection to the initial processing period. If samples cannot be processed within 12 hours, store in the fridge (2&deg;C&mdash;8&deg;C) for up to 7 days.
            </p>
            <p class="p3">
              For longer term storage, store samples at -80&deg;C for a maximum of 2 weeks.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Specimens submitted in improper tube or container
              </li>
              <li>
                Unlabeled specimens
              </li>
              <li>
                Leaking containers
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              SalivaDirect<sup>&trade;</sup> is an RNA-extraction free, dual-plexed RT-qPCR method for SARS-CoV-2 detection. Saliva will be treated with proteinase K followed by a heat inactivation step, and is then directly used as input in the dual-plexed RT-qPCR test. It can be broadly implemented as it (1) does not require saliva collection tubes containing preservatives, (2) does not require specialized equipment for RNA extraction, and (3) is validated for use with products from multiple vendors. Thus, the simplicity and flexibility of SalivaDirect<sup>&trade;</sup> means that it is not as affected by supply chain bottlenecks as some other assays.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              copied from SalivaDirect EUA Summary from FDA (<a href="https://www.fda.gov/media/141192/download" rel="noopener" target="_blank">https://www.fda.gov/media/141192/download</a>)
            </p>
            <p class="p3">
              <strong>LIMITATIONS</strong>
            </p>
            <ul class="bullet-list">
              <li>
                Negative results for SARS-CoV-2 RNA from saliva should be confirmed by testing of an alternative specimen type if clinically indicated.
              </li>
              <li>
                Samples should only be pooled when testing volume (demand) exceeds laboratory capacity and/or when testing reagents are in short supply.
              </li>
              <li>
                Sample pooling has only been validated using saliva specimens.
              </li>
              <li>
                The performance of this test was established based on the evaluation of a limited number of clinical specimens. Clinical performance has not been established in all circulating variants but is anticipated to be reflective of the prevalent variants in circulation at the time and location of the clinical evaluation. Performance at the time of testing may vary depending on the variants circulating, including newly emerging strains of SARS-CoV-2 and their prevalence, which change over time.
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''}
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                SalivaDirect<sup>&trade;</sup> PCR self-collected observed or unobserved
              </li>
              <li>
                FDA EUA PCR assay developed by Yale
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  },
  {
    slug: 'renegade-xp-2-rt-pcr-qualitative-naat',
    code: '1008',
    cpt_codes: ['87635'],
    name: 'renegadeXP 2.0, RT-PCR, Qualitative NAAT',
    title: nil,
    shown: true,
    available: true,
    published_at: Time.current,
    characteristics_attributes: [
      # ---------------------------------------------------------------------------
      # Test Specifications
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 1,
        name: 'Test Includes',
        title: 'Includes',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: false,
        order: 2,
        name: 'Special Instructions',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              N/A
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_SPECIFICATIONS,
        shown: true,
        order: 3,
        name: 'Turnaround Time',
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              12&mdash;24 hours
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },

      # ---------------------------------------------------------------------------
      # Specimen Requirements
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 4,
        name: 'Specimen',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Nasal Swab
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 5,
        name: 'Volume',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              1mL VTM
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 6,
        name: 'Container',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              1mL
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 7,
        name: 'Collection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ol class="number-list">
              <li>
                Insert a swab into the nostril parallel to the palate. Leave the swab in place for a few seconds to absorb secretions. Swab both nasopharyngeal areas. Oropharyngeal swab (e.g., throat swab) &mdash; Swab the posterior pharynx, avoiding the tongue.
              </li>
              <li>
                Use only synthetic fiber swabs with plastic shafts.
              </li>
              <li>
                Do not use calcium alginate swabs or swabs with wooden shafts, as they may contain substances that inactivate some viruses and inhibit PCR testing.
              </li>
              <li>
                Place swab immediately  and Swirl  into sterile tubes containing 1 ml of 0.125 xVTM of viral transport media. (NP/OP specimens can be combined, placing both swabs in the same vial.)
              </li>
              <li>
                Remove swabs from 1 mL of 0.125x VTM.
              </li>
              <li>
                Place swab back in the wrapper once swirling is complete
              </li>
            </ol>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 8,
        name: 'Storage Instructions',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Specimens should be kept at a cool, stable temperature during transfer, receipt, and accessioning. They may be kept in Styrofoam boxes lined with ice packs, or refrigerated at 2&mdash;8&deg;C.
            </p>
            <p class="p3">
              Patient specimens can be stored at 2&mdash;8&deg;C for up to 72 hours after collection. If a delay in testing is expected, the specimen may be stored at &lt; &mdash;70&deg;C for no longer than 7 days. Avoid freeze-thaw cycles.
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: true,
        order: 9,
        name: 'Causes for Rejection',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              Primary specimens are rejected if any of the following are observed:
            </p>
            <ul class="bullet-list">
              <li>
                Secondary containment (biohazard bag) is torn, compromised, or absent.
              </li>
              <li>
                Primary specimen is not labeled with at least two patient identifiers (except in unique cases).
              </li>
              <li>
                Patient identifying information on Intake Form does not match the information listed on the primary specimen.
              </li>
              <li>
                Evidence that the primary specimen has leaked, or the specimen is otherwise compromised or deemed unsafe to handle.
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS,
        shown: false,
        order: 10,
        name: 'Sample Stability',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # Test Details
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 11,
        name: 'Use',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              The renegadeXP SARS-CoV-2 RT-PCR Assay is a real-time RT-PCR test intended for the qualitative detection of nucleic acid (RNA) from SARS-CoV-2 (&ldquo;2019-nCoV&rdquo; novel coronavirus) in upper respiratory specimens collected from patients (nasopharyngeal (NP) or anterior nasal swabs).
            </p>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 12,
        name: 'Limitations',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <p class="p3">
              FDA-Emergency Use Only<br>
              In the United States:
            </p>
            <ul class="bullet-list">
              <li>
                This test has not been FDA cleared or approved;
              </li>
              <li>
                This test has been authorized by FDA under an EUA for use by authorized laboratories;
              </li>
              <li>
                This test has been authorized only for the detection of nucleic acid from SARS-CoV-2, not for any other viruses or pathogens; and
              </li>
              <li>
                This test is only authorized for the duration of the declaration that circumstances exist justifying the authorization of the emergency use of in vitro diagnostic tests for detection and/or diagnosis of COVID-19 under section 564(b)(1) of the Act, 21 U.S.C. &sect; 360bbb- 3(b)(1), unless the authorization is terminated or revoked sooner
              </li>
            </ul>
            <p class="p3">
              2. From the SOP (that is from cobas SARS-CoV-2 - Instructions For Use, <a href="https://www.fda.gov/media/136049/download" rel="noopener" target="_blank">https://www.fda.gov/media/136049/download</a>):
            </p>
            <p class="p3">
              Reliable results depend on proper sample collection, storage and handling procedures.
            </p>
            <ul class="bullet-list">
              <li>
                This test is intended to be used for the detection of SARS-CoV-2 RNA in nasal, nasopharyngeal, and oropharyngeal swab samples collected in a Copan UTM-RT System (UTM-RT) or BD<sup>&trade;</sup> Universal Viral Transport System (UVT) and nasal swab samples collected in cobas&reg; PCR Media and 0.9&percnt; physiological saline. Testing of other sample types with cobas&reg; SARS-CoV-2 may result in inaccurate results.
              </li>
              <li>
                Detection of SARS-CoV-2 RNA may be affected by sample collection methods, patient factors (e.g., presence of symptoms), and/or stage of infection.
              </li>
              <li>
                As with any molecular test, mutations within the target regions of cobas&reg; SARS-CoV-2 could affect primer and/or probe binding resulting in failure to detect the presence of virus.
              </li>
              <li>
                False negative or invalid results may occur due to interference. The Internal Control is included in cobas&reg; SARS-CoV-2 to help identify the specimens containing substances that may interfere with nucleic acid isolation and PCR amplification.
              </li>
              <li>
                The performance of this test was established based on the evaluation of a limited number of clinical specimens. The clinical performance has not been established in all circulating variants but is anticipated to be reflective of the prevalent variants in circulation at the time and location of the clinical evaluation. Performance at the time of testing may vary depending on the variants circulating, including newly emerging strains of SARS-CoV-2 and their prevalence, which change over time.
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 13,
        name: 'Disclaimers',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: true,
        order: 14,
        name: 'Methodology',
        title: nil,
        copy_blocks_attributes: [
          { content: '
            <ul class="bullet-list">
              <li>
                Nasal Swab PCR Test Administered or Self-Administered with observation by a healthcare professional
              </li>
              <li>
                PCR assay developed by r.bio
              </li>
            </ul>
          '.strip_heredoc.tr("\n", "") }
        ]
      },
      {
        characteristic_group_id: CharacteristicGroup::TEST_DETAILS,
        shown: false,
        order: 15,
        name: 'Additional Resources',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },

      # ---------------------------------------------------------------------------
      # LOINC Codes
      # ---------------------------------------------------------------------------
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 16,
        name: 'Order Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 17,
        name: 'Order Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 18,
        name: 'Order LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 19,
        name: 'Results Code',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 20,
        name: 'Results Code Name',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 21,
        name: 'UofM',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      },
      {
        characteristic_group_id: CharacteristicGroup::LOINC_CODES,
        shown: false,
        order: 22,
        name: 'Results LOINC',
        title: nil,
        # copy_blocks_attributes: [
        #   { content: ''.strip_heredoc.tr("\n", "") }
        # ]
      }
    ]
  }
]

tests.each do |test_attributes|
  puts ''
  puts '###########################################################################'
  puts "Test Name: "
  puts "#{ap test_attributes[:name]}"
  puts '###########################################################################'
  puts ''

  existing_test = Test.find_by(name: test_attributes[:name])
  existing_test.present? ? existing_test.update!(test_attributes) : Test.create!(test_attributes)
end
