namespace Org.Ktu.Isk.P175B602.Autonuoma.Models.MokejimasF2;

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

public class MokejimasL 
{
    [DisplayName("Data")]
    [DataType(DataType.Date)]
    [DisplayFormat(DataFormatString ="{0:yyyy-MM-dd}")]
    public DateTime data {get; set; }

    [DisplayName("Suma")]
    public decimal suma {get; set;}

    [DisplayName("Mokėjimo nr.")]
    public int mokejimo_nr {get; set; }

    [DisplayName("Būsena")]
    public string busena { get; set; } 

    [DisplayName("Mokėjimo nr.")]
    public int id_Mokejimas {get; set; }

    [DisplayName("Klientas")]
    public string Klientas {get; set; }

}

public class MokejimasCE
{
    public class MokejimasM
    {
        [DisplayName("Data")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString ="{0:yyyy-MM-dd}")]
        [Required]
        public DateTime data {get; set; }

        [DisplayName("Suma")]
        [Required]
        [Range(0.01, Double.MaxValue, ErrorMessage = "This value cannot be zero")]
        public decimal suma {get; set;}

        [DisplayName("Būsena")]
        [Required]
        public string busena { get; set; } 

        [DisplayName("Mokėjimo nr.")]
        [Required]
        public int id_Mokejimas {get; set; }

        [DisplayName("Klientas")]
        [Required]
        public string fk_Klientasasm_k {get; set; }

    }

    /// <summary>
    /// ENUMERATORIAI ir klientas pardavejas
    /// </summary>
    public class ListsM
    {
        public IList<SelectListItem> Busenos { get; set; }
		public IList<SelectListItem> Klientai { get; set; }
        public IList<SelectListItem> Uzsakymai { get; set; }
    }

    public class UzsakymasM
    {
        public int InListId { get; set; }

        [Required]
        public int? UzsakymoNr { get; set; }
    }

    public MokejimasM Mokejimas { get; set; } = new MokejimasM();

	public IList<UzsakymasM> UzsakymaiList { get; set; } = new List<UzsakymasM>();

	public ListsM Lists { get; set; } = new ListsM();
}

public class Mokejimo_statusas
{
    public int id_Mokejimo_statusas {get; set; }
    public string name {get; set;}
}