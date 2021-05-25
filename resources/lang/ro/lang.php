<?php
                                                $jsonFile =  base_path() ."/resources/lang/ro/ro.json";
                                                $array =  json_decode(file_get_contents($jsonFile), true);
                                                return $array;