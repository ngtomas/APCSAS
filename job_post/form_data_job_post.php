<?php
require 'components/get_listview_referrer.php';

require 'subclasses/job_post.php';
$dbh_job_post = new job_post;
$dbh_job_post->set_where("job_post_id='" . quote_smart($job_post_id) . "'");
if($result = $dbh_job_post->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

    $data = explode('-',$job_created);
    if(count($data) == 3)
    {
        $job_created_year = $data[0];
        $job_created_month = $data[1];
        $job_created_day = $data[2];
    }
    $data = explode('-',$reservation_date_start);
    if(count($data) == 3)
    {
        $reservation_date_start_year = $data[0];
        $reservation_date_start_month = $data[1];
        $reservation_date_start_day = $data[2];
    }
    $data = explode('-',$reservation_date_end);
    if(count($data) == 3)
    {
        $reservation_date_end_year = $data[0];
        $reservation_date_end_month = $data[1];
        $reservation_date_end_day = $data[2];
    }
}

