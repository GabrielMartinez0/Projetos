using crudcomdb.Models;
using crudcomdb.Interfaces;
using Microsoft.EntityFrameworkCore;
using crudcomdb.Data;

namespace crudcomdb.Repositories
{
    public class CategoriaRepository : ICategoriaRepository
    {
        private readonly AppDbContext _context;

        public CategoriaRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Categoria>> Listar()
        {
            return await _context.Categorias.ToListAsync();
        }

        public async Task<Categoria?> BuscarPorId(int id)
        {
            return await _context.Categorias.FindAsync(id);
        }

        public async Task Salvar(Categoria categoria)
        {
            _context.Categorias.Add(categoria);
            await _context.SaveChangesAsync();
        }

        public async Task Atualizar(Categoria categoria)
        {
            _context.Categorias.Update(categoria);
            await _context.SaveChangesAsync();
        }

        public async Task Deletar(int id)
        {
            var Categoria = await BuscarPorId(id);
            if (Categoria != null)
            {
                _context.Categorias.Remove(Categoria);
                await _context.SaveChangesAsync();
            }
        }
    }
}
