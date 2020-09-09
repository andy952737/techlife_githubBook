module FormHelper

	def breadcrumbs(links)
		l = links.map do |link|
		  "<a href='#{link[:url]}' style='display:inline; width: auto;'>#{link[:name]}</a>"
		end
		return l.join("<span style='margin: 0 5px'>></span>").html_safe
	end

	def date_input(e)
		name = e[:name]
		value = e[:value]
		class_name = e[:class_name]
		style = e[:style]
		html = "<input t=\"text\" name='#{name}' class='#{class_name}' value='#{value}' style='#{style}' evt-onInit='$(this).datepicker({beforeShow: function(a,b){ $(b.dpDiv).css(\"font-size\", \"12px\");}, dateFormat: \"yy-mm-dd\", changeMonth: true, changeYear: true, yearRange:\"1950:2030\"});' autocomplete=\"off\">"
		return html.html_safe
	end

	def date_field_tag(name, value, option={})
		html = "<input t=\"text\" name='#{name}' class=\"#{option[:class]} date_picker\" value='#{value}' style=\"#{option[:style]}\">"
		return html.html_safe
	end	

	def submit_button(name, option={})
		option[:class] = option[:class] || ""
		option[:class] += "#{option[:class]} lh4 ph2 "
		case option[:type]
		when 1
			option[:class] += "btnBg_1"
		when 2
			option[:class] += "btnBg_2"
		when 3
			option[:class] += "btnBg_3"
		when 4
			option[:class] += "btnBg_4"
		end
		r = "<div class='button #{option[:btn_class]||''}'>"
		r +=  "<input type=\"submit\" class=\"#{option[:class]}\" value=\"#{name}\">"
		r += "</div>"
		r.html_safe		
	end

	def button_link_to(name, link, option = {})
		option[:class] = "#{option[:class]} lh4 ph2 "
		option[:type] = option[:type] || 1
		if option[:type]
			option[:class] += "btnBg_#{option[:type]}"
		end
		r = "<div class='button #{option[:btn_class]}'>"
		r += link_to name.html_safe, link, option
		r += "</div>"
		r.html_safe
	end

	def form_table(table)
		t = "<table>"
		table.each do |tr|
			t += "<tr>"
			t += "  <td>#{tr[:title]}</td>"
			t += "  <td>#{tr[:input]}</td>"
			t += "</tr>"
		end
		t += "</table>"
		t.html_safe
	end

	def lightbox(id, option={}, &block)
		show_event_name = option[:show_event_name] || "show_#{id}"
		hide_event_name = option[:hide_event_name] || "hide_#{id}"
		max_width = option[:max_width]
		r = ""
		r += "<div id=\"#{option[:id]}\" class=\"lightbox_v3 fs7 colorGy2\""
		r += " evt-#{show_event_name}=\"$('body').css('position','fixed'); $(this).addClass('select');\""
		r += " evt-#{hide_event_name}=\"$('body').css('position','static'); $(this).removeClass('select');\""
		r += "  >"
		r += "  <div class=\"inbox\" style=\"#{"max-width: #{max_width}" if max_width.present?}\">"
		if option[:wo_close_btn] != 1
			r += "  	<div class=\"close_btn\">"
			r += "  	 <a href=\"#close_#{option[:id]}\" class=\"icon icon_close\" onclick=\"event.preventDefault(); $('##{option[:id]}').callEvt('#{hide_event_name}');\"></a>"
			r += "  	</div>"
		end
		if option[:title].present?
   	  r += "<div class=\"header_box borderB\">"
   	  r += "  <div class=\"title\">#{option[:title].html_safe}</div>"
   	  r += "</div>"
   	end
    r += " 	 <div class=\"content_box pv2 mt2 mb2\">"
    r += capture(&block)
    r += "   </div>"
    r += "  </div>"
		r += "</div>"
		r.html_safe
	end

	def lightbox1(id, option={}, &content_block)
		max_width = option[:max_width]
		r = ""
		r += "<div id=\"#{id}\" class=\"lightbox_v3 select fs7 colorGy2\">"
		r += "  <div class=\"inbox\" style=\"#{"max-width: #{max_width}" if max_width.present?}\">"
		if option[:wo_close_btn] != 1
			r += "  	<div class=\"close_btn\">"
			r += "  	 <a href=\"#close_#{option[:id]}\" class=\"icon icon_close\" onclick=\"event.preventDefault(); $('##{id}').remove();\"></a>"
			r += "  	</div>"
		end
		if option[:title].present?
   	  r += "<div class=\"header_box borderB\">"
   	  r += "  <div class=\"title\">#{option[:title].html_safe}</div>"
   	  r += "</div>"
   	end
    r += " 	 <div class=\"content_box pv2 mt2 mb2\">"
    r += capture(&content_block)
    r += "   </div>"
    r += "  </div>"
		r += "</div>"
		r.html_safe		
	end

	def select_field_tag(name, value, options, option={})
		s = ""
		s += "<select name=\"#{name}\" class=\"#{option[:class]}\" onchange=\"#{option[:onchange]}\" id=\"#{option[:id]}\" style=\"#{option[:style]}\" #{"disabled='true'" if option[:disabled] == true} >"
		s += "<option value=\"\">#{option[:all]}</option>" if option[:all].present?
		options.each do |v, t|
			s += "<option value=\"#{v}\" #{"selected" if v.to_s == value.to_s}>#{t||v}</option>"
		end 
		s += "</select>"
		s.html_safe
	end


	def radio_field_tags(name, value, options, option={})
		s = ""
		if option[:all].present?
			s += "<label class=\"#{option[:label_class]} radio_field\">"
			s += radio_button_tag name, nil, value.nil?, id: "#{name}_0".gsub("[", "_").gsub("]","")
			s += option[:all]
			s += "</label>"
		end
		index = 1
		options.each do |v, t|
			s += "<label class=\"#{option[:label_class]} radio_field\">"
			s += radio_button_tag name, v, value.to_s == v.to_s, id: "#{name}_#{index}".gsub("[", "_").gsub("]","")
			s += (t||v).to_s
			s += "</label>"
			index += 1
		end
		s.html_safe
	end

	def check_box_field_tags(name, values, options, option={})
		s = ""
		index = 1
		options.each do |v, t|
			s += "<label class=\"#{option[:label_class]} checkbox_field\">"
			s += check_box_tag name, v, values.map{|s| s.to_s}.include?(v.to_s), id: "#{name}_#{index}".gsub("[", "_").gsub("]","")
			s += (t||v).to_s
			s += "</label>"
			index += 1
		end
		s.html_safe
	end

	def ckeditor_text_field(name, value, option={})
		option[:class] = "main_ckeditor_text #{option[:class]}"
		option[:data] ||= {}
		option[:data][:width] ||= "600px"
		option[:data][:height] ||= 300
		option[:data][:uploadurl] ||= (adm_main_post_images_path + "?")
		# option[:data][:browseurl] ||= nil
		text_area_tag(name, value, option)
	end

end

