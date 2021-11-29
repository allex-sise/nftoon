"use strict";

function thembnailUpload() {
    var file = document.getElementById("thembnails_upload").files[0];
    if (file) {
        if (file.type == "image/jpeg" || file.type == "image/png" || file.type == "image/gif" || file.type == "video/x-flv" || file.type == "video/mp4" || file.type == "application/x-mpegURL" || file.type == "video/MP2T" || file.type == "video/3gpp" || file.type == "video/quicktime" || file.type == "video/x-msvideo" || file.type == "video/x-ms-wmv") {
            var img = new Image();

            img.src = window.URL.createObjectURL(file);

            img.onload = function() {
      
                window.URL.revokeObjectURL(img.src);

      
                    document.getElementById("thumbneils_title").style.color = "green";
                    document.getElementById("thumbneils_title").innerHTML = file.name;
              
            };
        } else {
            document.getElementById("thumbneils_title").style.color = "red";
            document.getElementById("thumbneils_title").innerHTML =
                "Invalid file type";
            document.getElementById("thembnails_upload").value = null;
        }
    }
}


function mainFileUpload() {
    // console.log('up');

    var file = document.getElementById("mail_file_upload").files[0];
    if (file) {
        if (file.type == "image/jpeg" || file.type == "image/png" || file.type == "image/gif" || file.type == "image/jpg" || file.type == "video/x-flv" || file.type == "video/mp4" || file.type == "application/x-mpegURL" || file.type == "video/MP2T" || file.type == "video/3gpp" || file.type == "video/quicktime" || file.type == "video/x-msvideo" || file.type == "video/x-ms-wmv") {
            document.getElementById("main_file_title").style.color = "green";
            document.getElementById("main_file_title").innerHTML = file.name;
        } else {
            document.getElementById("main_file_title").style.color = "red";
            document.getElementById("main_file_title").innerHTML =
                "Invalid file type";
            document.getElementById("mail_file_upload").value = null;
        }
    }
}

function fileUpload() {
    // console.log('up');

    var file = document.getElementById("file_upload").files[0];
    if (file) {
        if (file.type.indexOf('zip') > -1) {
            document.getElementById("file_title").innerHTML = file.name;
        } else {
            document.getElementById("file_title").style.color = "red";
            document.getElementById("file_title").innerHTML = "Invalid file type";
            document.getElementById("file_upload").value = null;
        }
    }
}