<?php
/**
 * PayPal Setting & API Credentials
 * Created by Raza Mehdi <srmk@outlook.com>.
 */

return [
    'mode'    => env('PAYPAL_MODE', 'sandbox'), // Can only be 'sandbox' Or 'live'. If empty or invalid, 'live' will be used.
    'sandbox' => [
        'username'    => env('PAYPAL_USERNAME', ''),
        'password'    => env('PAYPAL_PASSWORD', ''),
        'secret'      => env('PAYPAL_SECRET', ''),
        'certificate' => env('PAYPAL_CERTIFICATE', ''),
        'app_id'      => 'APP-80W284485P519543T',
    ],
    'live' => [
        'username'    => env('PAYPAL_USERNAME', ''),
        'password'    => env('PAYPAL_PASSWORD', ''),
        'secret'      => env('PAYPAL_SECRET', ''),
        'certificate' => env('PAYPAL_CERTIFICATE', ''),
        'app_id'      => '',
    ],

    'payment_action' => 'Sale',
    'currency'       => env('PAYPAL_CURRENCY', 'USD'),
    'billing_type'   => 'MerchantInitiatedBilling',
    'notify_url'     => '',
    'locale'         => '',
    'validate_ssl'   => false,
];
