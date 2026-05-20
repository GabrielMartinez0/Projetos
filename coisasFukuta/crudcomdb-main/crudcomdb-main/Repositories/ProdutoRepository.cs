using crudcomdb.Models;
using crudcomdb.Interfaces;
using Microsoft.EntityFrameworkCore;
using crudcomdb.Data;

namespace crudcomdb.Repositories
{
    
    public class ProdutoRepository : IProdutoRepository
    {
        private readonly AppDbContext _context;

        public ProdutoRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Produto>> Listar()
        {
            return await _context.Produtos.AsNoTracking().ToListAsync();
        }

        public async Task<Produto?> BuscarPorId(int id)
        {
            return await _context.Produtos.FindAsync(id);
        }

        public async Task Salvar(Produto Produto)
        {
            _context.Produtos.Add(Produto);
            await _context.SaveChangesAsync();
        }

        public async Task Atualizar(Produto produto)
        {
            // Verifica se já existe uma instância com o mesmo ID sendo rastreada
            var local = _context.Produtos
                .Local
                .FirstOrDefault(entry => entry.Id.Equals(produto.Id));

            // Se existir, precisamos "desgrudar" (detach) ela do contexto
            if (local != null)
            {
                _context.Entry(local).State = EntityState.Detached;
            }

            // Agora o EF aceita rastrear a sua nova instância (a que veio do Modal)
            _context.Entry(produto).State = EntityState.Modified;
            
            await _context.SaveChangesAsync();
        }

        public async Task Deletar(int id)
        {
            var Produto = await BuscarPorId(id);
            if (Produto != null)
            {
                _context.Produtos.Remove(Produto);
                await _context.SaveChangesAsync();
            }
        }
    }
}
