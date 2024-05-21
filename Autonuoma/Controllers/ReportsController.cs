namespace Org.Ktu.Isk.P175B602.Autonuoma.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

using Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using LateContractsReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.LateContractsReport;
using ContractsReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.ContractsReport;
using ServicesReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.ServicesReport;


public class ReportsController : Controller
{

	[HttpGet]
	public ActionResult Services(DateTime? dateFrom, DateTime? dateTo)
	{
		var report = AtaskaitaRepo.GetTotalServicesOrdered(dateFrom, dateTo);
		report.DateFrom = dateFrom;
		report.DateTo = dateTo?.AddHours(23).AddMinutes(59).AddSeconds(59); //move time of end date to end of day

		report.Paslaugos = AtaskaitaRepo.GetServicesOrdered(dateFrom, dateTo);

		return View(report);
	}

	[HttpGet]
	public ActionResult Contracts(DateTime? dateFrom, DateTime? dateTo, string KlientasID)
	{
		var payment = new ContractsReport.Report();
		payment.DateFrom = dateFrom;
		payment.DateTo = dateTo?.AddHours(23).AddMinutes(59).AddSeconds(59); //move time of end date to end of day
		payment.KlientasID = KlientasID;

		payment.Sutartys = AtaskaitaRepo.GetContracts(payment.DateFrom, payment.DateTo, payment.KlientasID);

		var Klientai = MokejimasF2Repo.ListKlientas();

		payment.Klientai =
			Klientai
				.Select(it =>
				{
					return
						new SelectListItem
						{
							Value = Convert.ToString(it.asm_k),
							Text = $"{it.vardas} {it.pavarde}"
						};
				})
				.ToList();

		foreach (var item in payment.Sutartys)
		{
			payment.VisoSumaUzsakymu += item.Kaina;
		}

		return View(payment);
	}

	[HttpGet]
	public ActionResult LateContracts(DateTime? dateFrom, DateTime? dateTo)
	{
		var report = new LateContractsReport.Report();
		report.DateFrom = dateFrom;
		report.DateTo = dateTo?.AddHours(23).AddMinutes(59).AddSeconds(59); //move time of end date to end of day

		report.Sutartys = AtaskaitaRepo.GetLateReturnContracts(report.DateFrom, report.DateTo);

		return View(report);
	}
}
