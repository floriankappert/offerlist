module OffersHelper

	def is_draft(offer)
		return raw("class='draft'") if offer.draft == true
		return ""
	end

end
