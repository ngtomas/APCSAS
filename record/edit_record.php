<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Edit record');

if(isset($_GET['record_id']))
{
    $record_id = urldecode($_GET['record_id']);
    require 'form_data_record.php';

}

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_submit']);
    require 'components/query_string_standard.php';
    require 'subclasses/record.php';
    $dbh_record = new record;

    $object_name = 'dbh_record';
    require 'components/create_form_data.php';

    extract($arr_form_data);

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_record.php?$query_string");
    }


if($_POST['record_type'] == 'Job Post')
{
 if($_POST['job_post_id'] != '')
    {
        $dbh = cobalt_load_class('job_post');
        $dbh->set_fields('*');
        $dbh->set_table('job_post');
        $dbh->set_where('job_post_id = '.$_POST['job_post_id'].' ');
        $dbh->exec_fetch('single');
        $arr_result = $dbh->dump;
        // debug($arr_result);

        
        $student_scholar_id = $arr_result['student_scholar_id'];
        $scope_of_work = $arr_result['scope_of_work'];
        $record_time_in = $arr_result['reservation_time_in'];
        $record_time_out = $arr_result['reservation_time_out'];

        $sql = 'SELECT TIME_FORMAT(TIMEDIFF(record_time_out, record_time_in), "%H:%i") as total_hours 
          FROM record WHERE record.job_post_id = "'.$_POST['job_post_id'].'"';
          
        $result      = $dbh_record->execute_query($sql)->result;
        $arr_results = array();

        while($row = $result->fetch_assoc())
        {
            $arr_results[]=$row;

        }
        for($i = 0; $i < count($arr_results); ++$i)
        {
            extract($arr_results[$i]);
           $hours_rendered = $total_hours;
        }

        $dbh_record->fields['scope_of_work']['required'] = FALSE;
    }
    else
    {
        $hours_rendered = '';
        $scope_of_work = '';
        $student_scholar_id = '';
        $record_time_in = '';
        $record_time_out = '';
    }
}

if($_POST['record_type'] == 'Request Job')
{
if($_POST['request_job_id'] != '')
    {
        $dbh = cobalt_load_class('request_job');
        $dbh->set_fields('*');
        $dbh->set_table('request_job');
        $dbh->set_where('request_job_id = '.$_POST['request_job_id'].' ');
        $dbh->exec_fetch('single');
        $arr_result = $dbh->dump;
        //debug($arr_result);

        $hours_rendered = '00:00';
        $student_scholar_id = $arr_result['student_scholar_id'];
        $record_time_in = $arr_result['request_time_in'];
        $record_time_out = $arr_result['request_time_out'];
        // $hours_rendered = $record_time_out - $record_time_in;

        $sql = 'SELECT TIME_FORMAT(TIMEDIFF(record_time_out, record_time_in), "%H:%i") as total_hours 
          FROM record WHERE record.request_job_id = "'.$_POST['request_job_id'].'"';
          
        $result      = $dbh_record->execute_query($sql)->result;
        $arr_results = array();

        while($row = $result->fetch_assoc())
        {
            $arr_results[]=$row;

        }
        for($i = 0; $i < count($arr_results); ++$i)
        {
            extract($arr_results[$i]);
           $hours_rendered = $total_hours;
        }

        $dbh_record->fields['scope_of_work']['required'] = FALSE;
    }
    else
    {
        $hours_rendered = '';
        $student_scholar_id = '';
        $record_time_in = '';
        $record_time_out = '';
    }
}


    if($_POST['btn_submit'])
    {
        log_action('Pressed submit button');

        $message .= $dbh_record->sanitize($arr_form_data)->lst_error;
        extract($arr_form_data);

        if($dbh_record->check_uniqueness_for_editing($arr_form_data)->is_unique)
        {
            //Good, no duplicate in database
        }
        else
        {
            $message = "Record already exists with the same primary identifiers!";
        }

        if($message=="")
        {

            $dbh_record->edit($arr_form_data);

            redirect("listview_record.php?$query_string");
        }
    }
}
require 'subclasses/record_html.php';
$html = new record_html;
$html->draw_header('Edit %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);
$html->draw_hidden('record_id');

init_var($_POST['record_type']);
// debug($_POST['dept_id']);
if($_POST['record_type'] == 'Job Post')
{
    $html->fields['request_job_id']['control_type'] = 'hidden';
    $html->fields['student_scholar_id']['control_type'] = 'hidden';
}

if($_POST['record_type'] == 'Request Job')
{
 $html->fields['job_post_id']['control_type'] = 'hidden'; 
 $html->fields['scope_of_work']['control_type'] = 'hidden';

}



if(isset($_POST['dept_id']))
{
    $html->fields['job_post_id']['list_settings']['query'] = 'SELECT job_post.job_post_id AS `Queried_job_post_id`, job_title FROM job_post WHERE dept_id = '.$_POST['dept_id'].' ORDER BY `Queried_job_post_id` ';

    // $html->fields['request_job_id']['list_settings']['query'] = 'SELECT request_job.request_job_id AS `Queried_request_job_id` FROM request_job where dept_id = '.$_POST['dept_id'].' ORDER BY `Queried_request_job_id';
}

$html->draw_controls('edit');

$html->draw_footer();