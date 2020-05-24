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

end