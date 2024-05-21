namespace Org.Ktu.Isk.P175B602.Autonuoma.Models;

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;


/// <summary>
/// Model of 'Darbuotojas' entity.
/// </summary>
public class Klientas
{
	[DisplayName("Vardas")]
	[Required]
	public string vardas { get; set; }

	[DisplayName("Pavardė")]
	[Required]
	public string pavarde { get; set; }

    [DisplayName("Asmens kodas")]
	[Required]
	public int asm_k { get; set; }

    [DisplayName("Telfono nr.")]
	[Required]
	public string tel_nr { get; set; }

    [DisplayName("E-paštas")]
    [EmailAddress]
	[Required]
	public string el_pastas { get; set; }

}