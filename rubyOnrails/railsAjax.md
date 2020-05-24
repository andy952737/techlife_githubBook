# Rails Ajax

# controller 
```
skip_before_action :verify_authenticity_token

def update  
      @select_code = params[:id]
end
```

# Views
```
<%= form_tag(home_path(1), remote: true, method: :put,class: 'form-horizontal') do %> 
    <%= select_tag :select_code, options_for_select([ "VISA", "MasterCard" ], "MasterCard"), onchange: 'select_id();'%>
<% end %> 
<%= link_to home_path(1), remote: true, method: :put do %>test_link<% end %> 
 
<hr>
<div class="eo_id">....</div> 


<!-- Test jquery links -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>     
/* #:onchange => 'this.form.submit();'*/
function select_id(value) {        
$.ajax({  
  type : 'PUT',    
  data : {   
      s_id : value 
  },
  url : "<%= home_path(1) %>"
});
}
</script>  
```

# Ex. update.js.erb
```	
$(".eo_id").replaceWith("<%= @select_code %>")   
```
