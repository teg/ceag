# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_phone(number, options = {})
    options = options.stringify_keys
    delimiter = options.delete("delimiter") {"<br />\n"}
    output = []
    if number.respond_to? :each
      number.each do |n|
        output << number_to_phone(n,:delimiter=>" ",:group_length=>2)
      end
    else
      output << number_to_phone(number,:delimiter=>" ",:group_length=>2)
    end
    return output.join(delimiter)
  end
  
  
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
        output << p
      end
    else
      output << pos
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
      responce << "<div class='#{type}'><p>#{image_tag( type.to_s + '.png', :class => type.to_s + '_img')} #{flash[type]}</p></div>" if flash[type]
    end
    return responce
  end
end
