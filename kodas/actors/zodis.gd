extends RigidBody

var slav = [
	"Nuokrypis",
	"Sugertuvas",
	"Dvinaris",
	"Slydimas",
	"Būdas",
	"Ritinys",
	"Puošyba",
	"Nustatymas",
	"Savanaudiškumas",
	"Išvyka",
	"Byla",
	"Veiksnys",
	"Pirtis",
	"Vienalytiškumas",
	"Kraujomaiša",
	"Rodiklis",
	"Dailyraštis",
	"Gaubtuvas",
	"Pieno cukrus",
	"Nuoma",
	"Varžybos",
	"Kaukė",
	"Gamta",
	"Inkstų uždegimas",
	"Stebykla",
	"Pasirinkimas",
	"Viršūnė"
]

var skol = [
	"Aberacija",
	"Absorberis",
	"Binomas",
	"Buksavimas",
	"Charakteris",
	"Cilindras",
	"Dekoras",
	"Diagnozė",
	"Egoizmas",
	"Ekskursija",
	"Failas",
	"Faktorius",
	"Hamamas",
	"Homogeniškumas",
	"Incestas",
	"Indekas",
	"Kaligrafija",
	"Kapišonasa",
	"Laktozė",
	"Lizingas",
	"Mačas",
	"Maskė",
	"Natūra",
	"Nefritas",
	"Observatorija",
	"Opcija",
	"Pikas"
]

func _ready():
	randomize()
	if randi() % 2 == 1:
		slav.shuffle()
		$MeshInstance.mesh.text = slav[0]
		$CollisionShape.make_convex_from_brothers()
		add_to_group("sl")
	else:
		skol.shuffle()
		$MeshInstance.mesh.text = skol[0]
		$CollisionShape.make_convex_from_brothers()
		add_to_group("sk")
	pass
