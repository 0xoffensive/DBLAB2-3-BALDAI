namespace Org.Ktu.Isk.P175B602.Autonuoma.Models;

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;


/// <summary>
/// For SelectItemList only, otherwise it's gonna be bad x_x
/// </summary>
public class Uzsakymas
{
	public int UzsakymoNr { get; set; }
	public decimal Kaina { get; set; }
	public string Data { get; set; }
	public string Administratorius { get; set; }
	public int FkKlientas { get; set; }

}