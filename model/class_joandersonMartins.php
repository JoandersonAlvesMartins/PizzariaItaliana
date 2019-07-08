<?php
   class JoandersonMartins{
   		private $codigo;
		private $primeironome;
		private $ultimonome;
		
		
		public function __construct($codigo=0, $primeironome="", $ultimonome=""){
			$this->codigo = $codigo;	
			$this->primeironome = $primeironome;
			$this->ultimonome = $ultimonome;
			
		}		
		
		public function setCodigo($codigo){
			$this->codigo = $codigo;
		}
		
		public function getCodigo(){
			return $this->codigo;
		}
		
		public function setPrimeironome($primeironome){
			$this->primeironome = $primeironome;
		}
		
		public function getPrimeironome(){
			return $this->primeironome;
		}
		
		public function setUltimonome($ultimonome){
			$this->ultimonome = $ultimonome;
		}
		
		public function getUltimonome(){
			return $this->ultimonome;
		}
		
		
	
   }
?>