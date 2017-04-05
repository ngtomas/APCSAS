<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Delete student scholar');

if(isset($_GET['student_scholar_id']))
{
    $student_scholar_id = urldecode($_GET['student_scholar_id']);
    require_once 'form_data_student_scholar.php';
}

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_delete']);
    require 'components/query_string_standard.php';

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_student_scholar.php?$query_string");
    }

    elseif($_POST['btn_delete'])
    {
        log_action('Pressed delete button');
        require_once 'subclasses/student_scholar.php';
        $dbh_student_scholar = new student_scholar;

        $object_name = 'dbh_student_scholar';
        require 'components/create_form_data.php';


        $dbh_student_scholar->delete($arr_form_data);

        redirect("listview_student_scholar.php?$query_string");
    }
}
require 'subclasses/student_scholar_html.php';
$html = new student_scholar_html;
$html->draw_header('Delete %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);

$html->draw_hidden('student_scholar_id');

$html->detail_view = TRUE;
$html->draw_controls('delete');

$html->draw_footer();