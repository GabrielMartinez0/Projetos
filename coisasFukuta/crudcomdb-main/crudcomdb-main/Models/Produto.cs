using System.ComponentModel.DataAnnotations.Schema;

namespace crudcomdb.Models
{
    public class Produto
    {
        public int Id { get; set; }
        public string CodigoReferencia { get; set; } = string.Empty;
        public string CodeBar { get; set; } = string.Empty;
        public string Unidade { get; set; } = string.Empty;   // Ex: UN, PC, KG, LT
        public string Descricao { get; set; } = string.Empty;
        public decimal PrecoVenda { get; set; }
        public decimal PrecoCusto { get; set; }
        public decimal MargemLucro { get; set; }
        public decimal DescontoMaximo { get; set; }
        public decimal EstoqueMinimo { get; set; }
        public decimal EstoqueMaximo { get; set; }
        public decimal EstoqueAtual { get; set; }
      
        public int CategoriaId { get; set; }
        
        [ForeignKey("CategoriaId")]
        public Categoria? Categoria { get; set; }
        

    }
}