<?php
   require_once '../persistence/dao_joandersonMartins.php';
   
   $objetoJoandersonMartins = new JoandersonMartins();
   $objetoJoandersonMartins->setPrimeironome($_REQUEST['primeironome']);
   $objetoJoandersonMartins->setUltimonome($_REQUEST['ultimonome']);
   
   
   $dao = new DAOJoandersonMartins();
   $dao->cadastrarJoandersonMartins($objetoJoandersonMartins); 
 	
	header('Location: ../view/view_joandersonMartins.php');
	exit;
?>