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
      collection.each {|thing| output << "#{radio_button(method, thing.id, options)} #{thing.name}"}
      output
    end
    
    def yes_no_radio(method, options={})
      output = ''
      output += "#{radio_button(method, true, options)}Yes &nbsp;&nbsp;"
      output += "#{radio_button(method, false, options)}No"
      output
    end
    
    def autosubmit_check_box_with_label(method, options={}, label_text=nil, value = 1)
      check_box(method, options.merge({:onchange => "this.form.onsubmit()"}), value ) <<
      label(method, label_text)
    end
    
    def column_of_autosubmit_checkboxes(*args)
      ouput = ''
      args.each do |arg|
        ouput << (arg.kind_of?(Array) ? autosubmit_check_box_with_label(arg[0], {}, arg[1], arg[2]) : autosubmit_check_box_with_label(arg)) << '<br/>'
      end
      ouput
    end
  end				

  def slider(model, method, options)
    output  = ''
    handles = []
    
    output << %@<div id="#{model}_#{method}_track" class="track"><div class="track-left"></div>@
    
    no_of_handles = options.include?(:no_of_handles) || 1

    options.delete :no_of_handles
    
    no_of_handles.times do |i|
      id = "#{model}_#{method}_#{i}_handle"
      
      output << %@<div id="#{id}" class="sliderHandle"><img src="images/slider-images-handle.png" style="float:left" alt=""/></div>@
      
      handles << id
    end
    
    output << '</div>' << slider_field(model, 
      method, 
      options.merge({
        :handles=>handles}))
    
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
