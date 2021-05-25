<?php

namespace App\Http\Middleware;

use Brian2694\Toastr\Facades\Toastr;
use Closure;
use Auth;
class CheckDashboardMiddleware
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
            Toastr::error('You are suspended!');
            return redirect()->back();
         }
        if (@Auth::user()->role_id == 1) {
           return redirect('admin/dashboard');
        }
        if (@Auth::user()->role_id == 2) {
           return redirect('admin/dashboard');
        }
        if (@Auth::user()->role_id == 5 ) {
          return $next($request);
        }
        if (@Auth::user()->role_id == 4 ) {
         return $next($request);
        }
        return redirect('/login');
        
    }
}
