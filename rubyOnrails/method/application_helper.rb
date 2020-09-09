module ApplicationHelper

	def money(credit, currency)
        number_to_currency( credit*1.0/currency.cents, currency.attributes )
    end
  
    def status_type(int) 
        case int
        when 1
            i = "產品圖示"
            return i
        when 2
            i = "SlideShow圖示"
            return i
        end  
    end

    def get_Active(ac)
        if ac.to_i == 1
            return "active"
        end
    end   

    def publice_status(boolean)
        case boolean
        when true
            return '公開'
        when false
            return '不公開'
        end 
    end

    def publice_status_v2(string)
        case string 
        when '已公開' 
            return 5
        when '未公開'
            return 10
        when '封鎖' 
            return 15
        when '密碼'
            return 20
        end
    end

    def broadcast(channel, &block)
        message = {:channel=>channel, :data=> capture(&block), :ext=>{:auth_token => FAYE_TOKEN}}
        uri = URI.parse("#{request.protocol+request.host}:9292/faye")
        Net::HTTP.post_form(uri, :message=>message.to_json)
    end

    def get_username(user)
        u = User.find(user).username
        return u
    end

    def get_user_friendly(user) 
        u = User.find_by(friendly_id: user).username
        return u
    end

    def api_time(time)
        (time.to_f*1000).round
    end

    def current_translations 
      @translations ||= I18n.backend.send(:translations)
      @translations[I18n.locale].with_indifferent_access
    end

    def app_path(device, app = "to_b")
        if app == "to_b"
            if device == "ios"
                "https://itunes.apple.com/tw/app/id1081419207?mt=8"
            elsif device == "android"
                "https://play.google.com/store/apps/details?id=com.eyehouse.vr"
            end
        elsif app == "to_c"
            if device == "ios"
                "https://itunes.apple.com/tw/app/vrsynchome/id1191324989?mt=8"
            elsif device == "android"
                "https://play.google.com/store/apps/details?id=com.eyehouse.vr.toc"
            end
        end
    end

    #for debug
    def debug_mode
        @debug_mode ||= request.url.include?("debug=#{debug_code}")
    end

    def debug_code
        @debug_code ||= Date.today.to_s.gsub("-","")
    end


    #for time
    def time_format1(time) 
        d_day = (Date.today - time.to_date).to_i
        if d_day == 0
            duration = Time.now.to_i - time.to_i
            hours = duration/3600
            if hours >= 2
                return "#{hours}小時前"
            else
                mins = duration/60
                return "#{mins}分鐘前"
            end
        elsif d_day == 1
            return time.strftime("昨天 %X")
        elsif d_day == 2
            return time.strftime("前天 %X")
        else
            return time.strftime("%m/%d %X")
        end
    end

    def time_format3(time)
        time_now = Time.now.to_i
        delta = time_now - time.to_i
        if delta < 3600
            "#{(delta.to_f/60).ceil}#{I18n.locale == :"zh-TW" ? "分鐘前" : " mins ago"}"
        elsif delta < 24 * 3600
            "#{(delta/3600).floor}#{I18n.locale == :"zh-TW" ? "小時前" : " hours ago"}"
        elsif delta < 30 * 24 * 3600
            "#{(delta/24/3600).floor}#{I18n.locale == :"zh-TW" ? "天前" : " days ago"}"
        elsif delta < 365 * 24 * 3600
            "#{(delta/30/24/3600)}#{I18n.locale == :"zh-TW" ? "個月前" : " months ago"}"
        elsif delta < 10 * 365 * 24 * 3600
            "#{(delta/365/24/3600)}#{I18n.locale == :"zh-TW" ? "年前" : " years ago"}"
        else
            "#{time.year}/#{time.month}/#{time.day}"
        end
    end

#fb_ad
    def fb_landing_og_path
        request.base_url + "/?fb"
    end

    def fb_ad_path
        path = Dir.glob("public/images/layout_head/fb_ad/*")[0]
        if path.present?
            path = request.base_url + path.sub("public","")
        end 
    end

    def fb_ad_folder
        "public/images/layout_head/fb_ad/"
    end

#for meta og
    def fb_app_id
        @app_id ||= Rails.application.config_for(:facebook)["app_id"]
    end

    def og_image_url
        @og_image_url ||= Brand.og_image_url
        @og_image_url
    end

    def og_title
        @og_title ||= Brand.title_name
    end

    def og_description
        @og_description ||= Brand.description_name
    end

    def og_keywords
        @og_keywords ||= "Eyehouse, 360VR分享平台, panoramic, 房地產, 旅遊, 空拍, 線上帶看"
    end

#canonical
    def next_page_url
        #require variable @page
        if @page.nil?
            return ""
        end

        url = request.url
        if url.include?("?")
            key = "page=#{@page}"
            if url.include?(key)
                r = url.gsub(key,"page=#{@page + 1}")
            else
                r = "#{url}&page=#{@page + 1}"
            end
        else
            r = "#{url}?page=#{@page + 1}"
        end
        @next_page_url ||= r
    end

    def prev_page_url
        #require variable @page
        if @page.nil?
            return ""
        end

        url = request.url
        if url.include?("?")
            key = "page=#{@page}"
            if url.include?(key)
                r = url.gsub(key,"page=#{@page - 1}")
            else
                r = "#{url}&page=#{@page - 1}"
            end
        else
            r = "#{url}?page=#{@page - 1}"
        end
        @prev_page_url ||= r
    end

#convert price
    def locale_price(price)
        if I18n.locale == :"zh-TW"
            return "#{price} 萬"
        else
            return "NTD #{(price.to_i * 10000).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
        end
    end

    def locale_area(area)
        if I18n.locale == :"zh-TW"
            return "#{area} 坪"
        else
        meter_sq_to_ping = 0.3025
            return "#{(area.to_f / meter_sq_to_ping).round(2) } sq. m"
        end
    end

    def locale_price_area(price_area)
        if I18n.locale == :"zh-TW"
            return "#{price_area}萬元/坪"
        else
        meter_sq_to_ping = 0.3025
            return "#{(price_area.to_i * 10000) * meter_sq_to_ping } NTD/sq.m"
        end
    end

    def convert_locale_hash(hash, language = nil)
        l = language.present? ? language : locale
        hash.map{|a,b| [a,b[(l == :"zh-TW") ? :tw : :en].try(:html_safe)]}.to_h
    end

    #下拉式選單驗證
    def get_selected(a,b) 
        if a.to_s == b.to_s
        return 'selected'
        end
    end 

    #成功接聽次數_精簡
    def host_page_voice_check(number)
        n = number / 2 
        return n
    end

end