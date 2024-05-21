namespace Org.Ktu.Isk.P175B602.Autonuoma.Models.ContractsReport;

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;


/// <summary>
/// View model for single contract in a report.
/// </summary>
public class Sutartis
{
	[DisplayName("Mokejimas")]
	public int MokejimasID { get; set; }

	[DisplayName("Data")]
	[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
	public DateTime MokejimoData { get; set; }

	[DisplayName("Data")]
	[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
	public DateTime UzsakymoData { get; set; }

	public string Vardas { get; set; }

	public string Pavarde { get; set; }

	public string AsmensKodas { get; set; }

	[DisplayName("Užsakymų vertė")]
	public decimal Kaina { get; set; }

	public decimal MokejimoSuma  {get; set; }

	public decimal BendraSuma { get; set; }

	public decimal BendraSumaPaslaug { get; set; }

	[DisplayName("Uzsakymas")]
	public string UzsakymasID {get; set; }

	public string Statusas { get; set; }
}

/// <summary>
/// View model for whole report.
/// </summary>
public class Report
{
	[DataType(DataType.DateTime)]
	[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
	public DateTime? DateFrom { get; set; }

	[DataType(DataType.DateTime)]
	[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
	public DateTime? DateTo { get; set; }

	public List<Sutartis> Sutartys { get; set; }

	public decimal VisoSumaUzsakymu { get; set; }

	public string? KlientasID { get; set; }

	public IList<SelectListItem> Klientai { get; set; }
}
