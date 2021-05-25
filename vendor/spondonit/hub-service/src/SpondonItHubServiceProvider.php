<?php

namespace SpondonIt\HubService;

use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Http\Kernel;
use SpondonIt\HubService\Middleware\HubService;

class SpondonItHubServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $kernel = $this->app->make(Kernel::class);
        $kernel->pushMiddleware(HubService::class);

        $this->loadRoutesFrom(__DIR__.'/../routes/web.php');
        $this->loadTranslationsFrom(__DIR__.'/../resources/lang', 'hub');
        $this->loadViewsFrom(__DIR__.'/../resources/views', 'hub');
        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');
    }
}
