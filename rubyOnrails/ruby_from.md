# Ruby from application

# HTML+Ruby
>
```
<%= token_tag nil %>  

<select name="city_id" id="city_id">
  <option value="1">Lisbon</option>
  <option value="2">Madrid</option>
  <option value="12">Berlin</option>
</select>
<%= select_tag(:city_id, '<option value="1">Lisbon</option>...’) %>
<%= options_for_select([['Lisbon', 1], ['Madrid', 2], ...]) %>
``` 

