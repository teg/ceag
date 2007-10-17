# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def number_to_phone(number, options = {})
    options   = options.stringify_keys
    area_code = options.delete("area_code") { false }
    delimiter = options.delete("delimiter") { "-" }
    extension = options.delete("extension") { "" }
    group_length = options.delete("group_length") { 3 }
    output = []
    number = number.to_s
    while number.length >= 2 * group_length do
        output << number.slice!(0...group_length)
    end
    output << number unless number == ""
    output[0] = "(" + output[0] + ")" if area_code
    output << "x " + extension if extension != ""
    return output.join(delimiter)
  end
  
  def format_position(pos)
    output = []
    if pos.respond_to? :each
      pos.each do |p|
        output << p.position
      end
    else
      output << pos.position
    end
    return output.join("<br />")
  end
  
  def style_if_selected(action)
    if action.include? @controller.params[:action]
      return "background: #fff; color: #000"
    else
      return ""
    end
  end
  
  def flash_here!(*types)
    responce = ''
    types.each do |type|
      responce << "<div id='#{type}'><p>#{image_tag( type.to_s + '.png', :id => type.to_s + '_img')} #{flash[type]}</p></div>" if flash[type]
    end
    return responce
  end
  
  def error_messages_for(object_name, options = {})
    options = options.symbolize_keys
    object = instance_variable_get("@#{object_name}")
    if object && !object.errors.empty?
      content_tag("div",

        content_tag("p", "#{image_tag('warning.png', :id => 'warning_img')}#{object.errors.count.to_s} feil forhindret #{object.to_norwegian} fra å bli opprettet. Følgende felter inneholdt feil:") +
        content_tag("ul", object.errors.full_messages.collect { |msg| content_tag("li", msg) }), 
        "id" => "warning"
       )
       else
      ""
    end
  end
end
