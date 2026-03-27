{% set apples=['mcintosh',"fuji",'josh krisp'] %}

{% for i in apples %}
  
   {% if i != 'mcintosh' %}
      {{i}}
   {% else %}
     i hate{{i}}
   {% endif %}     

{% endfor %}    