class ContactsController < ApplicationController
  # Includes
  # ==========================================================================================================
    include PermittedParams::ContactAttributes

  # Action Filters
  # ==========================================================================================================
    # before_action :set_contact, only: %i[ show edit update destroy ]

  # Constants
  # ==========================================================================================================

  # CRUD Actions
  # ==========================================================================================================

    # GET /contacts or /contacts.json
    # def index
    #   @contacts = Contact.by_contentable_type(contact_params[:contentable_type])

    #   render jsonapi: @contacts
    # end

    # GET /contacts/1 or /contacts/1.json
    # def show
    #   render jsonapi: @contact
    # end

    # # GET /contacts/new
    # def new
    #   @contact = Contact.new
    # end

    # # GET /contacts/1/edit
    # def edit
    # end

    # POST /contacts or /contacts.json
    def create
      # respond_to do |format|
      #   if @contact.save
      #     format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
      #     format.json { render :show, status: :created, location: @contact }
      #   else
      #     format.html { render :new, status: :unprocessable_entity }
      #     format.json { render json: @contact.errors, status: :unprocessable_entity }
      #   end
      # end

      # auto_reply = true
      # conversation_subject = 'Contact us form', # contact_params[:subject]
      # conversation_type = 'email' # chat || email || phone
      # conversation_status = 'pending' # active || closed || pending
      # created_at = Time.current.in_time_zone('America/Los_Angeles').to_datetime.iso8601
      # tags = []

      # customer = {
      #   first_name: contact_params[:first_name],
      #   last_name: contact_params[:last_name],
      #   email: contact_params[:email]
      # }

      # thread = {
      #   type: 'reply',
      #   customer: {
      #     email: customer[:email]
      #   },
      #   text: contact_params[:message]
      # }

      # conversation = {
      #   subject: conversation_subject,
      #   customer: customer,
      #   mailboxId: ENV['HELP_SCOUT_CONTACT_FORM_MAILBOX_ID'],
      #   type: conversation_type,
      #   status: conversation_status,
      #   createdAt: created_at,
      #   autoReply: auto_reply,
      #   threads: [thread],
      #   # tags: tags,
      #   # fields: [{
      #   #   id: 531,
      #   #   value: 'trial'
      #   # }]
      # }

      # # Helpscout::Conversation.list
      # location = HelpScout::Conversation.create(conversation)
      # conversation = HelpScout::Conversation.get(location.split("/").last)
      # conversation.update("replace", "/subject", "New Subject")

      Rails.logger.debug ''
      Rails.logger.debug '***************************************************************************'
      Rails.logger.debug "#{self.class.name} - #{__method__} - contact_params:"
      Rails.logger.debug "#{ap contact_params}"
      Rails.logger.debug '***************************************************************************'
      Rails.logger.debug ''

      respond_to do |format|
        begin
          response = HelpScoutService.create_conversation(contact_params)
        rescue => exception
          message = "An error occurred while attempting to process the form: #{exception}"
          # options = {
          #   custom_params: {
          #     message: message,
          #     class: self.class.name,
          #     method: __method__,
          #     contact_params: contact_params
          #   }
          # }

          # NewRelic::Agent.notice_error(exception, options)

          if ENV.fetch('RUN_AS_ENV') { 'staging' } != 'production'
            Rails.logger.debug ''
            Rails.logger.debug '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
            Rails.logger.debug "#{self.class.name} - #{__method__} - #{message}"
            Rails.logger.debug '==========================================================================='
            Rails.logger.debug "#{self.class.name} - #{__method__} - contact_params:"
            Rails.logger.debug "#{ap contact_params}"
            Rails.logger.debug '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
            Rails.logger.debug ''
          end

          format.json { render json: { message: message, errors: exception }, status: :unprocessable_entity }
        else
          format.json { render json: { message: 'Success', conversation: response }, status: :ok }
        end
      end
    end

    # # PATCH/PUT /contacts/1 or /contacts/1.json
    # def update
    #   respond_to do |format|
    #     if @contact.update(contact_params)
    #       format.html { redirect_to contact_url(@contact), notice: "Contact was successfully updated." }
    #       format.json { render :show, status: :ok, location: @contact }
    #     else
    #       format.html { render :edit, status: :unprocessable_entity }
    #       format.json { render json: @contact.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # DELETE /contacts/1 or /contacts/1.json
    # def destroy
    #   @contact.destroy

    #   respond_to do |format|
    #     format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
    #     format.json { head :no_content }
    #   end
    # end

  # Non-CRUD / Custom Actions
  # ==========================================================================================================

  # **********************************************************************************************************
  # -------------------------------------------- PRIVATE METHODS ---------------------------------------------
  # **********************************************************************************************************
    private

    # Use callbacks to share common setup or constraints between actions.
    # def set_contact
    #   @contact = Contact.friendly.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(PERMITTED_PARAMS_CONTACT)
    end
end
