// $("input[name='list_item_price'").change(function({

// });
function setDefaultPrices() {

  var regular_normal=$('*[data-type="regular_license_price"]');
  regular_normal.val(regular_normal.attr('data-default_price'));
  $('#regular_license_price').text(regular_normal.attr('data-default_price'));

  var extended_normal=$('*[data-type="extended_license_price"]');
  extended_normal.val(extended_normal.attr('data-default_price'));
  $('#extended_license_price').text(extended_normal.attr('data-default_price'));

  var commercial_normal=$('*[data-type="commercial_license_price"]');
  commercial_normal.val(commercial_normal.attr('data-default_price'));
  $('#commercial_license_price').text(commercial_normal.attr('data-default_price'));

}

$(document).ready(function(){
    $("input[name='list_item_price'").change(function(){
      $('#SupportAdd').prop('checked', false);

        

        var get_selected_license=$('input[name=list_item_price]:checked', '#license_list').attr("data-type");

        $('._mod_total').text(this.value);
        $('#item_price').val(this.value);
        // console.log($('#buy_license_type').val());
        if (get_selected_license=='regular_license_price') {
          $('#pop_license_type').val(1);
          $('#buy_license_type').val(1);
          $('#support_text').text('Regular');

          setDefaultPrices();
           
        }
        if (get_selected_license=='extended_license_price') {
          $('#pop_license_type').val(2);
          $('#buy_license_type').val(2);
          $('#support_text').text('Extended');

          setDefaultPrices();
        }
        if (get_selected_license=='commercial_license_price') {
          $('#pop_license_type').val(3);
          $('#buy_license_type').val(3);
          $('#support_text').text('Commercial');

          setDefaultPrices();

        }
        var support_fees=$('#support_fees').val();
        var item_support_fees=support_fees/100*this.value;
        var item_support_fees=item_support_fees.toFixed(2);

        
        $('#show_support_price').text(item_support_fees);
        $('#SupportAdd').val(item_support_fees);
        console.log(get_selected_license);
    });

    $("#SupportAdd").change(function(){
       var item_support_fees=$('#SupportAdd').val();
       var select_license_price=$('input[name=list_item_price]:checked', '#license_list').val();
// console.log('license :'+select_license_price);
// console.log('support :'+item_support_fees);
       var itm_and_support_price=parseFloat(select_license_price)+parseFloat(item_support_fees);
       var show_price=$('input[name=list_item_price]:checked', '#license_list').attr("data-type");
       var normal_price=$('input[name=list_item_price]:checked', '#license_list').attr("data-normal");
       var normal_price=$('#'+normal_price).val();
        
       if(this.checked) {
        // console.log('sp-1');
          $('input[name=list_item_price]:checked', '#license_list').val(itm_and_support_price);
          $('#'+show_price).text(itm_and_support_price.toFixed(2));
          $('._mod_total').text(itm_and_support_price.toFixed(2));
          $('#item_price').val(itm_and_support_price.toFixed(2));
          $('#pop_support_time').val(2);
          $('#support_tym').html('12 Months Support');

        }else{
          // console.log('sp-2');
             $('input[name=list_item_price]:checked', '#license_list').val(normal_price);
            $('#'+show_price).text(normal_price);
            $('._mod_total').text(normal_price);
            $('#item_price').val(normal_price);
            $('#pop_support_time').val(1);
            $('#support_tym').html('6 Months Support');
        }
    });
  });