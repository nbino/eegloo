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
    
    def check_box_x(method, options={}, value = 1, label_text=nil)
      check_box method, options.merge({:onchange => "this.form.onsubmit()"}), value <<
      label.nil? ? label(method) : label(method label_text)
    end
    
    def gen_checkboxes(*args)
      args.each do |arg|
        check_box_x arg unless arg.kind_of?(Array)
        check_box_x arg[0], {}, arg[1], arg[2] if arg.kind_of?(Array)
      end
    end
    
    
      	
  end				

  def slider(model, method, options)
    output  = ''
    handles = []
    
    output << %@<div id="track_#{method}" class="track" style="position:relative; width:100%; height : 20px;">@
    
    no_of_handles = options.include?(:no_of_handles) || 1

    options.delete :no_of_sliders
    
    no_of_handles.times do |i|
      id = "handle_#{i}_#{method}"
      
      output << <<-GOATS
      <span id="#{id}" class="sliderHandle">
        <img src="images/slider-images-handle.png;float:left" alt=""/>
      </span>
      GOATS
      
      handles << id
    end
    
    output << slider_field(model, 
      method, 
      options.merge({
        :handles=>handles, 
        :track=>"track_#{method}"}))
    
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
