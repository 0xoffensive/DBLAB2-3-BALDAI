namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using MySql.Data.MySqlClient;

using Newtonsoft.Json;
using Org.Ktu.Isk.P175B602.Autonuoma.Models;
using Org.Ktu.Isk.P175B602.Autonuoma.Models.MokejimasF2;


/// <summary>
/// Database operations related to 'Sutartis' entity.
/// </summary>
public class MokejimasF2Repo
{
    public static List<MokejimasL> ListMokejimas()
	{
		var query =
			$@"SELECT
				s.id_Mokejimas as id,
				s.data as data,
				CONCAT(d.vardas,' ', d.pavarde) as klientas,
                s.suma,
				b.name as busena
			FROM
				`mokejimas` s
				LEFT JOIN `klientas` d ON s.fk_Klientasasm_k=d.asm_k
				LEFT JOIN `mokejimo_statusas` b ON s.busena=b.id_Mokejimo_statusas
			ORDER BY s.id_Mokejimas ASC";

		var drc = Sql.Query(query);

		var result =
			Sql.MapAll<MokejimasL>(drc, (dre, t) => {
				t.id_Mokejimas = dre.From<int>("id");
				t.data = dre.From<DateTime>("data");
				t.Klientas = dre.From<string>("Klientas");
				t.suma = dre.From<decimal>("suma");
				t.busena = dre.From<string>("busena");
			});

		return result;
	}

    public static List<Mokejimo_statusas> ListMokejimoBusena()
	{
		var query = $@"SELECT * FROM `mokejimo_statusas` ORDER BY id_Mokejimo_statusas ASC";
		var drc = Sql.Query(query);

		var result =
			Sql.MapAll<Mokejimo_statusas>(drc, (dre, t) => {
				t.id_Mokejimo_statusas = dre.From<int>("id_Mokejimo_statusas");
				t.name = dre.From<string>("name");
			});

		return result;
	}

    public static List<Klientas> ListKlientas()
	{
		var query = $@"SELECT * FROM `klientas` ORDER BY asm_k ASC";
		var drc = Sql.Query(query);

		var result =
			Sql.MapAll<Klientas>(drc, (dre, t) => {
				t.vardas = dre.From<string>("vardas");
				t.pavarde = dre.From<string>("pavarde");
                t.asm_k = dre.From<int>("asm_k");
                t.tel_nr = dre.From<string>("tel_nr");
                t.el_pastas = dre.From<string>("el_pastas");
			});

		return result;
	}

	public static List<Uzsakymas> ListUzsakymasSelection()
	{
		var query = $@"SELECT
						    u.*,
							CONCAT(a.vardas, ' ', a.pavarde) as vp
					   FROM
					   		`uzsakymas` u
							LEFT JOIN `administratorius` a ON u.fk_Administratoriusasm_k = a.asm_k
					   ORDER BY id_Uzsakymas ASC";
		var drc = Sql.Query(query);

		var result =
			Sql.MapAll<Uzsakymas>(drc, (dre, t) => {
				t.UzsakymoNr = dre.From<int>("id_Uzsakymas");
				t.Kaina = dre.From<decimal>("kaina");
                t.Data = dre.From<DateTime>("data").ToString("yyyy-MM-dd");
				t.FkKlientas = dre.From<int>("fk_Klientasasm_k");
                t.Administratorius = dre.From<string>("vp");
			});

		return result;
	}

	public static List<MokejimasCE.UzsakymasM> ListTeikiamasUz(int id)
	{
		var query = $@"SELECT *
					   FROM `teikiamas_uz`
					   WHERE fk_Mokejimasid_Mokejimas=?id
					   ORDER BY fk_Uzsakymasid_Uzsakymas ASC";
		var drc =
			Sql.Query(query, args => {
				args.Add("?id", id);
			});

		var result =
			Sql.MapAll<MokejimasCE.UzsakymasM>(drc, (dre, t) => {
				t.UzsakymoNr = dre.From<int>("fk_Uzsakymasid_Uzsakymas");
			});

		return result;
	}

	public static MokejimasCE FindMokejimasCE(int mokejimo_nr)
    {
        var query = 
            $@"SELECT * FROM `mokejimas` WHERE  id_Mokejimas=?mokejimo_nr";

        var drc = 
            Sql.Query(query, args => {
                args.Add("?mokejimo_nr", mokejimo_nr);
            });
        var result =
            Sql.MapOne<MokejimasCE>(drc, (dre, t) => {
                //make a shortcut
                var pr = t.Mokejimas;

                pr.data = dre.From<DateTime>("data");
                pr.suma = dre.From<decimal>("suma");
                pr.busena = dre.From<string>("busena");
                pr.id_Mokejimas = dre.From<int>("id_Mokejimas");
                pr.fk_Klientasasm_k = dre.From<string>("fk_Klientasasm_k");
                
            });
        return result;
    }

	public static int InsertMokejimas(MokejimasCE mokCE)
	{
		var squery = @"SELECT MAX(id_Mokejimas) as maxid FROM mokejimas";
		var rtc = Sql.Query(squery);
		int autoID = 0;
		var res = Sql.MapOne<MokejimasCE>(rtc, (dre, t) => {
			autoID = dre.From<int>("maxid");
		});
		autoID++;
		var query =
			$@"INSERT INTO `mokejimas`
			(
				`id_Mokejimas`,
				`data`,
				`suma`,
				`busena`,
				`fk_Klientasasm_k`
			)
			VALUES(
				?id,
				?data,
				?suma,
				?busena,
				?fk
			)";

		var nr =
			Sql.Insert(query, args => {
				//make a shortcut
				var sut = mokCE.Mokejimas;
				//
				args.Add("?id", autoID);
				args.Add("?data", sut.data);
				args.Add("?suma", sut.suma);
				args.Add("?busena", sut.busena);
				args.Add("?fk", sut.fk_Klientasasm_k);
			});

		//return (int)nr;
		return autoID;
	}

	public static void InsertTeikiamasUz(int id, MokejimasCE.UzsakymasM up)
	{
		var query =
			$@"INSERT INTO `teikiamas_uz`
			(
				`fk_Mokejimasid_Mokejimas`,
				`fk_Uzsakymasid_Uzsakymas`
			)
			VALUES(
				?fkMok,
				?fkUzsak
			)";

		var nr =
			Sql.Insert(query, args => {

				args.Add("?fkMok", id);
				args.Add("?fkUzsak", up.UzsakymoNr);
			});
	}

		public static void UpdateMokejimas(MokejimasCE mokCE)
	{
		var query =
			$@"UPDATE `mokejimas`
			SET
				`data` = ?d,
				`suma` = ?s,
				`busena` = ?b,
				`fk_Klientasasm_k` = ?fkk
			WHERE id_Mokejimas=?nr";

		Sql.Update(query, args => {
			//make a shortcut
			var sut = mokCE.Mokejimas;
			//
			args.Add("?d", sut.data);
			args.Add("?s", sut.suma);
			args.Add("?b", sut.busena);
			args.Add("?fkk", sut.fk_Klientasasm_k);

			args.Add("?nr", sut.id_Mokejimas);
		});
	}

	public static void DeleteMokejimas(int id_Mokejimas)
    {
        var query = $@"DELETE FROM `mokejimas` WHERE id_Mokejimas = ?mokejimo_nr;";
		Sql.Delete(query, args => {
			args.Add("?mokejimo_nr", id_Mokejimas);
		});
    }

	public static void DeleteTeikiamasUz(int id_Mokejimas)
	{
        var query = $@"DELETE FROM `teikiamas_uz` WHERE fk_Mokejimasid_Mokejimas = ?mokejimo_nr;";
		Sql.Delete(query, args => {
			args.Add("?mokejimo_nr", id_Mokejimas);
		});
	}
}