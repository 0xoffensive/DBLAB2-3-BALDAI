namespace Org.Ktu.Isk.P175B602.Autonuoma.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

using Newtonsoft.Json;

using Org.Ktu.Isk.P175B602.Autonuoma.Repositories;
using Org.Ktu.Isk.P175B602.Autonuoma.Models.MokejimasF2;
using Org.Ktu.Isk.P175B602.Autonuoma.Models;

// using Org.Ktu.Isk.P175B602.Autonuoma.Repositories;
// using Org.Ktu.Isk.P175B602.Autonuoma.Models.Mokejimas;
// using Org.Ktu.Isk.P175B602.Autonuoma.Models.Administratorius;
// using Org.Ktu.Isk.P175B602.Autonuoma.Models.Statusas;
// using Org.Ktu.Isk.P175B602.Autonuoma.Models.Uzsakymas;

public class MokejimasController : Controller
{
	[HttpGet]
	public ActionResult Index()
	{
		return View(MokejimasF2Repo.ListMokejimas());
	}

	[HttpGet]
	public ActionResult Create()
	{
		var mokCE = new MokejimasCE();
		mokCE.Mokejimas.data = DateTime.Now;
		
		PopulateLists(mokCE);

		return View(mokCE);
	}

	[HttpPost]
	public ActionResult Create(int? save, int? add, int? remove, MokejimasCE mokCE)
	{
		if( add != null )
		{
			var up =
				new MokejimasCE.UzsakymasM {
					InListId = mokCE.UzsakymaiList.Count > 0 ? mokCE.UzsakymaiList.Max(it => it.InListId) + 1 : 0,
					UzsakymoNr = null

				};
			mokCE.UzsakymaiList.Add(up);

			ModelState.Clear();

			//go back to the form
			PopulateLists(mokCE);
			return View(mokCE);
		}

		if( remove != null )
		{
			mokCE.UzsakymaiList =
				mokCE
					.UzsakymaiList
					.Where(it => it.InListId != remove.Value)
					.ToList();

			ModelState.Clear();

			PopulateLists(mokCE);
			return View(mokCE);
		}

		if( save != null )
		{
			//form field validation passed?
			if( ModelState.IsValid )
			{
				for( var i = 0; i < mokCE.UzsakymaiList.Count-1; i ++ )
				{
					var refUp = mokCE.UzsakymaiList[i];

					for( var j = i+1; j < mokCE.UzsakymaiList.Count; j++ )
					{
						var testUp = mokCE.UzsakymaiList[j];
					
						if( testUp.UzsakymoNr == refUp.UzsakymoNr )
							ModelState.AddModelError($"Uzsakymai[{j}].UzsakymoNr", "Užsakymo dublikatas.");
					}
				}

				if( mokCE.Mokejimas.data > DateTime.Now)
				{
					ViewData["savingNotPermitted"] = true;
					PopulateLists(mokCE);
					return View(mokCE);
				}

				int id = MokejimasF2Repo.InsertMokejimas(mokCE);

				foreach( var upVm in mokCE.UzsakymaiList )
					MokejimasF2Repo.InsertTeikiamasUz(id, upVm);

				//save success, go back to the entity list
				return RedirectToAction("Index");
			}
			//form field validation failed, go back to the form
			else
			{
				PopulateLists(mokCE);
				return View(mokCE);
			}
		}

		//should not reach here
		throw new Exception("Should not reach here.");
	}

	[HttpGet]
	public ActionResult Edit(int id)
	{
		var mokCE = MokejimasF2Repo.FindMokejimasCE(id);
		
		var c = MokejimasF2Repo.ListTeikiamasUz(id);
		for(int i = 0; i < c.Count; i++)
		{
			mokCE.UzsakymaiList.Add(new MokejimasCE.UzsakymasM{InListId = i, UzsakymoNr = c[i].UzsakymoNr});
		}	
		PopulateLists(mokCE);

		return View(mokCE);
	}

	[HttpPost]
	public ActionResult Edit(int id, int? save, int? add, int? remove, MokejimasCE mokCE)
	{
		if( add != null )
		{
			var up =
				new MokejimasCE.UzsakymasM {
					InListId = mokCE.UzsakymaiList.Count > 0 ? mokCE.UzsakymaiList.Max(it => it.InListId) + 1 : 0,
					UzsakymoNr = null

				};
			mokCE.UzsakymaiList.Add(up);

			ModelState.Clear();

			//go back to the form
			PopulateLists(mokCE);
			return View(mokCE);
		}

		if( remove != null )
		{
			mokCE.UzsakymaiList =
				mokCE
					.UzsakymaiList
					.Where(it => it.InListId != remove.Value)
					.ToList();

			ModelState.Clear();

			PopulateLists(mokCE);
			return View(mokCE);
		}

		if( save != null )
		{
			for( var i = 0; i < mokCE.UzsakymaiList.Count-1; i ++ )
			{
				var refUp = mokCE.UzsakymaiList[i];

				for( var j = i+1; j < mokCE.UzsakymaiList.Count; j++ )
				{
					var testUp = mokCE.UzsakymaiList[j];
				
					if( testUp.UzsakymoNr == refUp.UzsakymoNr )
						ModelState.AddModelError($"Uzsakymai[{j}].UzsakymoNr", "Užsakymo dublikatas.");
				}
			}

			if( mokCE.Mokejimas.data > DateTime.Now)
			{
				ViewData["editingNotPermitted"] = true;
				PopulateLists(mokCE);
				return View(mokCE);
			}


			if( ModelState.IsValid )
			{
				MokejimasF2Repo.UpdateMokejimas(mokCE);

				MokejimasF2Repo.DeleteTeikiamasUz(mokCE.Mokejimas.id_Mokejimas);

				foreach( var upVm in mokCE.UzsakymaiList )
					MokejimasF2Repo.InsertTeikiamasUz(mokCE.Mokejimas.id_Mokejimas, upVm);

				return RedirectToAction("Index");
			}
			else
			{
				PopulateLists(mokCE);
				return View(mokCE);
			}
		}

		//should not reach here
		throw new Exception("Should not reach here.");
	}
	
	[HttpGet]
	public ActionResult Delete(int id)
	{
		var sutCE = MokejimasF2Repo.FindMokejimasCE(id);
		return View(sutCE);
	}

	[HttpPost]
	public ActionResult DeleteConfirm(int id)
	{
		var mokCE = MokejimasF2Repo.FindMokejimasCE(id);

		//if( mokCE.Mokejimas.busena == "1" )
		//{
			MokejimasF2Repo.DeleteTeikiamasUz(mokCE.Mokejimas.id_Mokejimas);
			MokejimasF2Repo.DeleteMokejimas(id);

			return RedirectToAction("Index");
		//}
		/*else
		{
			ViewData["deletionNotPermitted"] = true;
			return View("Delete", mokCE);
		}*/
	}
	private void PopulateLists(MokejimasCE sutCE)
	{
		var Klientas = MokejimasF2Repo.ListKlientas();
		var Busena = MokejimasF2Repo.ListMokejimoBusena();
		var Uzsakymas = MokejimasF2Repo.ListUzsakymasSelection();

		//build select lists
		sutCE.Lists.Klientai =
			Klientas
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

		sutCE.Lists.Busenos =
			Busena
				.Select(it =>
				{
					return
						new SelectListItem
						{
							Value = Convert.ToString(it.id_Mokejimo_statusas),
							Text = it.name
						};
				})
				.ToList();

		sutCE.Lists.Uzsakymai =
			Uzsakymas
				.Select(it =>
				{
					return
						new SelectListItem
						{
							Value = Convert.ToString(it.UzsakymoNr),
							Text = $"ID: {it.UzsakymoNr}; Administratorius: {it.Administratorius}; Data: {it.Data}"
						};
				})
				.ToList();

	}
}