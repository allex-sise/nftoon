<?php

namespace SpondonIt\HubService\Middleware;

use Closure;
use Illuminate\Support\Facades\Storage;
use SpondonIt\Service\Repositories\InitRepository as ServiceRepository;
use SpondonIt\HubService\Repositories\InitRepository;

class HubService
{
    protected $repo, $service_repo;

    public function __construct(
        InitRepository $repo,
        ServiceRepository $service_repo
    ) {
        $this->repo = $repo;
        $this->service_repo = $service_repo;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $this->repo->init();

        $this->service_repo->init();

        if($this->inExceptArray($request)){
            return $next($request);
        }


        $this->repo->config();

        return $next($request);


    }

      /**
     * The names of the cookies that should not be encrypted.
     *
     * @var array
     */
    protected $except = [
        'install', 'install/*'
    ];

    protected function inExceptArray($request)
    {



        return false;
    }
}
