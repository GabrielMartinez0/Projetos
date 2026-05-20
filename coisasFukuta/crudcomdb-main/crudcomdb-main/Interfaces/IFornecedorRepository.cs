using crudcomdb.Models;

namespace crudcomdb.Interfaces{
    public interface IFornecedorRepository
    {
            Task Atualizar(Fornecedor Fornecedor);
            Task<Fornecedor?> BuscarPorId(int id);
            Task Deletar(int id); // parametro do Id do Fornecedor
            Task<List<Fornecedor>> Listar();
            Task Incluir(Fornecedor Fornecedor);
    }
}