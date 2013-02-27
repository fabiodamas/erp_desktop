CREATE TABLE `mensagem` (
  `CodigoMensagem` float(15,0) NOT NULL,
  `UsuarioOrigem` VARCHAR(20) DEFAULT NULL,
  `CodigoPerfilDestino` float(15,0) DEFAULT NULL,
  `Usuario` VARCHAR(20) DEFAULT NULL,
  `DataEnvio` date DEFAULT NULL,
  `HoraEnvio` time DEFAULT NULL,
  `DataLeitura` date DEFAULT NULL,
  `HoraLeitura` time DEFAULT NULL,
  `ConfirmarLeitura` integer DEFAULT 0,
  `Origem` varchar(50) DEFAULT NULL,
  `Descricao` text,
  PRIMARY KEY (`CodigoMensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
