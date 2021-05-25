<?php

namespace Modules\Systemsetting\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\File;


class ImageController extends Controller
{
    public function ajaxImage(Request $request)
    {
        if ($request->isMethod('get'))
            return view('systemsetting::ajax_image_upload');
        else {
            $validator = Validator::make(
                $request->all(),
                [
                    'file' => 'image',
                ],
                [
                    'file.image' => 'The file must be an image (jpeg, png, bmp, gif, or svg)'
                ]
            );
            if ($validator->fails())
                return array(
                    'fail' => true,
                    'errors' => $validator->errors()
                );
            $extension = $request->file('file')->getClientOriginalExtension();
            $dir = 'public/uploads/';
            $filename = uniqid() . '_' . time() . '.' . $extension;
            $request->file('file')->move($dir, $filename);
            return $filename;
        }
    }

    public function deleteImage($filename)
    {
        File::delete('public/uploads/' . $filename);
    }
}
