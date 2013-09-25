module OffersHelper

	def is_draft(offer)
		"draft" if offer.draft
	end

end
