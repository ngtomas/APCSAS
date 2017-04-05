<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Delete job post');

if(isset($_GET['job_post_id']))
{
    $job_post_id = urldecode($_GET['job_post_id']);
    require_once 'form_data_job_post.php';
}

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_delete']);
    require 'components/query_string_standard.php';

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_job_post.php?$query_string");
    }

    elseif($_POST['btn_delete'])
    {
        log_action('Pressed delete button');
        require_once 'subclasses/job_post.php';
        $dbh_job_post = new job_post;

        $object_name = 'dbh_job_post';
        require 'components/create_form_data.php';


        $dbh_job_post->delete($arr_form_data);

        redirect("listview_job_post.php?$query_string");
    }
}
require 'subclasses/job_post_html.php';
$html = new job_post_html;
$html->draw_header('Delete %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);

$html->draw_hidden('job_post_id');

$html->detail_view = TRUE;
$html->draw_controls('delete');

$html->draw_footer();