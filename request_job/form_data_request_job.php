<?php
require 'components/get_listview_referrer.php';

require 'subclasses/request_job.php';
$dbh_request_job = new request_job;
$dbh_request_job->set_where("request_job_id='" . quote_smart($request_job_id) . "'");
if($result = $dbh_request_job->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

    $data = explode('-',$request_created);
    if(count($data) == 3)
    {
        $request_created_year = $data[0];
        $request_created_month = $data[1];
        $request_created_day = $data[2];
    }
    $data = explode('-',$request_date_start);
    if(count($data) == 3)
    {
        $request_date_start_year = $data[0];
        $request_date_start_month = $data[1];
        $request_date_start_day = $data[2];
    }
    $data = explode('-',$request_date_end);
    if(count($data) == 3)
    {
        $request_date_end_year = $data[0];
        $request_date_end_month = $data[1];
        $request_date_end_day = $data[2];
    }
}

