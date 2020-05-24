$(document).ready(function(){



        //$("#cc_1").on('click',function(){
        /* value */ 
        var product_id = $(this).data('product_id');  
        var music_value = $('.music_value').attr('src');

        /* ajax參數 */ 
        var Type = "POST";
        var DataType = "html";            
        var URls = "response_music.php";

        $.ajax({
            type: Type,
            dataType: DataType,
            data: {
                music_value: music_value
            },
                url: URls,
                async: true,
                error: function(response) {
                    alert('Error!!');
                }, 
                success: function(response) {
                    //alert('Success!');
                    $(".ajax_show").html(response);
                }
        });
    //});

});