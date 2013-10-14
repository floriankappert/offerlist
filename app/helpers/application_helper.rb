module ApplicationHelper
  
   def sortable(column, title = nil)
    title ||= column.titleize
    reference = sort_column
    reference = "name" if reference == "lower(name)"
    css_class = column == reference ? "current #{sort_direction}" : nil
    direction = column == reference && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
