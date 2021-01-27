class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    def set_contact
      @contact = Contact.where(case_id: params[:case_id]).first_or_create
    end

    def contact_params
      params.require(:contact).permit(:title, :first_name, :last_name, :mobile_number, :address)
    end
end
