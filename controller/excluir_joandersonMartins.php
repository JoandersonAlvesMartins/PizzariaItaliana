<?php
   require_once '../persistence/dao_joandersonMartins.php';
   
   $objetoDao = new DAOJoandersonMartins();
   $objetoDao->removerJoandersonMartins($_REQUEST['codigo']);
 	
	header('Location: ../view/view_joandersonMartins.php');
	exit;
?>