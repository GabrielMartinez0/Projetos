using crudcomdb.Data;
using crudcomdb.Models;
using Microsoft.EntityFrameworkCore;

public interface IProdutoRepository
    {
        Task Atualizar(Produto Produto);
        Task<Produto?> BuscarPorId(int id);
        Task Deletar(int id);
        Task<List<Produto>> Listar();
        Task Salvar(Produto Produto);
    }
