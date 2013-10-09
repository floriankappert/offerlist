class OfferItemsController < ApplicationController
  def create
  	@offer = Offer.find(params[:offer_id])
  	@offer_item = @offer.offer_items.new(params[:offer_item])

    if @offer_item.save
      redirect_to offer_path(@offer), notice: 'Offeritem was successfully created.'
    else
    	logger.info(@offer_item.errors.to_yaml)
      render "offers/show"
    end
  end

  def update
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @offer_item = @offer.offer_items.find(params[:id])

    if @offer_item.destroy
      # redirect_to offer_path(@offer), notice: 'Offeritem was successfully deleted.'
    else
      redirect_to offer_path(@offer), notice: 'Offeritem could not be deleted.'
    end
  end
end
