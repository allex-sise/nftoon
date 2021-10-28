<?php

namespace App\Http\Controllers;

use App\CurrencyRate;
use Illuminate\Http\Request;

class ValidationMessageController extends Controller
{
    public function messageGenerate(Request $request){
        // return $request;
        try {

        
        $field = request()->field;
        $rules = request()->rules;
        $arr = [];
     
     
        $single_rule = explode('|', $rules);
     
     
        foreach ($single_rule as $rule){
            $string = explode(':', $rule);
            $rule_name = $rule_message_key = $string[0];
     
            if (in_array($rule_name, ['max', 'min'])){
                $rule_message_key = $rule_message_key.'.string';
            }
     
            $message = __('validation.'.$rule_message_key);
     
            $field_string = str_replace('_', ' ', $field);
     
            $message = str_replace(
                [':attribute', ':ATTRIBUTE', ':Attribute'],
                [$field_string, \Illuminate\Support\Str::upper($field_string), \Illuminate\Support\Str::ucfirst($field_string)],
                $message
            );
            if (in_array($rule_name, ['max', 'min'])){
                $message = str_replace(
                    [':'.$rule_name],
                    [$string[1]],
                    $message
                );
            }
     
            if ($rule_name == 'required_if'){
                $ex = explode(',', $string[1]);
                $message = str_replace(
                    [':other'],
                    [str_replace('_', ' ', $ex[0])],
                    $message
                );
                if (isset($ex[2])){
                    $message = str_replace(
                        [':value', "'"],
                        [str_replace('_', ' ', $ex[2]), ''],
                        $message
                    );
                }  else{
                    $message = str_replace(
                        [':value', "'"],
                        [str_replace('_', ' ', $ex[1]), ''],
                        $message
                    );
                }
            }
     
            if ($rule_name == 'mimes'){
     
                $message = str_replace(
                    [':values'],
                    [str_replace('_', ' ', $string[1])],
                    $message
                );
            }
            if ($rule_name == 'same'){
     
                $message = str_replace(
                    [':other'],
                    [str_replace('_', ' ', $string[1])],
                    $message
                );
            }
            if ($rule_name == 'required_with'){
     
                $message = str_replace(
                    [':values'],
                    [str_replace('_', ' ', $string[1])],
                    $message
                );
            }
     
            if ($rule_name == 'after_or_equal'){
     
                $message = str_replace(
                    [':date'],
                    [str_replace('_', ' ', $string[1])],
                    $message
                );
            }
            if ($rule_name == 'after'){
     
                $message = str_replace(
                    [':date'],
                    [str_replace('_', ' ', $string[1])],
                    $message
                );
            }
     
     
            $arr [$field.'.'.$rule_name] = $message;
        }
     
        $file =  public_path('/validation.php');
        $languages = include  "{$file}";
        $languages = array_merge($languages, $arr);
        file_put_contents($file, '');
        file_put_contents($file, '<?php return ' . var_export($languages, true) . ';');
     
        return view('test', compact('field', 'rules', 'arr'));
        } catch (\Exception $e) {
            // dd($e);
        }
    }

    public function currencyRate(){
        $rates_array=[
            'United States Dollar' => 'USD',
            'Albania Lek' => 'ALL',
            'Afghanistan Afghani' => 'AFN',
            'Argentina Peso' => 'ARS',
            'Aruba Guilder' => 'AWG',
            'Australia Dollar' => 'AUD',
            'Azerbaijan New Manat' => 'AZN',
            'Bahamas Dollar' => 'BSD',
            'Barbados Dollar' => 'BBD',
            'Bangladeshi taka' => 'BDT',
            'Belarus Ruble' => 'BYR',
            'Belize Dollar' => 'BZD',
            'Bermuda Dollar' => 'BMD',
            'Bolivia Boliviano' => 'BOB',
            'Bosnia and Herzegovina Convertible Marka' => 'BAM',
            'Botswana Pula' => 'BWP',
            'Bulgaria Lev' => 'BGN',
            'Brazil Real' => 'BRL',
            'Brunei Darussalam Dollar' => 'BND',
            'Cambodia Riel' => 'KHR',
            'Canada Dollar' => 'CAD',
            'Cayman Islands Dollar' => 'KYD',
            'Chile Peso' => 'CLP',
            'China Yuan Renminbi' => 'CNY',
            'Colombia Peso' => 'COP',
            'Costa Rica Colon' => 'CRC',
            'Croatia Kuna' => 'HRK',
            'Cuba Peso' => 'CUP',
            'Czech Republic Koruna' => 'CZK',
            'Denmark Krone' => 'DKK',
            'Dominican Republic Peso' => 'DOP',
            'East Caribbean Dollar' => 'XCD',
            'Egypt Pound' => 'EGP',
            'El Salvador Colon' => 'SVC',
            'Estonia Kroon' => 'EEK',
            'Euro Member Countries' => 'EUR',
            'Falkland Islands (Malvinas) Pound' => 'FKP',
            'Fiji Dollar' => 'FJD',
            'Ghana Cedis' => 'GHC',
            'Gibraltar Pound' => 'GIP',
            'Guatemala Quetzal' => 'GTQ',
            'Guernsey Pound' => 'GGP',
            'Guyana Dollar' => 'GYD',
            'Honduras Lempira' => 'HNL',
            'Hong Kong Dollar' => 'HKD',
            'Hungary Forint' => 'HUF',
            'Iceland Krona' => 'ISK',
            'India Rupee' => 'INR',
            'Indonesia Rupiah' => 'IDR',
            'Iran Rial' => 'IRR',
            'Isle of Man Pound' => 'IMP',
            'Israel Shekel' => 'ILS',
            'Jamaica Dollar' => 'JMD',
            'Japan Yen' => 'JPY',
            'Jersey Pound' => 'JEP',
            'Kazakhstan Tenge' => 'KZT',
            'Korea (North) Won' => 'KPW',
            'Korea (South) Won' => 'KRW',
            'Kyrgyzstan Som' => 'KGS',
            'Laos Kip' => 'LAK',
            'Latvia Lat' => 'LVL',
            'Lebanon Pound' => 'LBP',
            'Liberia Dollar' => 'LRD',
            'Lithuania Litas' => 'LTL',
            'Macedonia Denar' => 'MKD',
            'Malaysia Ringgit' => 'MYR',
            'Mauritius Rupee' => 'MUR',
            'Mexico Peso' => 'MXN',
            'Mongolia Tughrik' => 'MNT',
            'Mozambique Metical' => 'MZN',
            'Namibia Dollar' => 'NAD',
            'Nepal Rupee' => 'NPR',
            'Netherlands Antilles Guilder' => 'ANG',
            'New Zealand Dollar' => 'NZD',
            'Nicaragua Cordoba' => 'NIO',
            'Nigeria Naira' => 'NGN',
            'Norway Krone' => 'NOK',
            'Oman Rial' => 'OMR',
            'Pakistan Rupee' => 'PKR',
            'Panama Balboa' => 'PAB',
            'Paraguay Guarani' => 'PYG',
            'Peru Nuevo Sol' => 'PEN',
            'Philippines Peso' => 'PHP',
            'Poland Zloty' => 'PLN',
            'Qatar Riyal' => 'QAR',
            'Romania New Leu' => 'RON',
            'Russia Ruble' => 'RUB',
            'Saint Helena Pound' => 'SHP',
            'Saudi Arabia Riyal' => 'SAR',
            'Serbia Dinar' => 'RSD',
            'Seychelles Rupee' => 'SCR',
            'Singapore Dollar' => 'SGD',
            'Solomon Islands Dollar' => 'SBD',
            'Somalia Shilling' => 'SOS',
            'South Africa Rand' => 'ZAR',
            'Sri Lanka Rupee' => 'LKR',
            'Sweden Krona' => 'SEK',
            'Switzerland Franc' => 'CHF',
            'Suriname Dollar' => 'SRD',
            'Syria Pound' => 'SYP',
            'Taiwan New Dollar' => 'TWD',
            'Thailand Baht' => 'THB',
            'Trinidad and Tobago Dollar' => 'TTD',
            'Turkey Lira' => 'TRL',
            'Tuvalu Dollar' => 'TVD',
            'Ukraine Hryvna' => 'UAH',
            'United Kingdom Pound' => 'GBP',
            'United States Dollar' => 'USD',
            'Uruguay Peso' => 'UYU',
            'Uzbekistan Som' => 'UZS',
            'Venezuela Bolivar' => 'VEF',
            'Viet Nam Dong' => 'VND',
            'Yemen Rial' => 'YER',
            'Zimbabwe Dollar' => 'ZWD',
        ];
    // foreach ($rates_array as $key => $value) {
    //    return $value;
    // }

      $apikey = (env('access_key') !=null ) ? env('access_key') : '4535c2be6b86684dee72cecc75ad8591';
      $curl = curl_init();
      curl_setopt_array($curl, array(
      CURLOPT_URL => "http://data.fixer.io/api/latest?access_key=".$apikey."&format=1",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 30,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "GET",
      CURLOPT_HTTPHEADER => array(
        "accept: application/json",
        "content-type: application/json"
      ),
    ));  
    $response = curl_exec($curl);
    $err = curl_error($curl);    
    curl_close($curl);   

    $info = json_decode($response);
    $cur = (array)@$info->rates;

    $from = urlencode('USD');
    
    // dd($cur);
        $from_=null;
        $to_=null;
        $list=[];
        foreach ($rates_array as $arr_key => $curr) {
            $to = urlencode($curr);
            foreach ($cur as $key => $value) {
                if ($key == $from) {
                $from_ = $value;
                }
                if ($key == $to) {
                $to_ = $value;
                }
                
              }
              if($to_>0){
                $total = ( $to_ / $from_ ) * 1 ; 
        
              }else{
                $total = 0 ; 
              }   
            //   $total[$curr]= number_format($total, 2, '.', '');
              $list[$curr]= number_format($total, 2, '.', '');
              
        }
        foreach ($list as $key => $value) {
            $currcncy=CurrencyRate::where('currency_code',$key)->first();
            if ($currcncy=='') {
                $currcncy=new CurrencyRate();
            }
            $currcncy->currency_code=$key;
            $currcncy->rate=$value;
            $currcncy->save();
        }
        return  $currcncy=CurrencyRate::get();
    }
 
}
