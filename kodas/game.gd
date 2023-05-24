extends Spatial

var slavi = 0
var skoli = 0

var slav = [
	"Nuokrypis",
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
	"Kraujomaiša",
	"Rodiklis",
	"Dailyraštis",
	"Gaubtuvas",
	"Nuoma",
	"Varžybos",
	"Kaukė",
	"Gamta",
	"Stebyklas",
	"Pasirinkimas",
	"Viršūnė",
	"Baltas",
	"Cukrus",
	"Dangus",
	"Eglė",
	"Gyvatė",
	"Jūra",
	"Kalnas",
	"Laumė",
	"Mėnulis",
	"Ožys",
	"Paukštis",
	"Raštai",
	"Saulė",
	"Tamsa",
	"Ugnis",
	"Vanduo",
	"Žalias",
	"Abiejų",
	"Baltieji",
	"Citrina",
	"Dobilas",
	"Ežeras",
	"Išmintis",
	"Lazdelė",
	"Molis",
	"Nendrė",
	"Obelis",
	"Sakalas",
	"Uoga",
	"Cepelinai",
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
	"Homogeniškumas",
	"Indekas",
	"Kaligrafija",
	"Kapišonas",
	"Laktozė",
	"Lizingas",
	"Mačas",
	"Natūra",
	"Observatorija",
	"Opcija",
	"Pikas",
	"Alergija",
	"Baras",
	"Džinsai",
	"Ekspresas",
	"Festivalis",
	"Filmas",
	"Galerija",
	"Herojus",
	"Imigracija",
	"Internetas",
	"Istorikas",
	"Katedra",
	"Kompromisas",
	"Kreditas",
	"Kultūra",
	"Laboratorija",
	"Maksimalus",
	"Meniu",
	"Minimalus",
	"Motociklas",
	"Muziejus",
	"Oficialus",
	"Optika",
	"Organizacija",
	"Personažas",
	"Policija",
	"Prezidentas",
	"Problema",
	"Profesorius",
	"Produktorius",
	"Reklama",
	"Restoranas",
	"Revoliucija",
	"Seansas",
	"Sekretorius",
	"Situacija",
	"Stilistas",
	"Televizija"
]

export var zodis: PackedScene
var last = 0
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	slav.shuffle()
	skol.shuffle()
	pass # Replace with function body.


func _on_Timer_timeout():
	randomize()
	while i == last:
		i = randi()%4
	last = i
	var mok = zodis.duplicate().instance()
	if randi()%10 >= 5:
		mok.dorot(slav[slavi])
		mok.add_to_group("sl")
		slavi += 1
	else:
		mok.dorot(skol[skoli])
		mok.add_to_group("sk")
		skoli += 1
	if i == 0:
			mok.transform = $Spatial/Spawn1.transform
	if i == 1:
			mok.transform = $Spatial/Spawn2.transform
	if i == 2:
			mok.transform = $Spatial/Spawn3.transform
	if i == 3:
			mok.transform = $Spatial/Spawn4.transform
	add_child(mok)
	pass 
