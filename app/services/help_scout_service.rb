class HelpScoutService
  # HelpScoutService.create_conversation({
  #   first_name: 'John',
  #   last_name: 'Doe',
  #   email: 'contact_form_test@renegade.bio',
  #   message: 'This is a test of the "Contact Us" form API.'
  # })

  def self.create_conversation(params)
    # "Constants"
    auto_reply = true
    mailbox_id = ENV.fetch('HELP_SCOUT_CONTACT_FORM_MAILBOX_ID')
    conversation_subject = 'Contact us form'
    conversation_type = 'email' # Options: chat || email || phone
    conversation_status = 'pending' # Options: active || closed || pending

    # Unused / Optional Params
    # created_at = Time.current.in_time_zone('America/Los_Angeles').to_datetime.iso8601
    # tags = []
    # fields = []

    # Required
    customer_params = {
      first_name: params[:firstName],
      last_name: params[:lastName],
      email: params[:email]
    }

    subject = "#{conversation_subject} - #{params[:subject]}"

    # Optional
    customer_params[:job_title] = params[:role] if params[:role].present?
    customer_params[:organization] = params[:organization] if params[:organization].present?

    thread_params = {
      type: 'customer', # Options: note || chat || phone || reply || customer
      customer: {
        email: customer_params[:email]
      },
      text: params[:message]
    }

    conversation_params = {
      subject: subject,
      customer: customer_params,
      mailbox_id: mailbox_id,
      type: conversation_type,
      status: conversation_status,
      auto_reply: auto_reply,
      threads: [thread_params]
    }

    Rails.logger.debug ''
    Rails.logger.debug '***************************************************************************'
    Rails.logger.debug "#{self.name} - #{__method__} - conversation_params:"
    Rails.logger.debug "#{ap conversation_params}"
    Rails.logger.debug '***************************************************************************'
    Rails.logger.debug ''

    camelized_conversation_params = conversation_params.deep_transform_keys { |key| key.to_s.camelize(:lower) }

    # Helpscout::Conversation.list

    Rails.logger.debug ''
    Rails.logger.debug '***************************************************************************'
    Rails.logger.debug "#{self.name} - #{__method__} - camelized_conversation_params:"
    Rails.logger.debug "#{ap camelized_conversation_params}"
    Rails.logger.debug '---------------------------------------------------------------------------'
    Rails.logger.debug "#{self.name} - #{__method__} - camelized_conversation_params.to_json:"
    Rails.logger.debug "#{ap camelized_conversation_params.to_json}"
    Rails.logger.debug '***************************************************************************'
    Rails.logger.debug ''

    conversation = HelpScout::Conversation.create(conversation_params)

    Rails.logger.debug ''
    Rails.logger.debug '***************************************************************************'
    Rails.logger.debug "#{self.name} - #{__method__} - conversation:"
    Rails.logger.debug "#{ap conversation}"
    Rails.logger.debug '***************************************************************************'
    Rails.logger.debug ''

    # conversation = HelpScout::Conversation.get(location.split('/').last)
    # conversation.update('replace', '/subject', 'New Subject')

    # return
    conversation
  end
end
