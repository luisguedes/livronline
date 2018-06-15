create trigger baixa_de_estoque
ON Cliente_Compra_Livro
AFTER INSERT AS
begin
  UPDATE livro
  SET qtde = qtde - 1
  WHERE isbn = (select livro_isbn from inserted);
end;
