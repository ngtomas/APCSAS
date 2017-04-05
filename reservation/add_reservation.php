<?php
//****************************************************************************************
//Generated by Cobalt, a rapid application development framework. http://cobalt.jvroig.com
//Cobalt developed by JV Roig (jvroig@jvroig.com)
//****************************************************************************************
require 'path.php';
init_cobalt('Add reservation');

require 'components/get_listview_referrer.php';

if(xsrf_guard())
{
    init_var($_POST['btn_cancel']);
    init_var($_POST['btn_submit']);
    require 'components/query_string_standard.php';
    require 'subclasses/reservation.php';
    $dbh_reservation = new reservation;

    $object_name = 'dbh_reservation';
    require 'components/create_form_data.php';
    extract($arr_form_data);

    if($_POST['btn_cancel'])
    {
        log_action('Pressed cancel button');
        redirect("listview_reservation.php?$query_string");
    }


    if($_POST['btn_submit'])
    {
        log_action('Pressed submit button');

        $message .= $dbh_reservation->sanitize($arr_form_data)->lst_error;
        extract($arr_form_data);

        if($dbh_reservation->check_uniqueness($arr_form_data)->is_unique)
        {
            //Good, no duplicate in database
        }
        else
        {
            $message = "Record already exists with the same primary identifiers!";
        }

        if($message=="")
        {
            $dbh_reservation->add($arr_form_data);


            redirect("listview_reservation.php?$query_string");
        }
    }
}
require 'subclasses/reservation_html.php';
$html = new reservation_html;
$html->draw_header('Add %%', $message, $message_type);
$html->draw_listview_referrer_info($filter_field_used, $filter_used, $page_from, $filter_sort_asc, $filter_sort_desc);
$html->draw_controls('add');

$html->draw_footer();
