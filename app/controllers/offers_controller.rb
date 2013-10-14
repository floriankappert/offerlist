class OffersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @offers = Offer.order(sort_column + ' ' + sort_direction).paginate(:page => params[:offers_page])
    @drafts = Offer.draft.order(sort_column + ' ' + sort_direction).paginate(:page => params[:drafts_page])
  end

  def index_remote
    @offers = Offer.where("lower (company) like ?", "%#{params[:term]}%").group("company").select("company, count(1) as total")
    render json: @offers.map{|x| {:company => x.company, :total => x.total}}
  end

  def show
    @offer = Offer.find(params[:id])

    @offer_item = OfferItem.new
    
    if @offer.offer_items.count > 0
      @last_offer_item_position = @offer.offer_items.maximum(:position) + 1 
    else
      @last_offer_item_position = 1      
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer}
    end
  end

  def search 
    @offers = Offer.where("lower (company) like ?", params[:q].downcase)
  end

  def new
    @offer = Offer.new
    @offer.offer_date = Time.now
    @offer.offer_due_date = Time.now + 14.days
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def activate 
    @offer = Offer.find(params[:id])
    @offer.draft = false

    if @offer.save
      msg = 'Offer was successfully activated.'
    else
      msg = 'Offer could not be activated.'
    end

    redirect_to offer_path, notice: msg 
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

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html {redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render json: @offer}
      else
        format.html {render action: "edit" }
        format.json {respond_width_bip(@offer)}
      end
    end
  end

  def destroy 
    @offer = Offer.find(params[:id])
    @offer.data_deleted = true

    if @offer.save
      msg = 'Offer was successfully deleted.'
    else
      msg = 'Offer could not be deleted.'
    end

    redirect_to offers_path, notice: msg  
  end

  private
  def sort_column
    Offer.column_names.include?(params[:sort]) ? params[:sort] : "offer_number"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
end
