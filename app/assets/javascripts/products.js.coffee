# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
   $('#submit_product').live 'click', (e)  =>
      product_name = $("#product_product_name").attr 'value'
      product_category = $("#product_category").attr 'value'
      product_location = $("#product_location").attr 'value'
      product_service = $("#product_service").attr 'value'
      product_price = $("#product_price").attr 'value'
      product_price_id= $("#product_price")
      numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;
      if (product_name == '')
         alert "Please enter product name."
         e.preventDefault()
      else if (product_category == '')
         alert "Please select an category."
         e.preventDefault()
      else if (product_location  == '')
         alert "Please enter a location."
         e.preventDefault()
      else if (product_service  == '')
         alert "Select service"
         e.preventDefault()
      else if (product_price  == '')
         alert "Please enter the price of product."
         e.preventDefault()
      else if ((!numericReg.test(product_price_id.val())))
         alert "Please enter the valid price of product."
         e.preventDefault()
      else
       $(this).activate();

   $("#add_product").live 'click',(e) =>
       $("#popup_add_product").attr 'style','visibility:visible'
       e.preventDefault();

   $("#popup_closed").live 'click',(e) =>
       $("#popup_add_product").attr 'style','visibility:hidden'
       e.preventDefault();
   $("#popup_close").live 'click',(e) =>
       $("#popup_add_product").attr 'style','visibility:hidden'
       e.preventDefault();

#   $("#product_expendable").live 'click', (e)  =>
#     check_box = $("#product_expendable").attr 'value'
#     expendable_price = $("#product_expendable_price").attr 'value'
#     alert(expendable_price);
#     if (check_box == "true")
#      $("#product_expendable").attr 'value',false
#      alert(check_box)
#      alert(expendable_price);
#      daily_rate = $("#product_daily_rate").attr 'value',expendable_price
#      weekly_rate = $("#product_weekly_rate").attr 'value',expendable_price
#      weekend_rate = $("#product_weekend_rate").attr 'value',expendable_price
#      late_fee = $("#product_late_fee").attr 'value',expendable_price
##      alert(daily_rate);
#     else if(check_box == "false")
#         alert check_box
#         $("#product_expendable").attr 'value',true
#         $("#product_daily_rate").attr 'value',""
#         $("#product_weekly_rate").attr 'value',""
#         $("#product_weekend_rate").attr 'value',""
#         $("#product_late_fee").attr 'value',""
#


   jQuery ->
    select_cgy = $("#category_subcategory")
    select_cgy.live 'change', (e)  =>
     selection_cgy = $('#category_subcategory :selected').text();
     $.ajax
         url:"/products/show_sub_category?cat_value=" + selection_cgy
         type: 'POST'
         datatype: 'text'
         cache:false
         success: (data) ->


    select = $("#product_category")
    select.change ->
     selection = select.val()
     $("#show_category_field").attr('value',selection)


    select = $("#product_service")
    select.change ->
     selection = select.val()
     $("#show_service_field").attr('value',selection)


    select = $("#product_category")
    select.live 'change', (e) ->
      selection = select.val()
      $.ajax
         url:"/products/show_category?cat_value=" + selection
         type: 'POST'
         datatype: 'text'
         cache:false
         success: (data) ->
      e.preventDefault()


