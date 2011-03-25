module DoersHelper
  
  def gravatar_for(doer, options = { :size => 100 })
      gravatar_image_tag(doer.email.downcase, :alt => doer.name,
                                              :class => 'gravatar',
                                              :gravatar => options)
  end
end
