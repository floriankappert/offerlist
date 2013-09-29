module OffersHelper

	def is_draft(offer)
		"draft" if offer.draft
	end

	def icon(icon)
		case icon
		when "destroy"
		"<span class='glyphicon glyphicon-trash'></span>".html_safe
		when "edit"
		"<span class='glyphicon glyphicon-pencil'></span>".html_safe
		when "show"
		"<span class='glyphicon glyphicon-eye-open'></span>".html_safe
		when "new"
		"<span class='glyphicon glyphicon-plus'></span>".html_safe
		when "back"
		"<span class='glyphicon glyphicon-chevron-left'></span>".html_safe
		else
		"<span class='glyphicon glyphicon-tree-conifer'></span>".html_safe			
		end
	end
end