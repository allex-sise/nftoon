<?php

namespace App\Http\Middleware;

use Auth;
use Closure;
use Illuminate\Support\Facades\Schema;

class AdminMiddleware
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
       
        if (Auth::user()->role_id == 1 ) {
            return $next($request);
           }
        if (Auth::user()->role_id == 2 ) {
            return $next($request);
           }
        elseif (Auth::user()->role_id != 1) {
            return redirect('/');
        }
           return redirect('admin/dashboard');
    }
}
