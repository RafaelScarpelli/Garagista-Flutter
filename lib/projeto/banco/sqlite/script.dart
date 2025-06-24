final _veiculo = '''
CREATE TABLE veiculo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    marca TEXT NOT NULL,
    modelo TEXT NOT NULL,
    ano INTEGER NOT NULL,
    cor TEXT NOT NULL,
    quilometragem REAL NOT NULL,
    tipo TEXT NOT NULL,
    valor_venda REAL NOT NULL,
    valor_aluguel_dia REAL NOT NULL,
    status TEXT NOT NULL,
    data_cadastro TEXT NOT NULL,
    placa TEXT NOT NULL
);
''';

final _cliente =''' 
CREATE TABLE cliente ( 
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  nome TEXT NOT NULL, 
  cpf TEXT NOT NULL, 
  telefone TEXT NOT NULL, 
  email TEXT NOT NULL, 
  data_cadastro TEXT NOT NULL 
); 
''';

final criarTabelas = [_veiculo, _cliente];

final insertVeiculos = [
  '''
  INSERT INTO veiculo (marca, modelo, ano, cor, quilometragem, tipo, valor_venda, valor_aluguel_dia, status, data_cadastro, placa)
  VALUES ('Toyota', 'Corolla', 2020, 'Prata', 35000.0, 'Venda', 90000.0, 0.0, 'Disponível', '2025-01-10T00:00:00.000', 'ABC-1234')
  ''',
  '''
  INSERT INTO veiculo (marca, modelo, ano, cor, quilometragem, tipo, valor_venda, valor_aluguel_dia, status, data_cadastro, placa)
  VALUES ('Honda', 'Civic', 2019, 'Preto', 45000.0, 'Aluguel', 0.0, 200.0, 'Alugado', '2025-02-15T00:00:00.000', 'DEF-5678')
  ''',
  '''
  INSERT INTO veiculo (marca, modelo, ano, cor, quilometragem, tipo, valor_venda, valor_aluguel_dia, status, data_cadastro, placa)
  VALUES ('Ford', 'Focus', 2018, 'Azul', 60000.0, 'Ambos', 75000.0, 150.0, 'Disponível', '2025-03-20T00:00:00.000', 'GHI-9012')
  ''',
];

final insertClientes = [
  ''' INSERT INTO cliente (nome, cpf, telefone, email, data_cadastro) VALUES ('João Silva', '123.456.789-00', '(11) 91234-5678', 'joao.silva@email.com', '2025-01-15T00:00:00.000') ''',
  ''' INSERT INTO cliente (nome, cpf, telefone, email, data_cadastro) VALUES ('Maria Oliveira', '987.654.321-00', '(21) 98765-4321', 'maria.oliveira@email.com', '2025-02-20T00:00:00.000') ''',
];
