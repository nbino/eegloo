# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def is_this_favorites?
    params[:controller] == 'favorites'
  end
  
  def is_this_friends?
    params[:controller] == 'friends'
  end
  
  class ActionView::Helpers::FormBuilder
    include ActionView::Helpers::SliderHelper
    def collection_radio(method, collection, options={})
      returning '' do |output|
        collection.each {|thing| output << "#{radio_button(method, thing.id, options)} #{thing.name}"}
      end
    end
    
    def yes_no_radio(method, options={})
      returning '' do |output|
        output << "#{radio_button(method, true, options)}Yes &nbsp;&nbsp;"
        output << "#{radio_button(method, false, options)}No"
      end
    end
    
    def autosubmit_check_box_with_label(method, options={})
      label_text = options.delete(:label)
      check_box(method, options.merge({:onchange => "this.form.onsubmit()"}), (options[:value] || 1) ) <<
      label(method, label_text)
    end
    
    def column_of_autosubmit_checkboxes(*args)
      returning '' do |ouput|
        args.each do |arg|
          method = Array(arg)[0]
          options = Array(arg).extract_options!
          
          ouput << autosubmit_check_box_with_label(method, options)<<
          (options[:delimiter] || '<br/>')
        end
      end
    end

    def slider(method, options)
      returning '' do |output|
        handles = []
        track_element_id = "#{@object_name}_#{method}_track"
        
        output << %@<div id="#{track_element_id}" class="track"><div class="track-left"></div>@
        
        (options.delete(:no_of_handles) || 1).times do |i|
          id = "#{@object_name}_#{method}_handle_#{i}"
          
          output << %@<div id="#{id}" class="sliderHandle"><img src="images/slider-images-handle.png" style="float:left" alt=""/></div>@
          
          handles << id
        end
        output << '</div>' <<
        hidden_field(method) <<        
        slider_element(track_element_id, @template,
          options.merge( {:handles=>handles, 
            :change => "$('#{object_name}_#{method}').value = value;#{options[:change]}",
            :slider_value  => options[:slider_value] || @template.instance_variable_get("@#{@object_name}").send(method) || 0}))
      end
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
  
  def render_dialog(dialog_name, page, lid=nil)
    render :partial=>"shared/dialog", 
      :locals=>{
        :element_id=>"#{dialog_name}_dialog#{lid.nil? ? '' : '_' + lid}", 
        :page=>page, 
        :content=>"listings/#{dialog_name}_dialog"}
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



