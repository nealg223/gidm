module ApplicationHelper
  
  def logo
    image_tag("logo.png", :alt => "Getup!", :class => "round")
  end
  
  # Return a title on a per-page basis.
  def title 
    base_title = "Get It Done Machine" 
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}" 
    end
  end
end
