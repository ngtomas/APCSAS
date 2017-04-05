<?php
require 'components/get_listview_referrer.php';

require 'subclasses/reservation.php';
$dbh_reservation = new reservation;
$dbh_reservation->set_where("");
if($result = $dbh_reservation->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

