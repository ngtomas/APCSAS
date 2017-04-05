<?php
require 'components/get_listview_referrer.php';

require 'subclasses/student_scholar.php';
$dbh_student_scholar = new student_scholar;
$dbh_student_scholar->set_where("student_scholar_id='" . quote_smart($student_scholar_id) . "'");
if($result = $dbh_student_scholar->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

