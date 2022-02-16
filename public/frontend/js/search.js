"use strict";
var currencySys = $(".currencyIn").val();
var url = $(".url").val();

var token = $("input[name=_token]").val();
console.log(url);

function GetOutPutString(data) {
    data.forEach(function(e, index) {
        if (e.file == 'video') {
        $(".databox").append(` <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <div class="nft__item">
           <!-- <div class="de_countdown" data-year="2021" data-month="8" data-day="16" data-hour="8"></div> -->
            <div class="author_list_pp">
                <a href="${
                  url + "/user/profile/" + e.username
                }">                                    
                    <img class="lazy" src="{{ asset('public/frontend/assets/images/author/author-1.jpg') }}" alt="">
                    <i class="fa fa-check"></i>
                </a>
            </div>
            <div class="nft__item_wrap">
                <a href="${
                  url +
                  "/item/" +
                  e.title.split(" ").join("-").toLowerCase() +
                  "/" +
                  e.id
                }">
                      <video width="100%" height="100%" class="lazy nft__item_preview" autoplay muted controls loop>
                           <source src="${e.main_file}" type="video/mp4">
                           
                           Your browser does not support the video tag.
                       </video>
                </a>
            </div>
            <div class="nft__item_info">
                <a href="${
                  url +
                  "/item/" +
                  e.title.split(" ").join("-").toLowerCase() +
                  "/" +
                  e.id
                }">
                    <h4>${e.title.substring(0, 20)} ....</h4>
                </a>
                <div class="nft__item_price">
                ${e.Re_item} <span></span>
                </div>
                <div class="nft__item_action">
                    <a href="${
                      url +
                      "/item/" +
                      e.title.split(" ").join("-").toLowerCase() +
                      "/" +
                      e.id
                    }">Cumpara Acum</a>
                </div>
             <!--   <div class="nft__item_like">
                    <i class="fa fa-heart"></i><span>50</span>
                </div> -->                           
            </div> 
        </div>
    </div>
   
    `);
       } else {
        $(".databox").append(` 
        <!-- nft item begin -->
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 float-left">
            <div class="nft__item">
                <!-- <div class="de_countdown" data-year="2021" data-month="9" data-day="16" data-hour="8"></div> -->
                <div class="author_list_pp">
                    <a href="${
                        url + "/user/profile/" + e.username
                      }">                                    
                        <img class="lazy" src="{{ $item->og->profile->image? asset($item->og->profile->image):asset('public/frontend/img/profile/1.png') }}" alt="">
                        <i class="fa fa-check"></i>
                    </a>
                    
                </div>
                <div class="nft__item_wrap">
                    <a href="${
                        url +
                        "/item/" +
                        e.title.split(" ").join("-").toLowerCase() +
                        "/" +
                        e.id
                      }">
                        <img src="${url}/${e.icon}" class="lazy nft__item_preview" alt="">
                     
                    </a>
                </div>
                <div class="nft__item_info">
                    <a href="${
                        url +
                        "/item/" +
                        e.title.split(" ").join("-").toLowerCase() +
                        "/" +
                        e.id
                      }">
                        <h4>${e.title.substring(0, 20)} ....</h4>
                    </a>
                    <div class="nft__item_price">
                    ${e.Re_item} 
                    </div>
                    <div class="nft__item_action">
         
                        <a href="${
                            url +
                            "/item/" +
                            e.title.split(" ").join("-").toLowerCase() +
                            "/" +
                            e.id
                          }" class="heart">Cumpara Acum</a>
                    
                    </div>
                    <!-- <div class="nft__item_like">
                        <i class="fa fa-heart"></i><span>50</span>
                    </div>                             -->
                </div> 
            </div>
        </div>                 
        <!-- nft item begin -->
    
    `);
       }
    });
}
/* 
    $(document).ready(function(){ */
var _categor_id = $("#_categor_id").val();
var _subcategor_id = $("#_subcategor_id").val();
var key = $("#_key").val();
var _tag = $("#_tag").val();
var _attribute = $("#_attribute").val();
var _feature_item = $("#_feature_item").val();
if (_feature_item) {
    var page = 2;
} else {
    var page = 1;
}
var all = "";
var bestsell = "";
var newest = "";
var bestrated = "";
var trending = "";
var high = "";
var low = "";
var min_price = "";
var max_price = "";

var lastpg = 1;
var LowSell = "";
var NoSell = "";
var MediumSell = "";
var HighSell = "";
var TopSell = "";
var star = "";

$.ajax({
    url: url +
        "/search/item?newest=" +
        newest +
        "&all=" +
        all +
        "&star=" +
        star +
        "&_tag=" +
        _tag +
        "&_attribute=" +
        _attribute +
        "&NoSell=" +
        NoSell +
        "&LowSell=" +
        LowSell +
        "&MediumSell=" +
        MediumSell +
        "&HighSell=" +
        HighSell +
        "&TopSell=" +
        TopSell +
        "&bestrated=" +
        bestrated +
        "&bestsell=" +
        bestsell +
        "&trending=" +
        trending +
        "&high=" +
        high +
        "&low=" +
        low +
        "&_categor_id=" +
        _categor_id +
        "&_subcategor_id=" +
        _subcategor_id +
        "&key=" +
        key +
        "&page=" +
        page,
    method: "GET",
    success: function(data) {
        console.log(data);

        page = 1;
        lastpg = data.last_page;
        data = data.data;

        if (Object.keys(data).length > 0) {
            GetOutPutString(data);
        } else {
            $(".databox").append(`<div class="col-xl-12 col-md-12 grid-item no_item">
                   <h2 class="text-center"> No Item </h2>
                </div>`);
        }
        if (page < lastpg) {
            $(".bt")
                .append(`<div class="col-xl-12 col-lg-12" style='display: block;margin:auto;'>
                    <div class="load-more text-center mt-10">
                        <button  id="loadMore" class="load-btn" > <i class="ti-reload"></i> Arata mai multe</button>
                    </div>
                </div>`);
        }
    },
});

//pagination controller
$(document).on("click", "#loadMore", function() {
    //$(this).fadeOut();
    page = page + 1;
    AllDataPaginate(
        newest,
        bestsell,
        all,
        bestrated,
        trending,
        high,
        low,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell
    );
});

$("#NoSell").click(function() {
    page = 1;
    NoSell = "NoSell";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    $(".filter_cat_sale").empty();
    $(".filter_cat_sale").append(`<button class="active">${NoSell}</button>`);
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#LowSell").click(function() {
    page = 1;
    LowSell = "LowSell";
    NoSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    $(".filter_cat_sale").empty();
    $(".filter_cat_sale").append(`<button class="active">${LowSell}</button>`);
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#MediumSell").click(function() {
    page = 1;
    MediumSell = "MediumSell";
    NoSell = "";
    LowSell = "";
    HighSell = "";
    TopSell = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    $(".filter_cat_sale").empty();
    $(".filter_cat_sale").append(`<button class="active">${MediumSell}</button>`);
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#HighSell").click(function() {
    page = 1;
    HighSell = "HighSell";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    TopSell = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    $(".filter_cat_sale").empty();
    $(".filter_cat_sale").append(`<button class="active">${HighSell}</button>`);
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#TopSell").click(function() {
    page = 1;
    TopSell = "TopSell";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    $(".filter_cat_sale").empty();
    $(".filter_cat_sale").append(`<button class="active">${TopSell}</button>`);
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#all").click(function() {
    page = 1;
    all = $(this).val();
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#bestsell").click(function() {
    page = 1;
    bestsell = $(this).val();
    all = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#newest").click(function() {
    page = 1;
    newest = $(this).val();
    all = "";
    bestsell = "";
    bestrated = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";

    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#bestrated").click(function() {
    page = 1;
    bestrated = $(this).val();
    all = "";
    bestsell = "";
    newest = "";
    trending = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#trending").click(function() {
    page = 1;
    trending = $(this).val();
    all = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    high = "";
    low = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#high").click(function() {
    page = 1;
    high = $(this).val();
    all = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    low = "";
    key = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});
$("#low").click(function() {
    page = 1;
    low = $(this).val();
    all = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    key = "";
    star = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
});

function showResult(params) {
    page = 1;
    low = "";
    all = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    star = "";
    TopSell = "";
    if (params.length > 0) {
        key = params;
        AllData(
            all,
            bestsell,
            newest,
            bestrated,
            trending,
            high,
            low,
            key,
            min_price,
            max_price,
            NoSell,
            LowSell,
            MediumSell,
            HighSell,
            TopSell,
            star
        );
    }
}

function Star(params) {
    page = 1;
    star = params;
    low = "";
    all = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    key = "";
    min_price = "";
    max_price = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    $(".filter_cat_rate").empty();
    $(".filter_cat_rate").append(`<button class="active">${star} Star </button>`);
    AllData(
        all,
        bestsell,
        newest,
        bestrated,
        trending,
        high,
        low,
        key,
        min_price,
        max_price,
        NoSell,
        LowSell,
        MediumSell,
        HighSell,
        TopSell,
        star
    );
}
$("#price_submit").click((e) => {
    e.preventDefault();
    var _min = $("#min_price").val();
    var _max = $("#max_price").val();
    page = 1;
    low = "";
    all = "";
    bestsell = "";
    newest = "";
    bestrated = "";
    trending = "";
    high = "";
    star = "";
    NoSell = "";
    LowSell = "";
    MediumSell = "";
    HighSell = "";
    TopSell = "";
    // key=''
    if (parseInt(_max) >= parseInt(_min)) {
        $(".filter_cat_price").empty();
        $(".filter_cat_price").append(
            `<button class="active">${_min}  -  ${_max} </button>`
        );
        min_price = _min;
        max_price = _max;
        AllData(
            all,
            bestsell,
            newest,
            bestrated,
            trending,
            high,
            low,
            key,
            min_price,
            max_price,
            NoSell,
            LowSell,
            MediumSell,
            HighSell,
            TopSell,
            star
        );
    } else
        $("#price_filter_msg").html("Max price will be greater than min price");
    // alert('Max price will be greater than min price')
});

function AllData(
    all = "",
    bestsell = "",
    newest = "",
    bestrated = "",
    trending = "",
    high = "",
    low = ""
) {
    $("#databox").empty();
    // $(".databox").empty();
    //    console.log(key);

    $.ajax({
        url: url +
            "/search/item?newest=" +
            newest +
            "&all=" +
            all +
            "&_tag=" +
            _tag +
            "&star=" +
            star +
            "&_attribute=" +
            _attribute +
            "&NoSell=" +
            NoSell +
            "&LowSell=" +
            LowSell +
            "&MediumSell=" +
            MediumSell +
            "&HighSell=" +
            HighSell +
            "&TopSell=" +
            TopSell +
            "&bestrated=" +
            bestrated +
            "&bestsell=" +
            bestsell +
            "&trending=" +
            trending +
            "&high=" +
            high +
            "&low=" +
            low +
            "&_categor_id=" +
            _categor_id +
            "&_subcategor_id=" +
            _subcategor_id +
            "&key=" +
            key +
            "&min_price=" +
            min_price +
            "&max_price=" +
            max_price +
            "&page=" +
            page,
        method: "GET",
        success: function(data) {
            console.log(data);

            all = "";
            bestsell = "";
            newest = "";
            bestrated = "";
            trending = "";
            high = "";
            low = "";
            lastpg = data.last_page;
            data = data.data;

            $("#databox").empty();
            $(".bt").empty();
            $(".no_item").remove();
            // $('#loadMore').hide()
            if (Object.keys(data).length > 0) {
                GetOutPutString(data);
            } else {
                $(".databox")
                    .append(`<div class="col-xl-12 col-md-12 grid-item no_item">
                       <h2 class="text-center"> No Item </h2>
                    </div>`);
            }
            if (page < lastpg) {
                $(".bt")
                    .append(`<div class="col-xl-12 col-lg-12" style='display: block;margin:auto;'>
                        <div class="load-more text-center mt-10">
                            <button  id="loadMore" class="load-btn" > <i class="ti-reload"></i> Arata mai multe</button>
                        </div>
                    </div>`);
            }
        },
    });
}

function AllDataPaginate(
    all = "",
    bestsell = "",
    newest = "",
    bestrated = "",
    trending = "",
    high = "",
    low = ""
) {
    $.ajax({
        url: url +
            "/search/item?newest=" +
            newest +
            "&all=" +
            all +
            "&_tag=" +
            _tag +
            "&star=" +
            star +
            "&_attribute=" +
            _attribute +
            "&NoSell=" +
            NoSell +
            "&LowSell=" +
            LowSell +
            "&MediumSell=" +
            MediumSell +
            "&HighSell=" +
            HighSell +
            "&TopSell=" +
            TopSell +
            "&bestrated=" +
            bestrated +
            "&bestsell=" +
            bestsell +
            "&trending=" +
            trending +
            "&high=" +
            high +
            "&low=" +
            low +
            "&_categor_id=" +
            _categor_id +
            "&_subcategor_id=" +
            _subcategor_id +
            "&key=" +
            key +
            "&min_price=" +
            min_price +
            "&max_price=" +
            max_price +
            "&page=" +
            page,
        method: "GET",
        success: function(data) {
            lastpg = data.last_page;
            data = data.data;

            // $(".databox").empty();
            $(".bt").empty();
            $(".no_item").remove();
            if (Object.keys(data).length > 0) {
                GetOutPutString(data);
            } else {
                $(".databox")
                    .append(`<div class="col-xl-12 col-md-12 grid-item no_item">
                       <h2 class="text-center"> No Item </h2>
                    </div>`);
            }
            if (page < lastpg) {
                $(".bt")
                    .append(`<div class="col-xl-12 col-lg-12" style='display: block;margin:auto;'>
                        <div class="load-more text-center mt-10">
                            <button  id="loadMore" class="load-btn" > <i class="ti-reload"></i> Arata mai multe</button>
                        </div>
                    </div>`);
            }
        },
    });
}

function calculateHomeItem(id, price) {
    var license = document.getElementById("SelectLicense" + id);
    var license_value = parseFloat(
        license.options[license.selectedIndex].value
    ).toFixed(2);
    console.log(license_value);
    var support = document.getElementById("Selectsupport" + id);
    var support_value = parseFloat(
        support.options[support.selectedIndex].value
    ).toFixed(2);
    var ext_price = (ext_price = (license_value * support_value) / 100);
    var show_price = parseInt(license_value) + ext_price;
    // console.log(ext_price);
    document.getElementById("total_price" + id).innerHTML = show_price;
    document.getElementById("item_price" + id).value = show_price;
    document.getElementById("license_text" + id).innerHTML =
        license.options[license.selectedIndex].text;
    document.getElementById("support_tym" + id).innerHTML =
        support.options[support.selectedIndex].text;

        if ($("#SelectLicense"+id).prop('selectedIndex')==0) {
            
            $('#license_input'+id).val(1);
        }else if ($("#SelectLicense"+id).prop('selectedIndex')==1) {
            
            $('#license_input'+id).val(2);
        } else {
             $('#license_input'+id).val(3);
        }

    if ($("#Selectsupport" + id).prop("selectedIndex") == 0) {
        $("#support_input" + id).val(1);
    } else {
        $("#support_input" + id).val(2);
    }
    // alert($("#SelectLicense"+id).prop('selectedIndex'));
}

/*   }); */