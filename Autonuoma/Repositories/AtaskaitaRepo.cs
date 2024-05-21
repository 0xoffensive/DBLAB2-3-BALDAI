namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using MySql.Data.MySqlClient;

using LateContractsReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.LateContractsReport;
using ContractsReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.ContractsReport;
using ServicesReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.ServicesReport;


/// <summary>
/// Database operations related to reports.
/// </summary>
public class AtaskaitaRepo
{
	public static List<ServicesReport.Paslauga> GetServicesOrdered(DateTime? dateFrom, DateTime? dateTo)
	{
		var query =
			$@"SELECT
				pasl.id,
				pasl.pavadinimas,
				SUM(up.kiekis) AS kiekis,
				SUM(up.kiekis*up.kaina) AS suma
			FROM
				`{Config.TblPrefix}paslaugos` pasl,
				`{Config.TblPrefix}uzsakytos_paslaugos` up,
				`{Config.TblPrefix}sutartys` sut
			WHERE
				pasl.id = up.fk_paslauga
				AND up.fk_sutartis = sut.nr
				AND sut.sutarties_data >= IFNULL(?nuo, sut.sutarties_data)
				AND sut.sutarties_data <= IFNULL(?iki, sut.sutarties_data)
			GROUP BY
				pasl.id, pasl.pavadinimas
			ORDER BY
				suma DESC";

		var drc =
			Sql.Query(query, args => {
				args.Add("?nuo", dateFrom);
				args.Add("?iki", dateTo);
			});

		var result = 
			Sql.MapAll<ServicesReport.Paslauga>(drc, (dre, t) => {
				t.Id = dre.From<int>("id");
				t.Pavadinimas = dre.From<string>("pavadinimas");
				t.Kiekis = dre.From<int>("kiekis");
				t.Suma = dre.From<decimal>("suma");
			});

		return result;
	}

	public static ServicesReport.Report GetTotalServicesOrdered(DateTime? dateFrom, DateTime? dateTo)
	{
		var query =
			$@"SELECT
				SUM(up.kiekis) AS kiekis,
				SUM(up.kiekis*up.kaina) AS suma
			FROM
				`{Config.TblPrefix}paslaugos` pasl,
				`{Config.TblPrefix}uzsakytos_paslaugos` up,
				`{Config.TblPrefix}sutartys` sut
			WHERE
				pasl.id = up.fk_paslauga
				AND up.fk_sutartis = sut.nr
				AND sut.sutarties_data >= IFNULL(?nuo, sut.sutarties_data)
				AND sut.sutarties_data <= IFNULL(?iki, sut.sutarties_data)";

		var drc =
			Sql.Query(query, args => {
				args.Add("?nuo", dateFrom);
				args.Add("?iki", dateTo);
			});

		var result = 
			Sql.MapOne<ServicesReport.Report>(drc, (dre, t) => {
				t.VisoUzsakyta = dre.From<int?>("kiekis") ?? 0;
				t.BendraSuma = dre.From<decimal?>("suma") ?? 0;
			});

		return result;
	}

	public static List<ContractsReport.Sutartis> GetContracts(DateTime? dateFrom, DateTime? dateTo, string? KlientasID)
	{
		var query =
			$@"SELECT
				mok.id_Mokejimas,
				mok.data AS mokejimodata,
				mok.suma,
				mok.fk_Klientasasm_k,
				kln.vardas,
				kln.pavarde,
				uzsakymai.id_Uzsakymas,
				uzsakymai.kaina,
				uzsakymai.data as uzsakymodata,
				kainos.bendra,
				stat.name
			FROM
				`mokejimas` mok
				INNER JOIN `klientas` kln ON kln.asm_k = mok.fk_Klientasasm_k
				LEFT JOIN `mokejimo_statusas` stat ON stat.id_Mokejimo_statusas = mok.busena
				RIGHT JOIN
					(
						SELECT
							mok1.id_Mokejimas as fid,
							uzs.id_Uzsakymas,
							uzs.data,
							uzs.kaina

						FROM
							`mokejimas` mok1
							RIGHT JOIN `teikiamas_uz` teika ON teika.fk_Mokejimasid_Mokejimas = mok1.id_Mokejimas
							LEFT JOIN `uzsakymas` uzs ON uzs.id_Uzsakymas = teika.fk_Uzsakymasid_Uzsakymas
						WHERE
							mok1.data >= IFNULL(?nuo, mok1.data)
							AND mok1.data <= IFNULL(?iki, mok1.data)
						GROUP BY
							uzs.id_Uzsakymas
					) AS uzsakymai
					ON uzsakymai.fid = mok.id_Mokejimas
				
				RIGHT JOIN
					(
						SELECT
							mok2.id_Mokejimas as fid,
							IFNULL(SUM(uzs.kaina), 0) as bendra

						FROM
							`mokejimas` mok2
							RIGHT JOIN `teikiamas_uz` teika ON teika.fk_Mokejimasid_Mokejimas = mok2.id_Mokejimas
							RIGHT JOIN `uzsakymas` uzs ON uzs.id_Uzsakymas = teika.fk_Uzsakymasid_Uzsakymas
						WHERE
							mok2.data >= IFNULL(?nuo, mok2.data)
							AND mok2.data <= IFNULL(?iki, mok2.data)
						GROUP BY
							mok2.id_Mokejimas
					) AS kainos
					ON kainos.fid = mok.id_Mokejimas
			
			WHERE
				mok.data >= IFNULL(?nuo, mok.data)
				AND mok.data <= IFNULL(?iki, mok.data)
				AND mok.fk_Klientasasm_k = IFNULL(?klientas, mok.fk_Klientasasm_k)
			GROUP BY 
				uzsakymai.id_Uzsakymas
			ORDER BY 
				mok.id_Mokejimas ASC, uzsakymai.id_Uzsakymas ASC";

		var drc =
			Sql.Query(query, args => {
				args.Add("?nuo", dateFrom);
				args.Add("?iki", dateTo);
				args.Add("?klientas", KlientasID);
			});

		var result = 
			Sql.MapAll<ContractsReport.Sutartis>(drc, (dre, t) => {
				t.MokejimasID = dre.From<int>("id_Mokejimas");
				t.MokejimoData = dre.From<DateTime>("mokejimodata");
				t.MokejimoSuma = dre.From<decimal>("suma");
				t.Vardas = dre.From<string>("vardas");
				t.Pavarde = dre.From<string>("pavarde");
			 	t.UzsakymasID = dre.From<string>("id_Uzsakymas");
				t.UzsakymoData = dre.From<DateTime>("uzsakymodata");
				t.Kaina = dre.From<decimal>("kaina");
				t.BendraSuma = dre.From<decimal>("bendra");
				t.Statusas = dre.From<string>("name");
			});

		return result;
	}

	public static List<LateContractsReport.Sutartis> GetLateReturnContracts(DateTime? dateFrom, DateTime? dateTo)
	{
		var query =
			$@"SELECT
				sut.nr,
				sut.sutarties_data,
				CONCAT(kln.vardas, ' ',kln.pavarde) as klientas,
				sut.planuojama_grazinimo_data_laikas,
				IF(
					IFNULL(sut.faktine_grazinimo_data_laikas,'0000-00-00') LIKE '0000%',
					'negražinta',
					sut.faktine_grazinimo_data_laikas
				) as grazinimo_data
			FROM `{Config.TblPrefix}sutartys` sut, `{Config.TblPrefix}klientai` kln
			WHERE
				kln.asmens_kodas = sut.fk_klientas
				AND (
					DATEDIFF(sut.faktine_grazinimo_data_laikas, sut.planuojama_grazinimo_data_laikas) >= 1
					OR IFNULL(sut.faktine_grazinimo_data_laikas, '0000-00-00') like '0000%'
					AND DATEDIFF(NOW(), sut.planuojama_grazinimo_data_laikas) >=1
				)
				AND sut.sutarties_data >= IFNULL(?nuo, sut.sutarties_data)
				AND sut.sutarties_data <= IFNULL(?iki, sut.sutarties_data)";

		var drc =
			Sql.Query(query, args => {
				args.Add("?nuo", dateFrom);
				args.Add("?iki", dateTo);
			});

		var result = 
			Sql.MapAll<LateContractsReport.Sutartis>(drc, (dre, t) => {
				t.Nr = dre.From<int>("nr");
				t.SutartiesData = dre.From<DateTime>("sutarties_data");
				t.Klientas = dre.From<string>("klientas");
				t.PlanuojamaGrData = dre.From<DateTime>("planuojama_grazinimo_data_laikas");
				t.FaktineGrData = dre.From<string>("grazinimo_data");
			});

		return result;
	}
}
