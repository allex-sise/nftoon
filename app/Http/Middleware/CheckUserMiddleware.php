<?php

namespace App\Http\Middleware;

use Auth;
use Closure;
use Illuminate\Support\Facades\Schema;

class CheckUserMiddleware
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
           return redirect('/');
        }
       // return redirect('/');
       return $next($request);
    }
}
