module ListingsHelper

def render_dialog(dialog_name, page, lid)
  render :partial=>"shared/dialog", 
    :locals=>{
      :element_id=>"#{dialog_name}_popup#{lid.nil? ? '' : '_' + lid}", 
      :page=>page, 
      :content=>"listings/#{dialog_name}_content"}
end  


end
