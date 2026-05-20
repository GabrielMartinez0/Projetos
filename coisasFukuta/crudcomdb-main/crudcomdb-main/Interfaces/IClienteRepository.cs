using crudcomdb.Models;
using crudcomdb.Repositories;

namespace crudcomdb.Interfaces
{
    public interface IClienteRepository
    {
        Task<List<Cliente>> Listar();
        Task<Cliente?> BuscarPorId(int id);
        Task Salvar(Cliente cliente);
        Task Atualizar(Cliente cliente);
        Task Deletar(int id);
    }
}
