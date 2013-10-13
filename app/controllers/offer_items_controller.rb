class OfferItemsController < ApplicationController
  def create
  	@offer = Offer.find(params[:offer_id])
  	@offer_item = @offer.offer_items.new(params[:offer_item])

    if @offer_item.save
      # redirect_to offer_path(@offer), notice: 'Offeritem was successfully created.'
    else
    	logger.info(@offer_item.errors.to_yaml)
      render "offers/show"
    end
  end

  def edit
    @offer = Offer.find(params[:offer_id])
    @offer_item = OfferItem.find(params[:id])

    @last_offer_item_position = @offer_item.position
  end

  def update
    @offer = Offer.find(params[:offer_id])
    @offer_item = OfferItem.find(params[:id])

    @offer_item.update_attributes(params[:offer_item]) 
    
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

  def sort 
    params[:offer_item_wrapper].each_with_index do |id, index|
      OfferItem.update_all({position: index+1}, {id: id})
      logger.info "=========> " + id
    end
    render nothing: true
  end

end