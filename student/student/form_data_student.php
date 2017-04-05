<?php
require 'components/get_listview_referrer.php';

require 'subclasses/student.php';
$dbh_student = new student;
$dbh_student->set_where("student_id='" . quote_smart($student_id) . "'");
if($result = $dbh_student->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

    $data = explode('-',$birth_date);
    if(count($data) == 3)
    {
        $birth_date_year = $data[0];
        $birth_date_month = $data[1];
        $birth_date_day = $data[2];
    }
}

