<?php

namespace SpondonIt\Service\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use SpondonIt\Service\Repositories\InstallRepository;
use SpondonIt\Service\Requests\DatabaseRequest;
use SpondonIt\Service\Requests\LicenseRequest;
use SpondonIt\Service\Requests\UserRequest;
use SpondonIt\Service\Requests\ModuleInstallRequest;

class InstallController extends Controller{
    protected $repo, $request;

    public function __construct(InstallRepository $repo, Request $request)
    {
        $this->repo = $repo;
        $this->request = $request;
    }


    public function preRequisite(){
  
       
    }

    public function license(){
   
        $checks = $this->repo->getPreRequisite();
        if(in_array(false, $checks)){
            return redirect()->route('service.preRequisite')->with(['message' => __('service::install.requirement_failed'), 'status' => 'error']);
        }

        $ac = Storage::exists('.app_installed') ? Storage::get('.app_installed') : null;
        if($ac){
            abort(404);
        }

		return view('service::install.license');
    }

    public function post_license(LicenseRequest $request){
        $this->repo->validateLicense($request->all());
        session()->flash('license', 'verified');
		return response()->json(['message' => __('service::install.valid_license'), 'goto' => route('service.database')]);
    }

    public function database(){
        
        
    }

    public function post_database(DatabaseRequest $request){
      
    }


    public function done(){

		
    }

     public function ManageAddOnsValidation(ModuleInstallRequest $request){
        $response = $this->repo->installModule($request->all());
        return response()->json(['message' => __('service::install.module_verify'), 'reload' => true]);
    }

    


}
