using crudcomdb.Models;
using crudcomdb.Interfaces;
using Microsoft.EntityFrameworkCore;
using crudcomdb.Data;

namespace crudcomdb.Repositories
{
    

    public class FornecedorRepository : IFornecedorRepository
    {
        private readonly AppDbContext _context;

        public FornecedorRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Fornecedor>> Listar()
        {
            return await _context.Fornecedores.ToListAsync();
        }

        public async Task<Fornecedor?> BuscarPorId(int id)
        {
            return await _context.Fornecedores.FindAsync(id);
        }

        public async Task Incluir(Fornecedor Fornecedor)
        {
            _context.Fornecedores.Add(Fornecedor);
            await _context.SaveChangesAsync();
        }

        public async Task Atualizar(Fornecedor Fornecedor)
        {
            _context.Fornecedores.Update(Fornecedor);
            await _context.SaveChangesAsync();
        }

        public async Task Deletar(int id)
        {
            var Fornecedor = await BuscarPorId(id);
            if (Fornecedor != null)
            {
                _context.Fornecedores.Remove(Fornecedor);
                await _context.SaveChangesAsync();
            }
        }
    }
}
