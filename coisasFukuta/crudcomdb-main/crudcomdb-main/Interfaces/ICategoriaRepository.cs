using crudcomdb.Models;
using crudcomdb.Repositories;

namespace crudcomdb.Interfaces
{
    public interface ICategoriaRepository
    {
        Task<List<Categoria>> Listar();
        Task<Categoria?> BuscarPorId(int id);
        Task Salvar(Categoria categoria);
        Task Atualizar(Categoria categoria);
        Task Deletar(int id);
    }
}
