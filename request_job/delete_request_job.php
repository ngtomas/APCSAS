<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Delete request job');

if(isset($_GET['request_job_id']))
{
    $request_job_id = urldecode($_GET['request_job_id']);
    require_once 'form_data_request_job.php';
}

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_delete']);
    require 'components/query_string_standard.php';

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_request_job.php?$query_string");
    }

    elseif($_POST['btn_delete'])
    {
        log_action('Pressed delete button');
        require_once 'subclasses/request_job.php';
        $dbh_request_job = new request_job;

        $object_name = 'dbh_request_job';
        require 'components/create_form_data.php';


        $dbh_request_job->delete($arr_form_data);

        redirect("listview_request_job.php?$query_string");
    }
}
require 'subclasses/request_job_html.php';
$html = new request_job_html;
$html->draw_header('Delete %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);

$html->draw_hidden('request_job_id');

$html->detail_view = TRUE;
$html->draw_controls('delete');

$html->draw_footer();