<?php
    require_once 'conexao.php';
	require_once '../model/class_joandersonMartins.php'; 
	
	class DAOJoandersonMartins{
		
		private $conexao;
		
		public function __construct(){
			$this->conexao = new Conexao();
				 if($this->conexao->conectar() == false){
				 	 echo "Não conectou!" . mysql_error();	
				 }
			
		}	
		
		public function cadastrarJoandersonMartins(JoandersonMartins $joandersonMartins){
			$primeironome = $joandersonMartins->getPrimeironome();
			$ultimonome = $joandersonMartins->getUltimonome(); 
			

			$sql = "INSERT INTO joandersonmartins (primeironome, ultimonome ) VALUES ('$primeironome', '$ultimonome')";
			$this->conexao->executarQuery($sql);
		}
		
		public function listarJoandersonMartins(){
			$lista = $this->conexao->executarQuery("SELECT * FROM joandersonmartins");
			$arrayJoandersonMartinss = array();
			
			while ($linha = mysqli_fetch_array($lista)) {
				$joandersonMartins = new JoandersonMartins($linha['codigo'],$linha['primeironome'],$linha['ultimonome']);
				array_push($arrayJoandersonMartinss,$joandersonMartins);
			}
			return $arrayJoandersonMartinss;
		}
		
		public function removerJoandersonMartins($codigo){
			$sql = "DELETE FROM joandersonmartins WHERE codigo = '$codigo'";
			$this->conexao->executarQuery($sql);
		}
		 
		
	}
	
?>