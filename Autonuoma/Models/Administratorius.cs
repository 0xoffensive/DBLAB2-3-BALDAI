namespace Org.Ktu.Isk.P175B602.Autonuoma.Models.Administratorius;

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;
//using Org.Ktu.Isk.P175B602.Autonuoma.Models.Mokejimas;

public class AdministratoriusL
{
    [DisplayName("Vardas")]
    public string Vardas {get; set; }

    [DisplayName("Pavarde")]
    public string Pavarde {get; set; }
    
    [DisplayName("El_Pastas")]
    public string El_Pastas {get; set; }

    [DisplayName("Tel_nr")]
    public string Tel_nr {get; set; }

    [DisplayName("Asm_k")]
    public int Asm_k {get; set; }
}