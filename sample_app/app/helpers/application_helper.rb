module ApplicationHelper
	# returns page tile of the per-page basis
	def full_title(page_title = '')
		base_title = "default title"
		return base_title if page_title.empty? 
		return page_title + " | " + base_title
	end
end
