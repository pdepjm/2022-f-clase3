module Library where
import PdePreludat

data Hechicero = UnHechicero {
    antiguedad :: Number,
    grado :: Number,
    clan :: String
}deriving Show

nobara = UnHechicero 1 3 "Kugisaki"
satoru = UnHechicero 15 0 "Gojo"
maki = UnHechicero 3 4 "Zenin"
yuji = UnHechicero 0 1 "Itadori"

--punto 2
tieneExperiencia :: Hechicero -> Bool
tieneExperiencia hechicero = antiguedad hechicero > 1

--punto 3
type Equipo = [Hechicero]

equipoA = [nobara, yuji, maki]

equipoB = [satoru, nobara, yuji, maki]

estaPreparado :: Equipo -> Bool
estaPreparado equipo = length equipo > 3

--punto 4 

--enfoque TOP DOWN :D

--primero pensamos la funcion principal
subirGrado :: Hechicero -> Hechicero
subirGrado unHechicero 
    | esEspecial unHechicero = unHechicero
    | otherwise = unHechicero {grado = grado unHechicero - 1}

--luego pienso la auxiliar
esEspecial :: Hechicero -> Bool
esEspecial hechicero = grado hechicero == 0

--punto 5

esPrestigioso :: Hechicero -> Bool
esPrestigioso hechicero = elem (clan hechicero) clanesPrestigiosos

clanesPrestigiosos = ["Zenin", "Kamo", "Gojo"]

--SEGUNDA PARTE

--punto 6
esInvencible :: Equipo -> Bool
esInvencible equipo = any esEspecial equipo

--punto 7 

esFavorito :: Equipo -> Bool
esFavorito equipo = all esPrestigioso equipo

--punto 8
losExpertos :: Equipo -> Equipo
losExpertos equipo = filter tieneExperiencia equipo

--punto 9.b
powerUp :: Equipo -> Equipo
powerUp equipo = map subirGrado equipo