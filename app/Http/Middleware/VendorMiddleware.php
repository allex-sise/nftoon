<?php

namespace App\Http\Middleware;

use Auth;
use Closure;
use Illuminate\Support\Facades\Schema;

class VendorMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        
     
        if (@Auth::user()->access_status == 0) {
            auth()->logout();
            return redirect()->back()->with("message-danger",'You are suspended!');
         }
         if (Auth::user()->role_id == 4 ) {
              return $next($request);
            }
            return redirect('/');
    }
}
