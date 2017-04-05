<?php
require 'components/get_listview_referrer.php';

require 'subclasses/record.php';
$dbh_record = new record;
$dbh_record->set_where("record_id='" . quote_smart($record_id) . "'");
if($result = $dbh_record->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

    $data = explode('-',$record_date);
    if(count($data) == 3)
    {
        $record_date_year = $data[0];
        $record_date_month = $data[1];
        $record_date_day = $data[2];
    }
}

