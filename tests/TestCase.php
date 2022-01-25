<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

                /**
             * Load the service providers.
             */
            protected function getPackageProviders($app)
            {
                return [
                    LivewireServiceProvider::class,
                    //ExcelServiceProvider::class,
                ];
            }
}
