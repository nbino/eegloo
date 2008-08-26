# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def is_this_favorites?
    params[:controller] == 'favorites'
  end
  
  def is_this_friends?
    params[:controller] == 'friends'
  end
  
  class ActionView::Helpers::FormBuilder
    def collection_radio(method, collection, options={})
      output = ''
      collection.each {|thing| output += "#{radio_button(method, thing.id, options)} #{thing.name}"}
      output
    end
    
    def yes_no_radio(method, options={})
      output = ''
      output += "#{radio_button(method, true, options)}Yes &nbsp;&nbsp;"
      output += "#{radio_button(method, false, options)}No"
      output
    end
    
  end



  module ActiveSupport::CoreExtensions::Array::Conversions
    def to_sentence_sens_false 
      self.delete nil
      to_sentence
    end
  end
  
  module ActiveSupport::CoreExtensions::Hash::Conversions
    def keys_to_sentence_sens_false_values 
      arr = []
      self.each {|key, value| arr << key if value} 
      arr.to_sentence
    end
  end
  
  def auto_submit(form_name)
    "document.forms['#{form_name}'].onsubmit();"
  end
  
  
  class Object::TrueClass
    def to_yn_s
      'Yes'
    end
  end
  
  class Object::FalseClass
    def to_yn_s
      'No'
    end
  end


  
  
end
