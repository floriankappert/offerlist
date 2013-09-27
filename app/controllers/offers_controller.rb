class OffersController < ApplicationController
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.paginate(:page => params[:page], :per_page => 20, :order => 'offer_number DESC')
    @drafts = Offer.draft
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(params[:offer])

    if @offer.save
      redirect_to offers_path, notice: 'Offer was successfully created.'
    else
      render action: "new"
    end
    
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(params[:offer])
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to offers_url
    
  end
end
